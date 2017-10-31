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
import Slides.TitleMarkdown as TitleMarkdown


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
                    CodeExamples.view "Maybe Type" CodeExamples.maybeExample1 0 3

                Route.Maybe_2 ->
                    CodeExamples.view "Maybe Type" CodeExamples.maybeExample1 4 8

                Route.Maybe_3 ->
                    CodeExamples.view "Maybe Type" CodeExamples.maybeExample1 9 12

                Route.Maybe_4 ->
                    CodeExamples.view "Maybe Type" CodeExamples.maybeExample2 0 5

                Route.Maybe_5 ->
                    CodeExamples.view "Maybe Type" CodeExamples.maybeExample2 6 7

                Route.Maybe_6 ->
                    CodeExamples.view "Maybe Type" CodeExamples.maybeExample2 8 9

                Route.Maybe_7 ->
                    MaybeDemo.view MaybeDemo.exampleCode1 model.maybeDemoModel Msgs.MaybeDemoUpdateNum1

                Route.Maybe_8 ->
                    MaybeDemo.view MaybeDemo.exampleCode2 model.maybeDemoModel Msgs.MaybeDemoUpdateNum2

                Route.Result_Type_1 ->
                    CodeExamples.view "Result Type" CodeExamples.resultExample 0 3

                Route.Result_Type_2 ->
                    CodeExamples.view "Result Type" CodeExamples.resultExample 4 7

                Route.Result_Type_3 ->
                    CodeExamples.view "Result Type" CodeExamples.resultExample 8 9

                Route.Result_Type_4 ->
                    CodeExamples.view "Result Type" CodeExamples.resultExample 10 11

                Route.Result_Demo ->
                    ResultDemo.view model.resultDemoModel

                Route.Maybe_vs_Result ->
                    TitleMarkdown.view "Maybe VS Result" """## A Maybe let's you handle a value that doesn't exist.

## A Result let's you handle an error condition with an error message."""

                Route.Commands_1 ->
                    TitleMarkdown.view "Commands" "## A Cmd lets you _do_ stuff."

                Route.Commands_2 ->
                    TitleAndImage.view "" "images/simple.gif" "80%"

                Route.Commands_3 ->
                    TitleAndImage.view "" "images/Commands.svg" "80%"

                Route.Commands_4 ->
                    CodeExamples.view "Msg" CodeExamples.commandExample1 0 3

                Route.Commands_5 ->
                    CodeExamples.view "Msg" CodeExamples.commandExample1 4 11

                Route.Commands_6 ->
                    CodeExamples.view "Msg" CodeExamples.commandExample1 6 11

                Route.Commands_7 ->
                    CodeExamples.view "Msg" CodeExamples.commandExample1 8 9

                Route.Elm_Architecture_1 ->
                    CodeExamples.view "The Elm Architecture" CodeExamples.elmArchitecture 0 1

                Route.Elm_Architecture_2 ->
                    CodeExamples.view "The Elm Architecture" CodeExamples.elmArchitecture 2 5

                Route.Elm_Architecture_3 ->
                    CodeExamples.view "The Elm Architecture" CodeExamples.elmArchitecture 6 12

                Route.Elm_Architecture_4 ->
                    TitleAndImage.view "" "images/Elm_Architecture.svg" "80%"

                Route.Links ->
                    TitleMarkdown.view "Links" """[https://github.com/jenningstcj/Command_And_Conquer_Front_End_With_Elm](https://github.com/jenningstcj/Command_And_Conquer_Front_End_With_Elm)

[http://elm-lang.org/](http://elm-lang.org/)

[https://github.com/rtfeldman/elm-spa-example](https://github.com/rtfeldman/elm-spa-example)

[https://www.npmjs.com/package/create-elm-app](https://www.npmjs.com/package/create-elm-app)
                """

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
