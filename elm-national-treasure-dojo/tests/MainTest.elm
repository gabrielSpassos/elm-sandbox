module MainTest exposing (..)

import Expect exposing (Expectation, FloatingPointTolerance(..))
import Fuzz exposing (Fuzzer, int, list, string)
import Main exposing (..)
import Test exposing (..)


testCalculateDistanceInKilometers : Test
testCalculateDistanceInKilometers = 
    describe "should return the distance between two points"
        [
            test "should return 120 kilometers" <|
                \_ -> Expect.equal 120 (calculateDistanceInKilometers 120 240)
            , test "should return" <|
                \_ -> Expect.within (Absolute 0.1) 326.9 (calculateDistanceInKilometers 500.01 826.90)
        ]


testConvertMinutesToHours : Test
testConvertMinutesToHours =
    describe "should convert minutes to hours"
        [   test "should return 2 hours" <|
                \_ -> Expect.equal 2 (convertMinutesToHours 120)
            , test "should return 7.6 hours" <|
                \_ -> Expect.within (Absolute 0.1) 7.6 (convertMinutesToHours 458)
        ]


testCalculateTimeWasted : Test
testCalculateTimeWasted = 
    describe "should calculate time wasted"
        [
            test "should return 5 hours" <|
                \_ -> Expect.within (Absolute 0.1) 5 (calculateTimeWasted 30 10)
            , test "should return 48.1 hours" <|
                \_ -> Expect.within (Absolute 0.1) 48.1 (calculateTimeWasted 111 26)
        ]


testCalculateTimeWastedByTransport : Test
testCalculateTimeWastedByTransport = 
    let
        expectedPlaneResult = 
            {transportName = "plane", distanceInKilometers = 720, timeToDoOneKilometer = 2, totalTimeWasted = 24}
        
        expectedCarResult = 
             {transportName = "car", distanceInKilometers = 315.5, timeToDoOneKilometer = 10, totalTimeWasted = 52.583333333333336}

        expectedMotorcycleResult = 
             {transportName = "motorcycle", distanceInKilometers = 5238, timeToDoOneKilometer = 5, totalTimeWasted = 436.5}

        expectedBoatResult = 
             {transportName = "boat", distanceInKilometers = 1576.47, timeToDoOneKilometer = 10, totalTimeWasted = 262.745}
    in
    describe "should return time wasted by transport"
        [
            test "should return 24 for plane" <|
                \_ -> Expect.equal expectedPlaneResult (calculateTimeWastedByTransport 720 {name = "plane", timeToDoOneKilometer = 2})
            , test "should return 52.583333333333336 for car" <|
                \_ -> Expect.equal expectedCarResult (calculateTimeWastedByTransport 315.5 {name = "car", timeToDoOneKilometer = 10})
            , test "should return 436.5 for motorcycle" <|
                \_ -> Expect.equal expectedMotorcycleResult (calculateTimeWastedByTransport 5238 {name = "motorcycle", timeToDoOneKilometer = 5})
            , test "should return 262.745 for boat" <|
                \_ -> Expect.equal expectedBoatResult (calculateTimeWastedByTransport 1576.47 {name = "boat", timeToDoOneKilometer = 10})
        ]


testCalculateTimeWastedByEachTransport : Test
testCalculateTimeWastedByEachTransport = 
    let
        expectedResult = 
            [{transportName = "plane", distanceInKilometers = 1200, timeToDoOneKilometer = 2, totalTimeWasted = 40},
             {transportName = "car", distanceInKilometers = 1200, timeToDoOneKilometer = 10, totalTimeWasted = 200},
             {transportName = "motorcycle", distanceInKilometers = 1200, timeToDoOneKilometer = 5, totalTimeWasted = 100},
             {transportName = "boat", distanceInKilometers = 1200, timeToDoOneKilometer = 10, totalTimeWasted = 200}]
    in
    test "Should return time wasted for each transport"
        (\_ -> Expect.equal expectedResult (calculateTimeWastedByEachTransport 1200))

