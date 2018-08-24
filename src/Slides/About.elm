module Slides.About exposing (Model, view)

{-| The homepage. You can get here via either the /about or /#/about routes.
-}

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Styles exposing (listStyleNone, mainFontSize2, titleSize1)



-- MODEL --


type alias Model =
    {}



-- VIEW --


view : Html Msg
view =
    let
        imageStyles =
            List.append twitterLogoStyle [ verticalAlignMiddle, src "images/Twitter_Logo_Blue.svg" ]
    in
    div [ class "home-page" ]
        [ h1 [ titleSize1 ] [ text "Tyler Jennings" ]
        , ul [ listStyleNone ]
            [ li [ mainFontSize2 ] [ img [ verticalAlignMiddle, src "images/ResultStackLogo.png", style "height" "100px" ] [] ]
            , li [ mainFontSize2 ] [ img imageStyles [], text "@JenningsTCJ" ]
            ]
        ]


verticalAlignMiddle : Attribute Msg
verticalAlignMiddle =
    style "verticalAlign" "middle"


twitterLogoStyle : List (Attribute Msg)
twitterLogoStyle =
    [ style "height" "150px"
    , style "width" "150px"
    ]
