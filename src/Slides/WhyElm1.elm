module Slides.WhyElm1 exposing (init, view)

{-| The homepage. You can get here via either the / or /#/ routes.
-}

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Styles exposing (centerStyle, fadeFont, hide, italicFont, mainFontSize1, titleSize2)



-- MODEL --


type alias Model =
    { line1 : ShowType
    , line2 : ShowType
    , line3 : ShowType
    , line4 : ShowType
    }


type ShowType
    = Hide
    | Fade
    | Show


init : Int -> Model
init num =
    case num of
        1 ->
            Model Hide Hide Hide Hide

        2 ->
            Model Show Hide Hide Hide

        3 ->
            Model Fade Show Hide Hide

        4 ->
            Model Fade Fade Show Hide

        5 ->
            Model Fade Fade Fade Show

        _ ->
            Model Show Hide Hide Hide



-- VIEW --


view : Model -> Html Msg
view model =
    div []
        [ h1 [ centerStyle, titleSize2 ] [ text "Why Elm?" ]
        , div [ centerStyle, mainFontSize1 ]
            [ p [ setStyle model.line1 ] [ text "Immutability" ]
            , p [ setStyle model.line2 ] [ text "Purity" ]
            , p [ setStyle model.line3 ] [ text "Unidirectional Data Flow" ]
            , p [ setStyle model.line4 ] [ text "Little to No Runtime Exceptions" ]
            ]
        ]


setStyle : ShowType -> Attribute Msg
setStyle t =
    case t of
        Hide ->
            hide

        Fade ->
            fadeFont

        Show ->
            style "" ""
