module Main exposing (..)

import Html


calculateDistanceInKilometers startPoint finishPoint =
    finishPoint - startPoint


getTransports =
    let
        plane = {name = "plane", timeToDoOneKilometer = 2}
        car = {name = "plane", timeToDoOneKilometer = 10}
        motorcycle = {name = "plane", timeToDoOneKilometer = 5}
        boat = {name = "plane", timeToDoOneKilometer = 10}
    in
    [plane, car, motorcycle, boat]


calculateTimeWastedByEachTransport distanceInKilometers = 
    let
        transports = 
            getTransports
    in
        List.map (calculateTimeWastedByTransport distanceInKilometers) transports


type alias TravelSummary = 
    { 
        transportName : String,
        distanceInKilometers : Float,
        timeToDoOneKilometer : Float,
        totalTimeWasted: Float
    }


calculateTimeWastedByTransport distanceInKilometers transport =
    TravelSummary transport.name distanceInKilometers transport.timeToDoOneKilometer (calculateTimeWasted distanceInKilometers transport.timeToDoOneKilometer)


calculateTimeWasted distanceInKilometers timeToDoOneKilometer = 
    let
        oneKilometer = 
            1
    in
    convertMinutesToHours ((distanceInKilometers * timeToDoOneKilometer) / oneKilometer)


convertMinutesToHours timeInMinutes =
    timeInMinutes / 60


main =
    calculateDistanceInKilometers 0 940
        |> calculateTimeWastedByEachTransport
        |> Debug.toString
        |> Html.text