module Slides.MaybeDemo exposing (view, exampleCode1, exampleCode2)

import Html exposing (..)
import Html.Attributes exposing (style, defaultValue, value)
import Html.Events exposing (onClick, onInput)
import Msgs exposing (Msg)
import Models exposing (..)
import Styles exposing (centerStyle, titleSize2, mainFontSize2, hide, fadeFont)
import SyntaxHighlight exposing (useTheme, monokai, elm, toBlockHtml, highlightLines, Highlight(..), HCode)


view : String -> MaybeDemoModel -> (String -> Msg) -> Html Msg
view exampleCode model msg =
    let
        result =
            unwrapNumber model.num
    in
        div []
            [ h1 [ centerStyle, titleSize2 ] [ text "Maybe Type" ]
            , div [ mainFontSize2 ]
                [ useTheme monokai
                , elm exampleCode
                    |> Result.map (toBlockHtml (Just 1))
                    |> Result.withDefault
                        (pre [] [ code [] [ text exampleCode ] ])
                ]
            , div [ mainFontSize2, centerStyle ]
                [ label [] [ text "Type in a Number: " ]
                , input [ style [ ( "fontSize", "1.2em" ) ], onInput msg, value model.defaultValue ] []
                , p [ style [ ( "fontSize", "1.2em" ) ] ] [ text (toString result) ]
                ]
            ]


exampleCode1 : String
exampleCode1 =
    """unwrapNumber : Maybe Int -> Int
unwrapNumber maybeNum =
    case maybeNum of
        Just a -> a
        Nothing -> 0
"""


exampleCode2 : String
exampleCode2 =
    """hoursToMinutes : Maybe Int -> Maybe Int
hoursToMinutes maybeNum =
  Maybe.map (\\x -> x * 60) maybeNum

"""


unwrapNumber : Maybe Int -> Int
unwrapNumber num =
    case num of
        Just a ->
            a

        Nothing ->
            0
