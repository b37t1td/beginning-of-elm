module Main exposing (..)

import Html exposing (..)
import Hello exposing (world)


main =
    div [] [ text ("Hello " ++ world) ]
