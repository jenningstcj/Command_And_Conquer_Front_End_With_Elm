module Slides.Image exposing (view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Styles exposing (centerStyle, fadeFont, hide, italicFont, mainFontSize1, setHeight, setWidth, titleSize2)



-- VIEW --


view : String -> Html Msg
view url =
    div (List.append [ setHeight "100%" ] (setImage url))
        [--div [ setHeight "80%", setImage url ]
         --[--    [ img [ setWidth widthPercent, src url ] []
         --]
        ]


setImage : String -> List (Attribute Msg)
setImage u =
    [ style "backgroundImage" ("url(" ++ u ++ ")")
    , style "backgroundSize" "contain"
    , style "backgroundRepeat" "no-repeat"
    , style "backgroundPosition" "center"
    ]
