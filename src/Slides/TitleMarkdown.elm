module Slides.TitleMarkdown exposing (view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Styles exposing (centerStyle, titleSize2, italicFont, mainFontSize1, hide, fadeFont, setWidth, setHeight)
import Markdown


-- VIEW --


view : String -> String -> Html Msg
view title para =
    div [ setHeight "100%" ]
        [ h1 [ centerStyle, titleSize2 ]
            [ text title ]
        , (Markdown.toHtml [ style [ ( "top", "20%" ), ( "position", "relative" ) ], centerStyle ] para)
        ]
