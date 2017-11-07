module Helpers.View exposing (..)

import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class)
import Date exposing (Date(..))
import Models exposing (Model)
import Msgs exposing (Msg)


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
