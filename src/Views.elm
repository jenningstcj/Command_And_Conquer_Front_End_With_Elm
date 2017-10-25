module Views exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Msgs exposing (Msg(..))
import Regex exposing (..)
import Styles exposing (..)
import Models exposing (Model)
import Route exposing (Route)
import Slides.Home as Home
import Slides.About as About
import Slides.Overview as Overview
import Slides.WhyElm1 as WhyElm1
import Slides.TitleAndImage as TitleAndImage
import Slides.CodeExamples as CodeExamples
import Slides.MaybeDemo as MaybeDemo
import Slides.ResultDemo as ResultDemo


-- VIEW --


view : Model -> Html Msg
view model =
    let
        getView =
            case model.route of
                Route.Home ->
                    Home.view

                Route.About ->
                    About.view

                Route.Overview ->
                    Overview.view

                Route.Why_Elm_1 ->
                    WhyElm1.view (WhyElm1.init 1)

                Route.Why_Elm_2 ->
                    WhyElm1.view (WhyElm1.init 2)

                Route.Why_Elm_3 ->
                    WhyElm1.view (WhyElm1.init 3)

                Route.Why_Elm_4 ->
                    WhyElm1.view (WhyElm1.init 4)

                Route.Why_Elm_5 ->
                    WhyElm1.view (WhyElm1.init 5)

                Route.Speed ->
                    TitleAndImage.view "Speed" "images/speedcomparison.png" "80%"

                Route.Error_Messages ->
                    TitleAndImage.view "Error Messages" "images/errormessages.png" "80%"

                Route.Semantic_Versioning ->
                    TitleAndImage.view "Enforced Semantic Versioning" "images/elmdiff.png" "50%"

                Route.Currying_1 ->
                    CodeExamples.view "Currying" CodeExamples.simpleCurryExample1 0 1

                Route.Currying_2 ->
                    CodeExamples.view "Currying" CodeExamples.simpleCurryExample1 1 2

                Route.Currying_3 ->
                    CodeExamples.view "Currying" CodeExamples.simpleCurryExample1 2 3

                Route.Currying_4 ->
                    CodeExamples.view "Currying" CodeExamples.simpleCurryExample2 4 5

                Route.Currying_5 ->
                    CodeExamples.view "Currying" CodeExamples.simpleCurryExample2 6 7

                Route.Currying_6 ->
                    CodeExamples.view "Currying" CodeExamples.simpleCurryExample2 7 8

                Route.Currying_7 ->
                    CodeExamples.view "Currying" CodeExamples.simpleCurryExample2 8 9

                Route.Advanced_Currying_1 ->
                    CodeExamples.view "Currying" CodeExamples.mapExample 0 2

                Route.Advanced_Currying_2 ->
                    CodeExamples.view "Currying" CodeExamples.mapExample 3 6

                Route.Advanced_Currying_3 ->
                    CodeExamples.view "Currying" CodeExamples.mapExample 7 9

                Route.Advanced_Currying_4 ->
                    CodeExamples.view "Currying" CodeExamples.mapExample 9 10

                Route.Advanced_Currying_5 ->
                    CodeExamples.view "Currying" CodeExamples.mapExample 11 12

                Route.Maybe_1 ->
                    CodeExamples.view "Maybe Type" CodeExamples.maybeExample1 1 1

                Route.Maybe_2 ->
                    CodeExamples.view "Maybe Type" CodeExamples.maybeExample2 1 1

                Route.Maybe_3 ->
                    MaybeDemo.view model.maybeDemoModel

                Route.Result_Type ->
                    CodeExamples.view "Result Type" CodeExamples.resultExample 1 1

                Route.Result_Demo ->
                    ResultDemo.view model.resultDemoModel

                Route.Commands_1 ->
                    TitleAndImage.view "Cmd Msg vs Cmd msg" "" "80%"

                Route.Commands_2 ->
                    CodeExamples.view "Cmd Msg" CodeExamples.commandExample1 1 1

        progressBar =
            progressView model
    in
        div [ posFixed, sansSerif, setHeight "100%" ]
            [ navMenu model
            , elmBorder
            , div [ slideContainerStyle model, setHeight "90%" ] [ getView, navArrows ]
            , progressBar
            ]


posFixed : Attribute Msg
posFixed =
    style [ ( "position", "fixed" ), ( "width", "100%" ) ]


elmBorder : Html Msg
elmBorder =
    div [ elmBorderStyle ]
        [ div [ tenHigh, elmDarkBlue ] []
        , div [ tenHigh, elmLightBlue ] []
        , div [ tenHigh, elmOrange ] []
        , div [ tenHigh, elmGreen ] []
        ]


navArrows : Html Msg
navArrows =
    div [ arrowsContainerStyle ]
        [ i [ arrowStyle, leftArrowStyle, onClick Prev ] []
        , i [ (style [ ( "fontWeight", "bold" ), ( "fontSize", "18pt" ), ( "cursor", "pointer" ) ]), onClick ToggleMenu ] [ text "M" ]
        , i [ arrowStyle, rightArrowStyle, onClick Next ] []
        ]


navMenu : Model -> Html Msg
navMenu model =
    let
        menuItems =
            Route.routeList
                |> List.map (\x -> a [ navMenuAnchorStyle, href ("#/" ++ String.toLower x) ] [ text (replaceUnderscoreWithSpace x) ])
    in
        div [ navMenuStyle model ]
            menuItems


replaceUnderscoreWithSpace : String -> String
replaceUnderscoreWithSpace str =
    str |> Regex.replace Regex.All (Regex.regex "[_]") (\_ -> " ")


progressView : Model -> Html Msg
progressView model =
    div [ progressContainerStyle ]
        [ div [ progressStyle model ] []
        ]
