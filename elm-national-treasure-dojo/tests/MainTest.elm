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
    let
        plane = 
            {name = "plane", timeToDoOneKilometer = 2, maxPassagers = 9999, extraTimeMultiplier = 1}
    in
    describe "should calculate time wasted"
        [
            test "should return 5 hours" <|
                \_ -> Expect.within (Absolute 0.1) 5 (calculateTimeWasted 150 1 plane)
            , test "should return 48.1 hours" <|
                \_ -> Expect.within (Absolute 0.1) 48.1 (calculateTimeWasted 1440 1 plane)
        ]


testCalculateTimeWastedByTransport : Test
testCalculateTimeWastedByTransport = 
    let
        plane = 
            {name = "plane", timeToDoOneKilometer = 2, maxPassagers = 9999, extraTimeMultiplier = 1}

        car = 
            {name = "car", timeToDoOneKilometer = plane.timeToDoOneKilometer * 5, maxPassagers = 5, extraTimeMultiplier = 0.15}

        motorcycle = 
            {name = "motorcycle", timeToDoOneKilometer = car.timeToDoOneKilometer / 2, maxPassagers = 2, extraTimeMultiplier = 0.1}

        boat = 
            {name = "boat", timeToDoOneKilometer = motorcycle.timeToDoOneKilometer * 2, maxPassagers = 6, extraTimeMultiplier = 0.05}

        expectedPlaneResult = 
            {transportName = "plane", distanceInKilometers = 720, timeToDoOneKilometer = 2, totalTimeWasted = 24}
        
        expectedCarResult = 
             {transportName = "car", distanceInKilometers = 315.5, timeToDoOneKilometer = 10, totalTimeWasted = 52.58}

        expectedMotorcycleResult = 
             {transportName = "motorcycle", distanceInKilometers = 5238, timeToDoOneKilometer = 5, totalTimeWasted = 436.5}

        expectedBoatResult = 
             {transportName = "boat", distanceInKilometers = 1576.47, timeToDoOneKilometer = 10, totalTimeWasted = 262.75}
    in
    describe "should return time wasted by transport"
        [
            test "should return 24 for plane" <|
                \_ -> Expect.equal expectedPlaneResult (calculateTimeWastedByTransport 720 1 plane)
            , test "should return 52.583333333333336 for car" <|
                \_ -> Expect.equal expectedCarResult (calculateTimeWastedByTransport 315.5 1 car)
            , test "should return 436.5 for motorcycle" <|
                \_ -> Expect.equal expectedMotorcycleResult (calculateTimeWastedByTransport 5238 1 motorcycle)
            , test "should return 262.745 for boat" <|
                \_ -> Expect.equal expectedBoatResult (calculateTimeWastedByTransport 1576.47 1 boat)
        ]


testCalculateTimeWastedByEachTransport : Test
testCalculateTimeWastedByEachTransport = 
    let
        expectedResult = 
            [{transportName = "plane", distanceInKilometers = 1200, timeToDoOneKilometer = 2, totalTimeWasted = 40},
             {transportName = "car", distanceInKilometers = 1200, timeToDoOneKilometer = 10, totalTimeWasted = 200.3},
             {transportName = "motorcycle", distanceInKilometers = 1200, timeToDoOneKilometer = 5, totalTimeWasted = 100.1},
             {transportName = "boat", distanceInKilometers = 1200, timeToDoOneKilometer = 10, totalTimeWasted = 200.1}]
    in
    test "Should return time wasted for each transport"
        (\_ -> Expect.equal expectedResult (calculateTimeWastedByEachTransport 8 1200))

