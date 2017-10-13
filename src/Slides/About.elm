module Slides.About exposing (Model, view)

{-| The homepage. You can get here via either the /about or /#/about routes.
-}

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder, src, style)
import Html.Events exposing (onClick)
import Styles exposing (titleSize1, mainFontSize2, listStyleNone)
import Msgs exposing (Msg)


-- MODEL --


type alias Model =
    {}



-- VIEW --


view : Html Msg
view =
    div [ class "home-page" ]
        [ h1 [ titleSize1 ] [ text "Tyler Jennings" ]
        , ul [ listStyleNone ]
            [ li [ mainFontSize2 ] [ img [ verticalAlignMiddle, src "images/ResultStackLogo.png" ] [], text "ResultStack" ]
            , li [ mainFontSize2 ] [ img [ twitterLogoStyle, verticalAlignMiddle, src "images/Twitter_Logo_Blue.svg" ] [], text "@JenningsTCJ" ]
            ]
        ]


verticalAlignMiddle : Attribute Msg
verticalAlignMiddle =
    style [ ( "verticalAlign", "middle" ) ]


twitterLogoStyle : Attribute Msg
twitterLogoStyle =
    style
        [ ( "height", "150px" )
        , ( "width", "150px" )
        ]
