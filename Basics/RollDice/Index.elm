module Index exposing (..)

import Html exposing (..)
import Html.Events exposing (..)


-- model


type alias Model =
    { dieFace : Int }



-- update


type Action
    = Roll



-- view


view : Model -> Html Action
view model =
    div [] []
