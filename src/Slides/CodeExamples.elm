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
    """List.map : (a -> b) -> List a -> List b
List.filter : (a -> Bool) -> List a -> List a

isEven : Int -> Bool
isEven num = if num % 2 == 0 then True
              else False

getEvenNumbers : List Int -> List Int
getEvenNumbers = List.filter isEven
-- (\\x -> if x % 2 == 0 then True else False)

getEvenNumbers [1,2,3,4]  -- outputs [2,4]

"""


maybeExample1 : String
maybeExample1 =
    """type Maybe a
    = Just a
    | Nothing

type alias Customer =
    { name : String
    , address : Maybe Address
    }

case model.address of
    Just a -> a
    Nothing -> Address "" "" "" "" ""
"""


maybeExample2 : String
maybeExample2 =
    """getFirst: List Int -> Int
getFirst l =
    case List.head l of
        Just a -> a
        Nothing -> 0

getFirst [1,2,3] --returns 1

getFirst [] --returns 0
"""


resultExample : String
resultExample =
    """type Result error value
    = Ok value
    | Err error

Http.send :
  (Result Error a -> msg) -> Request a -> Cmd Msg
  -- Msg (Result Http.error a)

String.toInt : String -> Result String Int

Date.fromString : String -> Result String Date
"""


commandExample1 : String
commandExample1 =
    """type Msg
    = HttpResult (Result Http.Error SomeData)
    | Action2

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
       HttpResult (Ok data) ->
         ({model | prop = data.prop}, Cmd.none )

       HttpResult (Err e) -> ...
"""


elmArchitecture : String
elmArchitecture =
    """Model -> Update -> View

type alias Model =
    { ...
    }

main = Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
"""
