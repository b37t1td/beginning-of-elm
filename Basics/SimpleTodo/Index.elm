module Index exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


main =
    beginnerProgram { view = view, model = model, update = update }



-- Model


type alias Todo =
    { id : Int, name : String, complete : Bool }


type alias Model =
    { todos : List Todo, newTodoName : String }


model : Model
model =
    { todos = [], newTodoName = "" }



-- Update


type Action
    = Create
    | Remove Int
    | UpdateNewTodoName String


createTodo : Model -> Todo
createTodo model =
    let
        id =
            List.map .id model.todos |> List.maximum |> Maybe.withDefault 0 |> \a -> a + 1
    in
        Todo id model.newTodoName False


update : Action -> Model -> Model
update action model =
    case action of
        Create ->
            if String.length model.newTodoName > 0 then
                { model | todos = createTodo model :: model.todos, newTodoName = "" }
            else
                model

        UpdateNewTodoName text ->
            { model | newTodoName = text }

        Remove id ->
            { model | todos = model.todos |> List.filter (\todo -> todo.id /= id) }



-- View


view : Model -> Html Action
view model =
    div [ class "container" ]
        [ h4 [ class "center" ] [ text "Simple Todo List" ]
        , stylesheet []
        , div [ class "row" ]
            [ div [ class "col s12 m8 offset-m2" ]
                [ createTodoForm model
                , todoList model
                ]
            ]
        ]


stylesheet =
    node
        "link"
        [ rel "stylesheet"
        , href "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css"
        ]


createTodoForm model =
    div [ class "card-panel center" ]
        [ input
            [ type_ "text"
            , placeholder "New todo name.."
            , onInput UpdateNewTodoName
            , value model.newTodoName
            ]
            []
        , button [ type_ "button", class "btn", onClick Create ] [ text "Create Todo" ]
        ]


todoItem : Todo -> Html Action
todoItem todo =
    li [ class "collection-item" ]
        [ h5 []
            [ text todo.name
            , span [ onClick (Remove todo.id), class "secondary-content btn badge red white-text" ] [ text "remove" ]
            ]
        ]


todoList : Model -> Html Action
todoList model =
    if List.length model.todos > 0 then
        ul [ class "collection" ] (List.map todoItem model.todos)
    else
        div [] []
