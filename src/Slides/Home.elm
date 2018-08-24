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
    div (List.append [ class "home-page" ] container)
        [ h1 [ centerStyle, titleSize1 ] [ text "Command and Conquer the Front End with Elm" ]
        , div (setImage "images/elm_logo.svg")
            []
        ]


logoStyle : List (Attribute Msg)
logoStyle =
    [ style "width" "40%"
    , style "height" "40%"
    ]


setImage : String -> List (Attribute Msg)
setImage u =
    [ style "backgroundImage" ("url(" ++ u ++ ")")
    , style "backgroundSize" "contain"
    , style "backgroundRepeat" "no-repeat"
    , style "backgroundPosition" "center"
    , style "height" "65%"
    , style "width" "50%"
    ]


container : List (Attribute Msg)
container =
    [ style "height" "100%"
    , style "display" "flex"
    , style "width" "100%"
    , style "alignItems" "center"
    , style "justifyContent" "center"
    ]
