module Slides.CodeExamples exposing (view, simpleCurryExample1, simpleCurryExample2)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Styles exposing (centerStyle, titleSize2, mainFontSize1, hide, fadeFont)
import SyntaxHighlight exposing (useTheme, monokai, elm, toBlockHtml, highlightLines, Highlight(..), HCode)


linesToHighlight : Int -> Int -> Result x HCode -> Result x HCode
linesToHighlight startingNum endingNum =
    Result.map (highlightLines (Just Add) startingNum endingNum)


view : String -> String -> Int -> Int -> Html Msg
view title codeBlock startingLine endingLine =
    div []
        [ h1 [ centerStyle, titleSize2 ] [ text title ]
        , div [ mainFontSize1 ]
            [ useTheme monokai
            , elm codeBlock
                |> linesToHighlight startingLine endingLine
                |> Result.map (toBlockHtml (Just 1))
                |> Result.withDefault
                    (pre [] [ code [] [ text codeBlock ] ])
            ]
        ]



-- CODE BLOCKS


simpleCurryExample1 : String
simpleCurryExample1 =
    """add : Int -> Int -> Int
add num1 num2 =
    num1 + num2
"""


simpleCurryExample2 : String
simpleCurryExample2 =
    """add : Int -> Int -> Int
add num1 num2 =
    num1 + num2

add5 = add 5

add5 : Int -> Int
add5 num2 =
    5 + num2
"""
