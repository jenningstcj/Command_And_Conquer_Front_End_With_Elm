module Slides.Image exposing (view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Styles exposing (centerStyle, titleSize2, italicFont, mainFontSize1, hide, fadeFont, setWidth, setHeight)


-- VIEW --


view : String -> Html Msg
view url =
    div [ setHeight "100%", setImage url ]
        [--div [ setHeight "80%", setImage url ]
         --[--    [ img [ setWidth widthPercent, src url ] []
         --]
        ]


setImage : String -> Attribute Msg
setImage u =
    style
        [ ( "backgroundImage", "url(" ++ u ++ ")" )
        , ( "backgroundSize", "contain" )
        , ( "backgroundRepeat", "no-repeat" )
        , ( "backgroundPosition", "center" )
        ]
