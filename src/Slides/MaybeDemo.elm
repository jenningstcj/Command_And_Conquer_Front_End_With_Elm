module Slides.MaybeDemo exposing (view, exampleCode1, exampleCode2)

import Html exposing (..)
import Html.Attributes exposing (style, defaultValue)
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
                , input [ style [ ( "fontSize", "1.2em" ) ], onInput msg, defaultValue "0" ] []
                , p [] [ text result ]
                ]
            ]


exampleCode1 : String
exampleCode1 =
    """unwrapNumber : Maybe Int -> String
unwrapNumber num =
    case num of
        Just a ->
            toString a
        Nothing ->
            "Sorry, not a valid number."
"""


exampleCode2 : String
exampleCode2 =
    """multiplyByTwo : Maybe Int -> Maybe Int
multiplyByTwo num =
  num
  |> Maybe.map (\\x -> x * 2)

"""


unwrapNumber : Maybe Int -> String
unwrapNumber num =
    case num of
        Just a ->
            toString a

        Nothing ->
            "Sorry, not a valid number."
