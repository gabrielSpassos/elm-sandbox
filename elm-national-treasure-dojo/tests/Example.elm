module Example exposing (..)

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
