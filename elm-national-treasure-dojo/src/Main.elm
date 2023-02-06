module Main exposing (..)

import Html
import Round exposing (..)



calculateDistanceInKilometers startPoint finishPoint =
    finishPoint - startPoint


type alias Vehicle = 
    { 
        name : String,
        timeToDoOneKilometer : Float,
        maxPassagers : Int,
        extraTimeMultiplier: Float
    }


getTransports =
    let
        plane = 
            Vehicle "plane" 2 9999 1
        car = 
            Vehicle "car" (plane.timeToDoOneKilometer * 5) 5 0.15
        motorcycle = 
            Vehicle "motorcycle" (car.timeToDoOneKilometer / 2) 2 0.1
        boat = 
            Vehicle "boat" (motorcycle.timeToDoOneKilometer * 2) 6 0.05
    in
    [plane, car, motorcycle, boat]


calculateTimeWastedByEachTransport crewQuantity distanceInKilometers = 
    let
        transports = 
            getTransports
    in
        List.map (calculateTimeWastedByTransport distanceInKilometers crewQuantity) transports


type alias TravelSummary = 
    { 
        transportName : String,
        distanceInKilometers : Float,
        timeToDoOneKilometer : Float,
        totalTimeWasted: Float
    }


calculateTimeWastedByTransport distanceInKilometers crewQuantity transport =
    TravelSummary 
        transport.name
        distanceInKilometers
        transport.timeToDoOneKilometer
        (calculateTimeWasted distanceInKilometers crewQuantity transport)


calculateTimeWasted distanceInKilometers crewQuantity transport = 
    if crewQuantity > transport.maxPassagers then
        distanceInKilometers * transport.timeToDoOneKilometer
            |> increseTime transport.extraTimeMultiplier
            |> convertMinutesToHours
    else
        convertMinutesToHours (distanceInKilometers * transport.timeToDoOneKilometer)


increseTime extraTimeMultiplier timeWasted =
    timeWasted + (timeWasted * extraTimeMultiplier / 100)


convertMinutesToHours timeInMinutes =
    roundNum 2 (timeInMinutes / 60)


main =
    calculateDistanceInKilometers 1000 2000
        |> calculateTimeWastedByEachTransport 8
        |> Debug.toString
        |> Html.text