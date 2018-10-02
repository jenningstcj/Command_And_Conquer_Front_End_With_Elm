module Views exposing (view)

import Browser exposing (Document)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Models exposing (Model)
import Msgs exposing (Msg(..))
import Regex exposing (..)
import Route exposing (Route)
import Slides.About as About
import Slides.CodeExamples as CodeExamples
import Slides.Home as Home
import Slides.Image as Image
import Slides.MaybeDemo as MaybeDemo
import Slides.Overview as Overview
import Slides.ResultDemo as ResultDemo
import Slides.TitleAndImage as TitleAndImage
import Slides.TitleMarkdown as TitleMarkdown
import Slides.WhyElm1 as WhyElm1
import Styles exposing (..)



-- VIEW --


view : Model -> Document Msg
view model =
    let
        getView =
            case Route.fromUrl model.url of
                Route.Sponsors ->
                    TitleAndImage.view "" "images/devspace-2018-sponsors.png" TitleAndImage.Center

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

                Route.Currying_1 ->
                    TitleAndImage.view "Currying" "images/currying1.png" TitleAndImage.Left

                Route.Currying_2 ->
                    TitleAndImage.view "Currying" "images/currying2.png" TitleAndImage.Left

                Route.Currying_3 ->
                    TitleAndImage.view "Currying" "images/currying3.png" TitleAndImage.Left

                Route.Advanced_Currying_1 ->
                    TitleAndImage.view "Currying" "images/currying4.png" TitleAndImage.Left

                Route.Maybe_1 ->
                    TitleAndImage.view "Maybe Type" "images/maybe1.png" TitleAndImage.Left

                Route.Maybe_2 ->
                    TitleAndImage.view "Maybe Type" "images/maybe2.png" TitleAndImage.Left

                Route.Maybe_3 ->
                    MaybeDemo.view "images/MaybeDemo1.png" MaybeDemo.Left MaybeDemo.exampleCode1 model.maybeDemoModel Msgs.MaybeDemoUpdateNum1

                Route.Maybe_4 ->
                    MaybeDemo.view "images/MaybeDemo2.png" MaybeDemo.Left MaybeDemo.exampleCode2 model.maybeDemoModel Msgs.MaybeDemoUpdateNum2

                Route.Result_Type_1 ->
                    TitleAndImage.view "Result Type" "images/result1.png" TitleAndImage.Left

                Route.Result_Demo ->
                    ResultDemo.view "images/ResultDemo1.png" ResultDemo.Left model.resultDemoModel

                Route.Maybe_vs_Result ->
                    TitleMarkdown.view "Maybe VS Result" """## A Maybe lets you handle a value that might not exist.

## A Result lets you handle an error condition with an error object."""

                Route.Commands_1 ->
                    TitleMarkdown.view "Commands" ""

                Route.Commands_2 ->
                    TitleMarkdown.view "Commands" "## A Cmd lets you _do_ stuff."

                Route.Commands_3 ->
                    TitleAndImage.view "" "images/Commands.svg" TitleAndImage.Center

                Route.Commands_4 ->
                    TitleAndImage.view "Cmd Msg" "images/command1.png" TitleAndImage.Left

                Route.Elm_Architecture_1 ->
                    TitleAndImage.view "The Elm Architecture" "images/architecture1.png" TitleAndImage.Left

                Route.Elm_Architecture_4 ->
                    TitleAndImage.view "" "images/Elm_Architecture.svg" TitleAndImage.Center

                Route.Demo ->
                    TitleMarkdown.view "" "# Demo"

                Route.Links ->
                    TitleMarkdown.view "Links" """[http://bit.ly/CandCWithElm](http://bit.ly/CandCWithElm)

[http://elm-lang.org/](http://elm-lang.org/)

[https://github.com/rtfeldman/elm-spa-example](https://github.com/rtfeldman/elm-spa-example)

[https://www.npmjs.com/package/create-elm-app](https://www.npmjs.com/package/create-elm-app)

[https://www.brianthicks.com/](https://www.brianthicks.com/)

[https://pragprog.com/book/jfelm/programming-elm](https://pragprog.com/book/jfelm/programming-elm)
                """

        progressBar =
            progressView model
    in
    { title = "Command and Conquer the Front End With Elm"
    , body =
        [ div (List.append posFixed [ sansSerif, setHeight "100%" ])
            [ navMenu model
            , elmBorder
            , div (List.append (slideContainerStyle model) [ setHeight "90%" ]) [ getView, navArrows ]
            , progressBar
            ]
        ]
    }


posFixed : List (Attribute Msg)
posFixed =
    [ style "position" "fixed", style "width" "100%" ]


elmBorder : Html Msg
elmBorder =
    div elmBorderStyle
        [ div (List.append tenHigh [ elmDarkBlue ]) []
        , div (List.append tenHigh [ elmLightBlue ]) []
        , div (List.append tenHigh [ elmOrange ]) []
        , div (List.append tenHigh [ elmGreen ]) []
        ]


navArrows : Html Msg
navArrows =
    let
        iStyles =
            List.append arrowStyle rightArrowStyle |> List.append [ onClick Next ]
    in
    div arrowsContainerStyle
        [ i (List.append arrowStyle leftArrowStyle |> List.append [ onClick Prev ]) []
        , i [ style "fontWeight" "bold", style "fontSize" "18pt", style "cursor" "pointer", onClick ToggleMenu ] [ text "M" ]
        , i iStyles []
        ]


navMenu : Model -> Html Msg
navMenu model =
    let
        menuItems =
            Route.routeList
                |> List.map (\x -> a (List.append navMenuAnchorStyle [ href ("/" ++ String.toLower x) ]) [ text (replaceUnderscoreWithSpace "[_]" (\_ -> " ") x) ])
    in
    div (navMenuStyle model)
        menuItems


replaceUnderscoreWithSpace : String -> (Regex.Match -> String) -> String -> String
replaceUnderscoreWithSpace userRegex replacer str =
    case Regex.fromString userRegex of
        Nothing ->
            str

        Just regex ->
            Regex.replace regex replacer str


progressView : Model -> Html Msg
progressView model =
    div progressContainerStyle
        [ div (progressStyle model) []
        ]
