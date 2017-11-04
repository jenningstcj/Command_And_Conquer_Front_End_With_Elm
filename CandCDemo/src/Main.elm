module Main exposing (..)

import Html exposing (Html, text, div, button, input, label, p, span)
import Html.Events exposing (onInput, onClick)
import Html.Attributes exposing (class, attribute, id, for, type_)
import Date exposing (Date(..))
import ValidatorFunctions exposing (requiredLength, applyValidation)


---- MODEL ----


type alias Model =
    { form : FormModel
    , errors : ValidationModel
    , validators : Validators
    , year : Maybe Int
    , day : Maybe Int
    , month : Maybe Int
    }


type alias FormModel =
    { firstName : String
    , lastName : String
    , dateOfBirth : Maybe Date
    }


type alias ValidationModel =
    { firstName : Maybe String
    , lastName : Maybe String
    , dateOfBirth : Maybe String
    }


type alias Validators =
    { firstName : List (String -> Result String String)
    , lastName : List (String -> Result String String)
    , dateOfBirth : List (Date -> Result String Date)
    }


init : ( Model, Cmd Msg )
init =
    let
        form =
            FormModel "" "" Nothing

        errors =
            ValidationModel Nothing Nothing Nothing

        validators =
            Validators [ (requiredLength 10) ] [] []
    in
        ( Model form errors validators Nothing Nothing Nothing, Cmd.none )



---- UPDATE ----


type Msg
    = UpdateFirstName String
    | UpdateLastName String
    | Submit


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

        Submit ->
            let
                fresh =
                    ValidationModel Nothing Nothing Nothing

                errors =
                    { fresh
                        | firstName = applyValidation model.validators.firstName model.form.firstName
                        , lastName = Nothing
                    }

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


viewData : Model -> Html Msg
viewData model =
    let
        dob =
            case model.form.dateOfBirth of
                Just val ->
                    (Date.month val |> toString) ++ " " ++ (Date.day val |> toString) ++ ", " ++ (Date.year val |> toString)

                Nothing ->
                    ""
    in
        div [ class "mdl-cell mdl-cell--12-col" ]
            [ p [] [ text ("First Name: " ++ model.form.firstName) ]
            , p [] [ text ("Last Name: " ++ model.form.lastName) ]
            , p [] [ text ("DOB: " ++ dob) ]
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
