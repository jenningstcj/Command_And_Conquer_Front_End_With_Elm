module Slides.TitleMarkdown exposing (view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder, src, style)
import Html.Events exposing (onClick)
import Markdown
import Msgs exposing (Msg)
import Styles exposing (centerStyle, fadeFont, hide, italicFont, mainFontSize2, setHeight, setWidth, titleSize2)



-- VIEW --


view : String -> String -> Html Msg
view title para =
    div [ setHeight "100%" ]
        [ h1 [ centerStyle, titleSize2 ]
            [ text title ]
        , Markdown.toHtml [ style "top" "20%", style "position" "relative", style "wordWrap" "break-word", centerStyle, mainFontSize2 ] para
        ]
