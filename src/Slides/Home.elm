module Slides.Home exposing (Model, view)

{-| The homepage. You can get here via either the / or /#/ routes.
-}

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Styles exposing (centerStyle, titleSize1)


-- MODEL --


type alias Model =
    {}



-- VIEW --


view : Html Msg
view =
    div [ class "home-page", container ]
        [ h1 [ centerStyle, titleSize1 ] [ text "Command and Conquer the Front End with Elm" ]
        , div [ setImage "images/elm_logo.svg" ]
            []
        ]


logoStyle : Attribute Msg
logoStyle =
    style
        [ ( "width", "40%" )
        , ( "height", "40%" )
        ]


setImage : String -> Attribute Msg
setImage u =
    style
        [ ( "backgroundImage", "url(" ++ u ++ ")" )
        , ( "backgroundSize", "contain" )
        , ( "backgroundRepeat", "no-repeat" )
        , ( "backgroundPosition", "center" )
        , ( "height", "65%" )
        , ( "width", "50%" )
        ]


container : Attribute Msg
container =
    style
        [ ( "height", "100%" )
        , ( "display", "flex" )
        , ( "width", "100%" )
        , ( "alignItems", "center" )
        , ( "justifyContent", "center" )
        ]
