port module BootstrapModal exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Json.Encode as Je


main =
  App.program
    { init = init
    , update = update
    , view = view
    , subscriptions = \_ -> Sub.none
    }


-- MODEL


type alias Model = ()

init : (Model, Cmd Msg)
init =
  ((), Cmd.none)


-- PORTS

port showModal : Bool -> Cmd msg


-- UPDATE

type Msg
  = ShowModal
  | HideModal


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    ShowModal ->
      ( (), showModal True )

    HideModal ->
      ( (), showModal False )


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ div []
      [ button
        [ type' "button", class "btn btn-default", onClick ShowModal ]
        [ text "Show Modal" ]
      ]
    , div 
      [ class "modal fade"
      , tabindex -1
      , property "role" (Je.string "dialog")
      , attribute "role" "dialog"
      , id "aModal"
      ]
      [ div 
        [ class "modal-dialog"
        , property "role" (Je.string "document")
        , attribute "role" "document"
        ]
        [ div [ class "modal-content" ]
          [ div [ class "modal-header" ]
            [ h4 [ class "modal-title" ] [ text "HELLO!" ] ]
          , div [ class "modal-body" ] [ p [] [ text "BODY" ] ]
          , div
            [ class "modal-footer"]
            [ p []
              [ button
                [ type' "button", class "btn btn-default",  onClick HideModal ]
                [ text "Close" ]
              ]
            ] -- modal-footer
          ] -- modal-conent
        ] -- modal-dialog
      ] -- modal
    ]
