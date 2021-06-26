module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = init, update = update, view = view }

type alias Model = Int

init : Model
init =
  0

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1


customButton : msg -> Html msg -> Html msg  
customButton click_msg children  = 
  button 
    [ class "bg-gray-900 text-gray-100 px-2 py-3 rounded-md shadow-lg"
    , onClick click_msg
    ] 
    [ children
    ]

view : Model -> Html Msg
view model =
  div [class "max-w-sm px-3 mt-3"][
    div [class "flex items-center justify-between bg-gray-100"]
      [   customButton Decrement (text "-")
      , div [] [ text (String.fromInt model) ]
      , customButton Increment  <| text "+"
      ]
    ]
