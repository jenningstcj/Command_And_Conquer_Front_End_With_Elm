module Styles exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (Msg(..))
import Models exposing (Model)


arrowsContainerStyle : Attribute Msg
arrowsContainerStyle =
    style
        [ ( "right", "50px" )
        , ( "bottom", "50px" )
        , ( "position", "fixed" )
        ]


arrowStyle : Attribute Msg
arrowStyle =
    style
        [ ( "border", "solid black" )
        , ( "borderWidth", "0 4px 4px 0" )
        , ( "display", "inline-block" )
        , ( "padding", "6px" )
        ]


leftArrowStyle : Attribute Msg
leftArrowStyle =
    style
        [ ( "transform", "rotate(135deg)" )
        , ( "-webkitTransform", "rotate(135deg)" )
        ]


rightArrowStyle : Attribute Msg
rightArrowStyle =
    style
        [ ( "transform", "rotate(-45deg)" )
        , ( "-webkitTransform", "rotate(-45deg)" )
        ]


navMenuStyle : Model -> Attribute Msg
navMenuStyle model =
    let
        constStyles =
            [ ( "height", "100%" )
            , ( "position", "fixed" )
            , ( "zIndex", "1" )
            , ( "top", "0" )
            , ( "left", "0" )
            , ( "backgroundColor", "#111" )
            , ( "overflowX", "hidden" )
            , ( "paddingTop", "60px" )
            , ( "transition", "0.5s" )
            ]

        changingStyles =
            case model.showMenu of
                True ->
                    [ ( "width", "275px" ) ]

                False ->
                    [ ( "width", "0" ) ]
    in
        style (List.append constStyles changingStyles)


navMenuAnchorStyle : Attribute Msg
navMenuAnchorStyle =
    style
        [ ( "padding", "8px 8px 8px 32px" )
        , ( "textDecoration", "none" )
        , ( "fontSize", "25px" )
        , ( "color", "#818181" )
        , ( "display", "block" )
        , ( "transition", "0.3s" )
        ]


slideContainerStyle : Model -> Attribute Msg
slideContainerStyle model =
    let
        constStyles =
            [ ( "transition", "margin-left .5s" )
            , ( "padding", "20px" )
            ]

        changingStyles =
            case model.showMenu of
                True ->
                    [ ( "marginLeft", "275px" ) ]

                False ->
                    [ ( "marginLeft", "0" ) ]
    in
        style (List.append constStyles changingStyles)


progressContainerStyle : Attribute Msg
progressContainerStyle =
    style
        [ ( "bottom", "0" )
        , ( "position", "fixed" )
        , ( "width", "100%" )
        ]


progressStyle : Model -> Attribute Msg
progressStyle model =
    style
        [ ( "width", (toString model.progressPercentage) ++ "%" )
        , ( "backgroundColor", "#60b5cc" )
        , ( "height", "5px" )
        ]


elmBorderStyle : Attribute Msg
elmBorderStyle =
    style
        [ ( "position", "fixed" )
        , ( "top", "0" )
        , ( "width", "100%" )
        ]


tenHigh : Attribute Msg
tenHigh =
    style
        [ ( "height", "6px" )
        , ( "width", "25%" )
        , ( "display", "inline-block" )
        , ( "backgroundColor", "#5a6378" )
        ]


elmDarkBlue : Attribute Msg
elmDarkBlue =
    style [ ( "backgroundColor", "#5a6378" ) ]


elmLightBlue : Attribute Msg
elmLightBlue =
    style [ ( "backgroundColor", "#60b5cc" ) ]


elmOrange : Attribute Msg
elmOrange =
    style [ ( "backgroundColor", "#f0ad00" ) ]


elmGreen : Attribute Msg
elmGreen =
    style [ ( "backgroundColor", "#80d13c" ) ]


sansSerif : Attribute Msg
sansSerif =
    style [ ( "fontFamily", "sans-serif" ) ]



-- GLOBAL STYLES


centerStyle : Attribute Msg
centerStyle =
    style [ ( "text-align", "center" ) ]


titleSize1 : Attribute Msg
titleSize1 =
    style [ ( "fontSize", "4em" {- "44pt" -} ) ]


titleSize2 : Attribute Msg
titleSize2 =
    style [ ( "fontSize", "3.5em" {- "36pt" -} ) ]


mainFontSize1 : Attribute Msg
mainFontSize1 =
    style [ ( "fontSize", "3em" {- "32pt" -} ) ]


mainFontSize2 : Attribute Msg
mainFontSize2 =
    style [ ( "fontSize", "2.5em" {- "28pt" -} ) ]


listStyleNone : Attribute Msg
listStyleNone =
    style [ ( "listStyle", "none" ) ]


italicFont : Attribute Msg
italicFont =
    style [ ( "fontStyle", "italic" ) ]


fadeFont : Attribute Msg
fadeFont =
    style [ ( "color", "darkgray" ) ]


hide : Attribute Msg
hide =
    style [ ( "display", "none" ) ]


setWidth : String -> Attribute Msg
setWidth perc =
    style [ ( "width", perc ) ]


setHeight : String -> Attribute Msg
setHeight perc =
    style [ ( "height", perc ) ]
