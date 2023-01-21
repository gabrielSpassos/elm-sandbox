module Main exposing (..)

import Html


calculateDistanceInKilometers startPoint finishPoint =
    finishPoint - startPoint


calculateTimeWastedByEachTransport distanceInKilometers = 
    let
        transports = ["plane", "car", "motorcycle", "boat"]
    in
        List.map (calculateTimeWastedByTransport distanceInKilometers) transports


calculateTimeWastedByTransport distanceInKilometers transport =
    if transport == "plane" then
        (transport, calculateTimeWasted distanceInKilometers 2)
    else if transport == "car" then
        (transport, calculateTimeWasted distanceInKilometers 10)
    else if transport == "motorcycle" then
        (transport, calculateTimeWasted distanceInKilometers 5)
    else if transport == "boat" then
        (transport, calculateTimeWasted distanceInKilometers 10)
    else
        ("invalid transport", -1)


calculateTimeWasted distanceInKilometers timeToDoOneKilometer = 
    let
        oneKilometer = 
            1
    in
    convertMinutesToHours ((distanceInKilometers * timeToDoOneKilometer) / oneKilometer)


convertMinutesToHours : Float -> Float
convertMinutesToHours timeInMinutes =
    timeInMinutes / 60


main =
    calculateDistanceInKilometers 0 1000
        |> calculateTimeWastedByEachTransport
        |> Debug.toString
        |> Html.text