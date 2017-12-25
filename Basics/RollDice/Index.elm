module Index exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Random


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- model


type alias Model =
    { dieFace : Int }


init : ( Model, Cmd Action )
init =
    ( Model 1, Random.generate NewFace <| Random.int 1 6 )



-- subscriprions


subscriptions : Model -> Sub Action
subscriptions mode =
    Sub.none



-- update


type Action
    = Roll
    | NewFace Int


update : Action -> Model -> ( Model, Cmd Action )
update action model =
    case action of
        Roll ->
            ( model, Random.generate NewFace <| Random.int 1 6 )

        NewFace newFace ->
            ( Model newFace, Cmd.none )



-- view


view : Model -> Html Action
view model =
    div []
        [ h3 [] [ text <| toString model.dieFace ]
        , button [ onClick Roll ] [ text "Roll" ]
        ]
