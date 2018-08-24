module Styles exposing (arrowStyle, arrowsContainerStyle, centerStyle, elmBorderStyle, elmDarkBlue, elmGreen, elmLightBlue, elmOrange, fadeFont, hide, italicFont, leftArrowStyle, listStyleNone, mainFontSize1, mainFontSize2, navMenuAnchorStyle, navMenuStyle, progressContainerStyle, progressStyle, rightArrowStyle, sansSerif, setHeight, setWidth, slideContainerStyle, tenHigh, titleSize1, titleSize2)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Model)
import Msgs exposing (Msg(..))


arrowsContainerStyle : List (Attribute Msg)
arrowsContainerStyle =
    [ style "right" "50px"
    , style "bottom" "50px"
    , style "position" "fixed"
    ]


arrowStyle : List (Attribute Msg)
arrowStyle =
    [ style "border" "solid black"
    , style "borderWidth" "0 4px 4px 0"
    , style "display" "inline-block"
    , style "padding" "6px"
    ]


leftArrowStyle : List (Attribute Msg)
leftArrowStyle =
    [ style "transform" "rotate(135deg)"
    , style "-webkitTransform" "rotate(135deg)"
    ]


rightArrowStyle : List (Attribute Msg)
rightArrowStyle =
    [ style "transform" "rotate(-45deg)"
    , style "-webkitTransform" "rotate(-45deg)"
    ]


navMenuStyle : Model -> List (Attribute Msg)
navMenuStyle model =
    let
        constStyles =
            [ style "height" "100%"
            , style "position" "fixed"
            , style "zIndex" "1"
            , style "top" "0"
            , style "left" "0"
            , style "backgroundColor" "#111"
            , style "overflowX" "hidden"
            , style "paddingTop" "50px"
            , style "paddingBottom" "50px"
            , style "transition" "0.5s"
            ]

        changingStyles =
            case model.showMenu of
                True ->
                    [ style "width" "275px" ]

                False ->
                    [ style "width" "0" ]
    in
    List.append constStyles changingStyles


navMenuAnchorStyle : List (Attribute Msg)
navMenuAnchorStyle =
    [ style "padding" "8px 8px 8px 32px"
    , style "textDecoration" "none"
    , style "fontSize" "25px"
    , style "color" "#818181"
    , style "display" "block"
    , style "transition" "0.3s"
    ]


slideContainerStyle : Model -> List (Attribute Msg)
slideContainerStyle model =
    let
        constStyles =
            [ style "transition" "margin-left .5s"
            , style "padding" "20px"
            ]

        changingStyles =
            case model.showMenu of
                True ->
                    [ style "marginLeft" "275px" ]

                False ->
                    [ style "marginLeft" "0" ]
    in
    List.append constStyles changingStyles


progressContainerStyle : List (Attribute Msg)
progressContainerStyle =
    [ style "bottom" "0"
    , style "position" "fixed"
    , style "width" "100%"
    ]


progressStyle : Model -> List (Attribute Msg)
progressStyle model =
    [ style "width" (String.fromFloat model.progressPercentage ++ "%")
    , style "backgroundColor" "#60b5cc"
    , style "height" "5px"
    ]


elmBorderStyle : List (Attribute Msg)
elmBorderStyle =
    [ style "position" "fixed"
    , style "top" "0"
    , style "width" "100%"
    ]


tenHigh : List (Attribute Msg)
tenHigh =
    [ style "height" "6px"
    , style "width" "25%"
    , style "display" "inline-block"
    , style "backgroundColor" "#5a6378"
    ]


elmDarkBlue : Attribute Msg
elmDarkBlue =
    style "backgroundColor" "#5a6378"


elmLightBlue : Attribute Msg
elmLightBlue =
    style "backgroundColor" "#60b5cc"


elmOrange : Attribute Msg
elmOrange =
    style "backgroundColor" "#f0ad00"


elmGreen : Attribute Msg
elmGreen =
    style "backgroundColor" "#80d13c"


sansSerif : Attribute Msg
sansSerif =
    style "fontFamily" "sans-serif"



-- GLOBAL STYLES


centerStyle : Attribute Msg
centerStyle =
    style "text-align" "center"


titleSize1 : Attribute Msg
titleSize1 =
    style "fontSize" "44pt"



{- "44pt" 4em -}


titleSize2 : Attribute Msg
titleSize2 =
    style "fontSize" "36pt"



{- "36pt" 3.5em , 3.8em -}


mainFontSize1 : Attribute Msg
mainFontSize1 =
    style "fontSize" "32pt"



{- "32pt" 3em, 3.5em -}


mainFontSize2 : Attribute Msg
mainFontSize2 =
    style "fontSize" "32pt"



{- "28pt"  2.5em, 32pt -}


listStyleNone : Attribute Msg
listStyleNone =
    style "listStyle" "none"


italicFont : Attribute Msg
italicFont =
    style "fontStyle" "italic"


fadeFont : Attribute Msg
fadeFont =
    style "color" "darkgray"


hide : Attribute Msg
hide =
    style "display" "none"


setWidth : String -> Attribute Msg
setWidth perc =
    style "width" perc


setHeight : String -> Attribute Msg
setHeight perc =
    style "height" perc
