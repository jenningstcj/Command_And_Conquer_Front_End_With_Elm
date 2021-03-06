module Slides.ResultDemo exposing (BackgroundPosition(..), view)

--import Date exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, value)
import Html.Events exposing (onClick, onInput)
import Iso8601 exposing (toTime)
import Models exposing (..)
import Msgs exposing (Msg)
import Parser exposing (DeadEnd, deadEndsToString)
import Styles exposing (centerStyle, fadeFont, hide, mainFontSize2, titleSize2)
import Time exposing (Month(..), Posix, utc)



--import SyntaxHighlight exposing (HCode, Highlight(..), elm, highlightLines, monokai, toBlockHtml, useTheme)


view : String -> BackgroundPosition -> ResultDemoModel -> Html Msg
view url pos model =
    let
        result =
            toTime (model.date ++ "T00:00:00Z") |> posixResultToString
    in
    div []
        [ h1 [ centerStyle, titleSize2 ] [ text "Result Type" ]

        {--, div [ mainFontSize2 ]
            [ {- useTheme monokai
                 , elm exampleCode
                     |> Result.map (toBlockHtml (Just 1))
                     |> Result.withDefault
                         (pre [] [ code [] [ text exampleCode ] ])
              -}
              pre [] [ code [] [ text exampleCode ] ]
              ]--}
        , div
            (setImage
                url
                pos
            )
            [--    [ img [ setWidth widthPercent, src url ] []
            ]
        , div [ mainFontSize2, centerStyle ]
            [ label [] [ text "Type in a Date:" ]
            , input [ style "fontSize" "1.2em", onInput Msgs.ResultDemoUpdateDate, value model.date ] []
            , p [ style "fontSize" "1.2em" ] [ text result ]
            ]
        ]


exampleCode : String
exampleCode =
    """Iso8601.toTime : String -> Result (List DeadEnd) Posix
"""


posixResultToString : Result (List DeadEnd) Posix -> String
posixResultToString p =
    case p of
        Ok val ->
            dateToString val

        Err error ->
            myDeadEndsToString error


dateToString : Posix -> String
dateToString d =
    let
        month =
            Time.toMonth utc d |> toMonthString

        day =
            Time.toDay utc d |> String.fromInt

        year =
            Time.toYear utc d |> String.fromInt
    in
    month ++ " " ++ day ++ ", " ++ year


toMonthString : Month -> String
toMonthString month =
    case month of
        Jan ->
            "January"

        Feb ->
            "February"

        Mar ->
            "March"

        Apr ->
            "April"

        May ->
            "May"

        Jun ->
            "June"

        Jul ->
            "July"

        Aug ->
            "August"

        Sep ->
            "September"

        Oct ->
            "October"

        Nov ->
            "November"

        Dec ->
            "December"


myDeadEndsToString : List DeadEnd -> String
myDeadEndsToString deadEnds =
    List.map (\x -> Debug.toString x.problem ++ " at row " ++ String.fromInt x.row ++ " and col " ++ String.fromInt x.col) deadEnds |> List.head |> Maybe.withDefault ""


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
    in
    [ style "backgroundImage" ("url(" ++ u ++ ")")
    , style "backgroundSize" bSize
    , style "backgroundRepeat" "no-repeat"
    , style "backgroundPositionX" xPos
    , style "backgroundPositionY" yPos
    , style "height" "150px"
    , style "marginBottom" "50px"
    , style "backgroundColor" "#262626"
    ]


type BackgroundPosition
    = Center
    | Left
