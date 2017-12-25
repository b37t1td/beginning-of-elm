module Index exposing (..)

import Html exposing (..)
import Time exposing (..)
import Date exposing (..)
import Task


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- Model


type alias Model =
    Time


init : ( Model, Cmd Action )
init =
    ( 0, Task.perform TimeTick Time.now )



-- Update


type Action
    = TimeTick Time


update : Action -> Model -> ( Model, Cmd Action )
update action model =
    case action of
        TimeTick newTime ->
            ( newTime, Cmd.none )



-- Subs


subscriptions : Model -> Sub Action
subscriptions mode =
    Time.every Time.second TimeTick



-- View


pad : Int -> String
pad x =
    if x < 10 then
        "0" ++ (toString x)
    else
        toString x


timeToString : Time -> String
timeToString time =
    let
        date =
            fromTime time
    in
        (pad <| Date.hour <| date)
            ++ ":"
            ++ (pad <| Date.minute <| date)
            ++ ":"
            ++ (pad <| Date.second <| date)


view : Model -> Html Action
view model =
    let
        message =
            if model == 0 then
                "Initializing..."
            else
                timeToString model
    in
        h3 [] [ text message ]
