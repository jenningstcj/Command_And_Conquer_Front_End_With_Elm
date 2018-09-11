module Main exposing (Msg(..), init, inputGroup, main, subscriptions, update, view)

import Browser
import Html exposing (Html, button, div, form, h1, input, label, p, text)
import Html.Attributes exposing (autocomplete, class, for, id, src, type_, value)
import Html.Events exposing (onClick, onInput, onSubmit)
import Json.Decode as Decode exposing (Value)



{-
   import Models exposing (Model)
   import Ports exposing (emitFormData, receiveFormData)
-}
---- MODEL ----


type alias Model =
    { firstName : String
    , lastName : String
    }


init : flags -> ( Model, Cmd Msg )
init flags =
    ( Model "" "", Cmd.none )



---- UPDATE ----


type Msg
    = UpdateFirstName String
    | UpdateLastName String
    | SubmitForm
    | ExternalData Model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateFirstName str ->
            ( { model | firstName = str }, Cmd.none )

        UpdateLastName str ->
            ( { model | lastName = str }, Cmd.none )

        ExternalData m ->
            ( m, Cmd.none )

        SubmitForm ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    form [ class "name-form", onSubmit SubmitForm ]
        [ h1 [] [ text "Elm App" ]
        , inputGroup "First Name: " model.firstName UpdateFirstName
        , inputGroup "Last Name: " model.lastName UpdateLastName
        , button [ type_ "submit" ] [ text "Submit" ]
        ]


inputGroup : String -> String -> (String -> Msg) -> Html Msg
inputGroup lbl val msgType =
    div []
        [ label [] [ text lbl ]
        , input [ value val, onInput msgType, autocomplete False ] []
        , p [] [ text val ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



---- PROGRAM ----


main : Program Value Model Msg
main =
    Browser.element
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }
