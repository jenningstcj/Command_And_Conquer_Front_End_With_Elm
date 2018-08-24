module Slides.TitleAndImage exposing (view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Styles exposing (centerStyle, fadeFont, hide, italicFont, mainFontSize1, setHeight, setWidth, titleSize2)



-- VIEW --


view : String -> String -> String -> Html Msg
view title url widthPercent =
    div [ setHeight "100%" ]
        [ h1 [ centerStyle, titleSize2 ] [ text title ]
        , div
            (List.append
                (setImage url)
                [ setHeight "80%" ]
            )
            [--    [ img [ setWidth widthPercent, src url ] []
            ]
        ]


setImage : String -> List (Attribute Msg)
setImage u =
    [ style "backgroundImage" ("url(" ++ u ++ ")")
    , style "backgroundSize" "contain"
    , style "backgroundRepeat" "no-repeat"
    , style "backgroundPosition" "center"
    ]
