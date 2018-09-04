module Slides.CodeExamples exposing (commandExample1, elmArchitecture, mapExample, maybeExample1, maybeExample2, resultExample, simpleCurryExample1, simpleCurryExample2, view)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Styles exposing (centerStyle, fadeFont, hide, mainFontSize2, titleSize2)



--import SyntaxHighlight exposing (HCode, Highlight(..), elm, highlightLines, monokai, toBlockHtml, useTheme)
{-
   linesToHighlight : Int -> Int -> Result x HCode -> Result x HCode
   linesToHighlight startingNum endingNum =
       Result.map (highlightLines (Just Add) startingNum endingNum)
-}


view : String -> String -> Int -> Int -> Html Msg
view title codeBlock startingLine endingLine =
    div []
        [ h1 [ centerStyle, titleSize2 ] [ text title ]
        , div [ mainFontSize2 ]
            [ {- useTheme monokai
                 , elm codeBlock
                     |> linesToHighlight startingLine endingLine
                     |> Result.map (toBlockHtml (Just 1))
                     |> Result.withDefault
                         (pre [] [ code [] [ text codeBlock ] ])
              -}
              pre [] [ code [] [ text codeBlock ] ]
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
isEven num = if num % 2 == 0 then True else False

getEvenNumbers = List.filter isEven

getEvenNumbers [1,2,3,4]  -- outputs [2,4]
getEvenNumbers [5,6,7,8]  -- outputs [6,8]

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
    """getFirst: List String -> String
getFirst l =
    case List.head l of
        Just a -> a
        Nothing -> ""

getFirst ["Garfield", "Odie"] --returns "Garfield"

getFirst [] --returns ""
"""


resultExample : String
resultExample =
    """type Result error value
    = Ok value
    | Err error

Http.send :
  (Result Error a -> msg) -> Request a -> Cmd Msg
  -- returns: Msg (Result Http.error a)

Iso8601.toTime : String -> Result (List DeadEnd) Posix
"""


commandExample1 : String
commandExample1 =
    """makeApiCall : Cmd Msg
makeApiCall =
    Http.get "someUrl" SomeDataDecoder
        |> Http.send HttpResult

type Msg
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

main = Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
"""
