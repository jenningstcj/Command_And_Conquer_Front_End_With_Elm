module Main exposing (..)

import Html exposing (Html, text, div, button, input, label, p, span)
import Html.Events exposing (onInput, onClick)
import Html.Attributes exposing (class, attribute, id, for, type_)
import Date exposing (Date(..))
import Models exposing (..)
import Msgs exposing (Msg(..))
import Helpers.ValidatorFunctions exposing (requiredLength, applyValidation)
import Helpers.View exposing (viewData)


init : ( Model, Cmd Msg )
init =
    let
        form =
            FormModel "" "" Nothing

        errors =
            ErrorModel Nothing Nothing Nothing

        validators =
            ValidationModel [ (requiredLength 10) ] [] []
    in
        ( Model form errors validators, Cmd.none )



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateFirstName str ->
            let
                oldForm =
                    model.form

                newForm =
                    { oldForm | firstName = str }
            in
                ( { model | form = newForm }, Cmd.none )

        UpdateLastName str ->
            let
                oldForm =
                    model.form

                newForm =
                    { oldForm | lastName = str }
            in
                ( { model | form = newForm }, Cmd.none )

        UpdateDOB str ->
            let
                oldForm =
                    model.form

                newForm =
                    { oldForm | dateOfBirth = Date.fromString str |> Result.toMaybe }
            in
                ( { model | form = newForm }, Cmd.none )

        Submit ->
            let
                fresh =
                    ErrorModel Nothing Nothing Nothing

                errors =
                    Debug.log "errors"
                        ({ fresh
                            | firstName = applyValidation model.validators.firstName model.form.firstName
                            , lastName = Nothing
                         }
                        )

                allValid =
                    errors == fresh
            in
                case allValid of
                    True ->
                        ( model, submitForm model.form )

                    False ->
                        ( { model | errors = errors }, Cmd.none )


submitForm : FormModel -> Cmd Msg
submitForm form =
    Cmd.none



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "mdl-grid" ]
        [ (inputGroup "First Name" UpdateFirstName model.errors.firstName)
        , (inputGroup "Last Name" UpdateLastName model.errors.lastName)
        , (inputGroup "DOB" UpdateDOB model.errors.dateOfBirth)
        , div [ class "mdl-cell mdl-cell--12-col" ] [ button [ class "mdl-button mdl-js-button mdl-button--raised", onClick Submit ] [ text "Submit" ] ]
        , viewData model
        ]


inputGroup : String -> (String -> Msg) -> Maybe String -> Html Msg
inputGroup lbl msg err =
    let
        errorMessage =
            case err of
                Just val ->
                    val

                Nothing ->
                    ""

        groupId =
            lbl |> String.split " " |> String.join ""
    in
        div [ class "mdl-cell mdl-cell--12-col" ]
            [ div [ class "mdl-textfield mdl-js-textfield mdl-textfield--floating-label" ]
                [ input [ class "mdl-textfield__input", id groupId, type_ "text", onInput msg ] []
                , label [ class "mdl-textfield__label", for groupId ] [ text lbl ]
                , span [ class "mdl-textfield__error" ] [ text errorMessage ]
                ]
            ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
