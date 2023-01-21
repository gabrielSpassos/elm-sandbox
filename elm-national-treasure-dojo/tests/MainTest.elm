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
    describe "should return time wasted by transport"
        [
            test "should return 24 for plane" <|
                \_ -> Expect.equal ("plane", 24) (calculateTimeWastedByTransport 720 "plane")
            , test "should return 52.583333333333336 for car" <|
                \_ -> Expect.equal ("car", 52.583333333333336) (calculateTimeWastedByTransport 315.5 "car")
            , test "should return 436.5 for motorcycle" <|
                \_ -> Expect.equal ("motorcycle", 436.5) (calculateTimeWastedByTransport 5238 "motorcycle")
            , test "should return 262.745 for boat" <|
                \_ -> Expect.equal ("boat", 262.745) (calculateTimeWastedByTransport 1576.47 "boat")
            , test "should return invalid response" <|
                \_ -> Expect.equal ("invalid transport", -1) (calculateTimeWastedByTransport 10 "bike")
        ]


testCalculateTimeWastedByEachTransport : Test
testCalculateTimeWastedByEachTransport = 
    let
        expectedResult = 
            [("plane", 40), ("car", 200), ("motorcycle", 100), ("boat", 200)]
    in
    test "Should return time wasted for each transport"
        (\_ -> Expect.equal expectedResult (calculateTimeWastedByEachTransport 1200))
