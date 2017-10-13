module Views exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Msgs exposing (Msg(..))
import Styles exposing (..)
import Models exposing (Model)
import Route exposing (Route)
import Slides.Home as Home
import Slides.About as About
import Slides.Overview as Overview
import Slides.WhyElm1 as WhyElm1 exposing (ShowType(..))


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

                Route.WhyElm1_1 ->
                    WhyElm1.view (WhyElm1.Model WhyElm1.Show WhyElm1.Hide WhyElm1.Hide WhyElm1.Hide WhyElm1.Hide WhyElm1.Hide)

                Route.WhyElm1_2 ->
                    WhyElm1.view (WhyElm1.Model WhyElm1.Fade WhyElm1.Show WhyElm1.Hide WhyElm1.Hide WhyElm1.Hide WhyElm1.Hide)

                Route.WhyElm1_3 ->
                    WhyElm1.view (WhyElm1.Model WhyElm1.Fade WhyElm1.Fade WhyElm1.Show WhyElm1.Hide WhyElm1.Hide WhyElm1.Hide)

                Route.WhyElm1_4 ->
                    WhyElm1.view (WhyElm1.Model WhyElm1.Fade WhyElm1.Fade WhyElm1.Fade WhyElm1.Show WhyElm1.Hide WhyElm1.Hide)

                Route.WhyElm1_5 ->
                    WhyElm1.view (WhyElm1.Model WhyElm1.Fade WhyElm1.Fade WhyElm1.Fade WhyElm1.Fade WhyElm1.Show WhyElm1.Hide)

                Route.WhyElm1_6 ->
                    WhyElm1.view (WhyElm1.Model WhyElm1.Fade WhyElm1.Fade WhyElm1.Fade WhyElm1.Fade WhyElm1.Fade WhyElm1.Show)

                _ ->
                    Home.view

        progressBar =
            progressView model
    in
        div []
            [ navMenu model
            , elmBorder
            , div [ sansSerif, slideContainerStyle model ] [ getView, navArrows ]
            , progressBar
            ]


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
                |> List.map (\x -> a [ navMenuAnchorStyle, href ("#/" ++ String.toLower x) ] [ text x ])
    in
        div [ navMenuStyle model ]
            menuItems


progressView : Model -> Html Msg
progressView model =
    div [ progressContainerStyle ]
        [ div [ progressStyle model ] []
        ]
