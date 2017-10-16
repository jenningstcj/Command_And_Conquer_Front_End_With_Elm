module Slides.TitleAndImage exposing (view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Styles exposing (centerStyle, titleSize2, italicFont, mainFontSize1, hide, fadeFont, setWidth, setHeight)


-- VIEW --


view : String -> String -> String -> Html Msg
view title url widthPercent =
    div [ setHeight "100%" ]
        [ h1 [ centerStyle, titleSize2 ] [ text title ]
        , div [ setHeight "80%", setImage url ]
            [--    [ img [ setWidth widthPercent, src url ] []
            ]
        ]


setImage : String -> Attribute Msg
setImage u =
    style
        [ ( "backgroundImage", "url(" ++ u ++ ")" )
        , ( "backgroundSize", "contain" )
        , ( "backgroundRepeat", "no-repeat" )
        , ( "backgroundPosition", "center" )
        ]
