module Playground exposing (main)

import Html


escapeEarth myVelocity mySpeed=
    let
        escapeVelocityInKmPerSec =
            11.186

        orbitalSpeedInKmPerSec =
            7.67

        fuel = 
            "full"
        
        whereToLand fuelAmount =
            if fuelAmount == "low" then
                "Land on droneship"

            else
                "Land on launchpad"
    in
    if myVelocity > escapeVelocityInKmPerSec then
        "Godspeed"

    else if mySpeed == orbitalSpeedInKmPerSec then
        "Stay in orbit"

    else
        whereToLand fuel


computeSpeed distance time =
    distance / time


computeTime startTime endTime =
    endTime - startTime


add a b =
    a + b


multiply c d =
    c * d


divide e f =
    e / f


weekday dayInNumber =
    case dayInNumber of
        0 ->
            "Sunday"

        1 ->
            "Monday"

        2 ->
            "Tuesday"

        3 ->
            "Wednesday"

        4 ->
            "Thursday"

        5 ->
            "Friday"

        6 ->
            "Saturday"

        _ ->
            "Unknown day"


revelation =
    """
    It became very clear to me sitting out there today
    that every decision I've made in my entire life has
    been wrong. My life is the complete "opposite" of
    everything I want it to be. Every instinct I have,
    in every aspect of life, be it something to wear,
    something to eat - it's all been wrong.
    This is a \"Test\", really \'fun\'.
    And this is how we do \\
    """


main =
    computeTime 2 3
        |> computeSpeed 7.2
        |> escapeEarth 1
        |> Html.text


{-
main =
    divide 30 10
        |> multiply 10
        |> add 5
        |> String.fromFloat
        |> Html.text
-}

{-
main =
    Html.text <| String.fromFloat <| add 5 <| multiply 10 <| divide 30 10
-}

{-
main =
    Html.text <| weekday 5
-}

{-
main =
    Html.text revelation
-}