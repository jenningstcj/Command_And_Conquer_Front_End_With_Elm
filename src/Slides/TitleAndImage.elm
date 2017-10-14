module Slides.TitleAndImage exposing (view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Styles exposing (centerStyle, titleSize2, italicFont, mainFontSize1, hide, fadeFont)


-- VIEW --


view : String -> String -> String -> Html Msg
view title url widthPercent =
    div []
        [ h1 [ centerStyle, titleSize2 ] [ text title ]
        , div [ centerStyle, mainFontSize1 ]
            [ img [ setWidth widthPercent, src url ] []
            ]
        ]


setWidth : String -> Attribute Msg
setWidth perc =
    style [ ( "width", perc ) ]
