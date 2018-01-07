module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "Test Example Module"
        [ describe "Test \"Expect\" module"
            [ test "It can test equality like 2 + 2" <|
                \() ->
                    Expect.equal 4 (2 + 2)
            ]
        ]
