module Slides.ResultDemo exposing (view)

import Html exposing (..)
import Html.Attributes exposing (style, defaultValue)
import Html.Events exposing (onClick, onInput)
import Msgs exposing (Msg)
import Models exposing (..)
import Styles exposing (centerStyle, titleSize2, mainFontSize2, hide, fadeFont)
import SyntaxHighlight exposing (useTheme, monokai, elm, toBlockHtml, highlightLines, Highlight(..), HCode)
import Date exposing (..)


view : ResultDemoModel -> Html Msg
view model =
    let
        result =
            case model.date of
                Ok val ->
                    dateToString val

                Err error ->
                    error
    in
        div []
            [ h1 [ centerStyle, titleSize2 ] [ text "Result Type" ]
            , div [ mainFontSize2 ]
                [ useTheme monokai
                , elm exampleCode
                    |> Result.map (toBlockHtml (Just 1))
                    |> Result.withDefault
                        (pre [] [ code [] [ text exampleCode ] ])
                ]
            , div [ mainFontSize2, centerStyle ]
                [ label [] [ text "Type in a Date:" ]
                , input [ style [ ( "fontSize", "1.2em" ) ], onInput Msgs.ResultDemoUpdateDate, defaultValue "2018-8-17" ] []
                , p [ style [ ( "fontSize", "1.2em" ) ] ] [ text result ]
                ]
            ]


exampleCode : String
exampleCode =
    """Date.fromString : String -> Result String Date
"""


dateToString : Date -> String
dateToString d =
    let
        month =
            Date.month d |> toString

        day =
            Date.day d |> toString

        year =
            Date.year d |> toString
    in
        month ++ " " ++ day ++ " " ++ year
