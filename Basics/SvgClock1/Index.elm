module Index exposing (..)

import Html exposing (..)
import Time exposing (Time, second)
import Svg exposing (..)
import Svg.Attributes exposing (..)


main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- model


type alias Model =
    Time


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )



-- update


type Msg
    = Tick Time


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            ( newTime, Cmd.none )



-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Tick



-- view


view : Model -> Html Msg
view model =
    let
        angle =
            turns (Time.inMinutes model)

        handX =
            toString (50 + 40 * cos angle)

        handY =
            toString (50 + 40 * sin angle)
    in
        svg [ viewBox "0 0 100 100", width "300px" ]
            [ circle [ cx "50", cy "50", r "45", fill "#0B79CE" ] []
            , line [ x1 "50", y1 "50", x2 handX, y2 handY, stroke "#023963" ] []
            ]
