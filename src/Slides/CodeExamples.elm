module Slides.CodeExamples exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Styles exposing (centerStyle, titleSize2, mainFontSize2, hide, fadeFont)
import SyntaxHighlight exposing (useTheme, monokai, elm, toBlockHtml, highlightLines, Highlight(..), HCode)


linesToHighlight : Int -> Int -> Result x HCode -> Result x HCode
linesToHighlight startingNum endingNum =
    Result.map (highlightLines (Just Add) startingNum endingNum)


view : String -> String -> Int -> Int -> Html Msg
view title codeBlock startingLine endingLine =
    div []
        [ h1 [ centerStyle, titleSize2 ] [ text title ]
        , div [ mainFontSize2 ]
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


mapExample : String
mapExample =
    """map : (a -> b) -> List a -> List b
filter : (a -> Bool) -> List a -> List a

isEven : Int -> Bool
isEven num = if num % 2 == 0 then True
              else False

getEvenNumbers : List Int -> List Int
getEvenNumbers = List.filter isEven
-- (\\x -> if x % 2 == 0 then True else False)

getEvenNumbers [1,2,3,4]  -- outputs [2,4]

"""
