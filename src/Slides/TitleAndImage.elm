module Slides.TitleAndImage exposing (BackgroundPosition(..), view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Styles exposing (centerStyle, fadeFont, hide, italicFont, mainFontSize1, setHeight, setWidth, titleSize2)



-- VIEW --


view : String -> String -> BackgroundPosition -> Html Msg
view title url pos =
    div [ setHeight "100%" ]
        [ h1 [ centerStyle, titleSize2 ] [ text title ]
        , div
            (List.append
                (setImage url pos)
                [ setHeight "80%" ]
            )
            [--    [ img [ setWidth widthPercent, src url ] []
            ]
        ]


setImage : String -> BackgroundPosition -> List (Attribute Msg)
setImage u pos =
    let
        xPos =
            case pos of
                Center ->
                    "center"

                Left ->
                    "left"

        yPos =
            case pos of
                Center ->
                    "center"

                Left ->
                    "top"

        bSize =
            case pos of
                Center ->
                    "contain"

                Left ->
                    "auto"

        mBottom =
            case pos of
                Center ->
                    "0px"

                Left ->
                    "50px"

        bColor =
            case pos of
                Center ->
                    "#fff"

                Left ->
                    "#262626"
    in
    [ style "backgroundImage" ("url(" ++ u ++ ")")
    , style "backgroundSize" bSize
    , style "backgroundRepeat" "no-repeat"
    , style "backgroundPositionX" xPos
    , style "backgroundPositionY" yPos
    , style "marginBottom" mBottom
    , style "backgroundColor" bColor
    ]


type BackgroundPosition
    = Center
    | Left
