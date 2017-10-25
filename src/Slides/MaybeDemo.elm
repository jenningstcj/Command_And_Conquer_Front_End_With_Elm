module Slides.MaybeDemo exposing (view)

import Html exposing (..)
import Html.Attributes exposing (style, defaultValue)
import Html.Events exposing (onClick, onInput)
import Msgs exposing (Msg)
import Models exposing (..)
import Styles exposing (centerStyle, titleSize2, mainFontSize2, hide, fadeFont)
import SyntaxHighlight exposing (useTheme, monokai, elm, toBlockHtml, highlightLines, Highlight(..), HCode)


view : MaybeDemoModel -> Html Msg
view model =
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
                , input [ style [ ( "fontSize", "1.2em" ) ], onInput Msgs.MaybeDemoUpdateNum, defaultValue "0" ] []
                , p [] [ text result ]
                ]
            ]


exampleCode : String
exampleCode =
    """unwrapNumber : Maybe Int -> String
unwrapNumber num =
    case num of
        Just a ->
            toString a
        Nothing ->
            "Sorry, not a valid number."
"""


unwrapNumber : Maybe Int -> String
unwrapNumber num =
    case num of
        Just a ->
            toString a

        Nothing ->
            "Sorry, not a valid number."
