module Main exposing (main)

import Html


getInput startPoint finishPoint crewQuantity =
    calculateDistanceInKilometers startPoint finishPoint
        |> calculateTimeWasted
        |> String.fromFloat


calculateDistanceInKilometers startPoint finishPoint =
    finishPoint - startPoint


convertMinutesToHours timeInMinutes = 
    timeInMinutes / 60


calculateTimeWasted distanceInKilometers = 
    let 
        kilometersToTimeMap = 
            { kilometers = 1, timeWasted = 10 }
    in
    convertMinutesToHours ((distanceInKilometers * kilometersToTimeMap.timeWasted) / kilometersToTimeMap.kilometers)


main =
    getInput 0 1000 4
        |> Html.text