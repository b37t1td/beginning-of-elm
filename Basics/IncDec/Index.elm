module Index exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
    beginnerProgram { view = view, update = update, model = model }



-- Model


type alias Model =
    Int


model : Model
model =
    0



-- Update


type Action
    = Increment
    | Decrement


update : Action -> Model -> Model
update action model =
    case action of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- View


view : Model -> Html.Html Action
view model =
    div [ class "application" ]
        [ h2 [] [ text ("Counter: " ++ (toString model)) ]
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick Decrement ] [ text "-" ]
        ]
