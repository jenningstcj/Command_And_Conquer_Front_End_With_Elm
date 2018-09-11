module Route exposing (Route(..), fromUrl, routeList, stringToRoute)

import Html exposing (Attribute)
import Html.Attributes as Attr
import Url
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s, string)



-- ROUTING --


type Route
    = Home
    | About
    | Overview
    | Why_Elm_1
    | Why_Elm_2
    | Why_Elm_3
    | Why_Elm_4
    | Why_Elm_5
    | Currying_1
    | Currying_2
    | Currying_3
      {--| Currying_4
    | Currying_5
    | Currying_6
    | Currying_7
    --}
    | Advanced_Currying_1
      {--| Advanced_Currying_2
    | Advanced_Currying_3
    | Advanced_Currying_4
    | Advanced_Currying_5--}
    | Maybe_1
    | Maybe_2
      {--| Maybe_3
    | Maybe_4
    | Maybe_5
    | Maybe_6
    --}
    | Maybe_3
    | Maybe_4
    | Result_Type_1
      {--| Result_Type_2
    | Result_Type_3
    | Result_Type_4
    --}
    | Result_Demo
    | Maybe_vs_Result
    | Commands_1
    | Commands_2
    | Commands_3
    | Commands_4
      {--| Commands_5
    | Commands_6
    | Commands_7
    --}
    | Elm_Architecture_1
      {--| Elm_Architecture_2
    | Elm_Architecture_3--}
    | Elm_Architecture_4
    | Demo
    | Links



{- routeList ONLY USED TO GENERATE SIDE MENU -}


routeList : List String
routeList =
    [ "Home"
    , "About"
    , "Overview"
    , "Why_Elm_1"
    , "Why_Elm_2"
    , "Why_Elm_3"
    , "Why_Elm_4"
    , "Why_Elm_5"
    , "Currying_1"
    , "Currying_2"
    , "Currying_3"
    , {--"Currying_4", "Currying_5", "Currying_6", "Currying_7",--}
      "Advanced_Currying_1"

    {--, "Advanced_Currying_2"
    , "Advanced_Currying_3"
    , "Advanced_Currying_4"
    , "Advanced_Currying_5"--}
    , "Maybe_1"
    , "Maybe_2"

    {--, "Maybe_3"
    , "Maybe_4"
    , "Maybe_5"
    , "Maybe_6"
    --}
    , "Maybe_3"
    , "Maybe_4"
    , "Result_Type_1"

    {--, "Result_Type_2"
    , "Result_Type_3"
    , "Result_Type_4"
    --}
    , "Result_Demo"
    , "Maybe_vs_Result"
    , "Commands_1"
    , "Commands_2"
    , "Commands_3"
    , "Commands_4"

    {--, "Commands_5"
    , "Commands_6"
    , "Commands_7"
    --}
    , "Elm_Architecture_1"

    {--, "Elm_Architecture_2"
    , "Elm_Architecture_3"--}
    , "Elm_Architecture_4"
    , "Demo"
    , "Links"
    ]



{- stringToRoute only used to handle keyboard navigation -}


stringToRoute : String -> Route
stringToRoute str =
    case str of
        "Home" ->
            Home

        "About" ->
            About

        "Overview" ->
            Overview

        "Why_Elm_1" ->
            Why_Elm_1

        "Why_Elm_2" ->
            Why_Elm_2

        "Why_Elm_3" ->
            Why_Elm_3

        "Why_Elm_4" ->
            Why_Elm_4

        "Why_Elm_5" ->
            Why_Elm_5

        "Currying_1" ->
            Currying_1

        "Currying_2" ->
            Currying_2

        "Currying_3" ->
            Currying_3

        {--
        "Currying_4" ->
            Currying_4

        "Currying_5" ->
            Currying_5

        "Currying_6" ->
            Currying_6

        "Currying_7" ->
            Currying_7
            --}
        "Advanced_Currying_1" ->
            Advanced_Currying_1

        {--
        "Advanced_Currying_2" ->
            Advanced_Currying_2

        "Advanced_Currying_3" ->
            Advanced_Currying_3

        "Advanced_Currying_4" ->
            Advanced_Currying_4

        "Advanced_Currying_5" ->
            Advanced_Currying_5
            --}
        "Maybe_1" ->
            Maybe_1

        "Maybe_2" ->
            Maybe_2

        {--
        "Maybe_3" ->
            Maybe_3

        "Maybe_4" ->
            Maybe_4

        "Maybe_5" ->
            Maybe_5

        "Maybe_6" ->
            Maybe_6
            --}
        "Maybe_3" ->
            Maybe_3

        "Maybe_4" ->
            Maybe_4

        "Result_Type_1" ->
            Result_Type_1

        {--
        "Result_Type_2" ->
            Result_Type_2

        "Result_Type_3" ->
            Result_Type_3

        "Result_Type_4" ->
            Result_Type_4
            --}
        "Result_Demo" ->
            Result_Demo

        "Maybe_vs_Result" ->
            Maybe_vs_Result

        "Commands_1" ->
            Commands_1

        "Commands_2" ->
            Commands_2

        "Commands_3" ->
            Commands_3

        "Commands_4" ->
            Commands_4

        {--
        "Commands_5" ->
            Commands_5

        "Commands_6" ->
            Commands_6

        "Commands_7" ->
            Commands_7
            --}
        "Elm_Architecture_1" ->
            Elm_Architecture_1

        {--
        "Elm_Architecture_2" ->
            Elm_Architecture_2
            
        "Elm_Architecture_3" ->
            Elm_Architecture_3
            --}
        "Elm_Architecture_4" ->
            Elm_Architecture_4

        "Demo" ->
            Demo

        "Links" ->
            Links

        _ ->
            Home


route : Parser.Parser (Route -> a) a
route =
    oneOf
        [ Parser.map Home (s "")
        , Parser.map About (s "about")
        , Parser.map Overview (s "overview")
        , Parser.map Why_Elm_1 (s "why_elm_1")
        , Parser.map Why_Elm_2 (s "why_elm_2")
        , Parser.map Why_Elm_3 (s "why_elm_3")
        , Parser.map Why_Elm_4 (s "why_elm_4")
        , Parser.map Why_Elm_5 (s "why_elm_5")
        , Parser.map Currying_1 (s "currying_1")
        , Parser.map Currying_2 (s "currying_2")
        , Parser.map Currying_3 (s "currying_3")

        {--, Parser.map Currying_4 (s "currying_4")
        , Parser.map Currying_5 (s "currying_5")
        , Parser.map Currying_6 (s "currying_6")
        , Parser.map Currying_7 (s "currying_7")
        --}
        , Parser.map Advanced_Currying_1 (s "advanced_currying_1")

        {--, Parser.map Advanced_Currying_2 (s "advanced_currying_2")
        , Parser.map Advanced_Currying_3 (s "advanced_currying_3")
        , Parser.map Advanced_Currying_4 (s "advanced_currying_4")
        , Parser.map Advanced_Currying_5 (s "advanced_currying_5")
        --}
        , Parser.map Maybe_1 (s "maybe_1")
        , Parser.map Maybe_2 (s "maybe_2")

        {--, Parser.map Maybe_3 (s "maybe_3")
        , Parser.map Maybe_4 (s "maybe_4")
        , Parser.map Maybe_5 (s "maybe_5")
        , Parser.map Maybe_6 (s "maybe_6")
        --}
        , Parser.map Maybe_3 (s "maybe_3")
        , Parser.map Maybe_4 (s "maybe_4")
        , Parser.map Result_Type_1 (s "result_type_1")

        {--, Parser.map Result_Type_2 (s "result_type_2")
        , Parser.map Result_Type_3 (s "result_type_3")
        , Parser.map Result_Type_4 (s "result_type_4")
        --}
        , Parser.map Result_Demo (s "result_demo")
        , Parser.map Maybe_vs_Result (s "maybe_vs_result")
        , Parser.map Commands_1 (s "commands_1")
        , Parser.map Commands_2 (s "commands_2")
        , Parser.map Commands_3 (s "commands_3")
        , Parser.map Commands_4 (s "commands_4")

        {--, Parser.map Commands_5 (s "commands_5")
        , Parser.map Commands_6 (s "commands_6")
        , Parser.map Commands_7 (s "commands_7")
        --}
        , Parser.map Elm_Architecture_1 (s "elm_architecture_1")

        {--, Parser.map Elm_Architecture_2 (s "elm_architecture_2")
        , Parser.map Elm_Architecture_3 (s "elm_architecture_3")--}
        , Parser.map Elm_Architecture_4 (s "elm_architecture_4")
        , Parser.map Demo (s "demo")
        , Parser.map Links (s "links")
        ]



-- INTERNAL --
{-
   routeToString : Route -> String
   routeToString page =
       "/" ++ String.join "/" [ Debug.toString page |> String.toLower ]
-}
-- PUBLIC HELPERS --
{-

   href : Route -> Attribute msg
   href route =
       Attr.href (routeToString route)
-}
{-

   modifyUrl : Route -> Cmd msg
   modifyUrl =
       routeToString >> Navigation.modifyUrl
-}
{-
   fromLocation : Location -> Maybe Route
   fromLocation location =
       if String.isEmpty location.hash then
           Just Home

       else
           parseHash route location

-}


fromUrl : Url.Url -> Route
fromUrl url =
    url |> Parser.parse route |> Maybe.withDefault Home
