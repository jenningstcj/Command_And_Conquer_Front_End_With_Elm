module Route exposing (Route(..), fromLocation, href, modifyUrl, routeList, stringToRoute)

import Html exposing (Attribute)
import Html.Attributes as Attr
import Navigation exposing (Location)
import UrlParser as Url exposing ((</>), Parser, oneOf, parseHash, s, string)


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
    | Why_Elm_6
    | Currying_1
    | Currying_2
    | Currying_3
    | Currying_4
    | Currying_5
    | Currying_6
    | Currying_7
    | Advanced_Currying_1
    | Advanced_Currying_2
    | Advanced_Currying_3
    | Advanced_Currying_4
    | Advanced_Currying_5
    | Maybe_1
    | Maybe_2
    | Maybe_3
    | Maybe_4
    | Maybe_5
    | Maybe_6
    | Maybe_7
    | Maybe_8
    | Result_Type_1
    | Result_Type_2
    | Result_Type_3
    | Result_Type_4
    | Result_Demo
    | Maybe_vs_Result
    | Commands_1
    | Commands_2
    | Commands_3
    | Commands_4
    | Commands_5
    | Commands_6
    | Commands_7
    | Elm_Architecture_1
    | Elm_Architecture_2
    | Elm_Architecture_3
    | Elm_Architecture_4
    | Demo
    | Links



{- routeList ONLY USED TO GENERATE SIDE MENU -}


routeList : List String
routeList =
    [ "Home", "About", "Overview", "Why_Elm_1", "Why_Elm_2", "Why_Elm_3", "Why_Elm_4", "Why_Elm_5", "Why_Elm_6", "Currying_1", "Currying_2", "Currying_3", "Currying_4", "Currying_5", "Currying_6", "Currying_7", "Advanced_Currying_1", "Advanced_Currying_2", "Advanced_Currying_3", "Advanced_Currying_4", "Advanced_Currying_5", "Maybe_1", "Maybe_2", "Maybe_3", "Maybe_4", "Maybe_5", "Maybe_6", "Maybe_7", "Maybe_8", "Result_Type_1", "Result_Type_2", "Result_Type_3", "Result_Type_4", "Result_Demo", "Maybe_vs_Result", "Commands_1", "Commands_2", "Commands_3", "Commands_4", "Commands_5", "Commands_6", "Commands_7", "Elm_Architecture_1", "Elm_Architecture_2", "Elm_Architecture_3", "Elm_Architecture_4", "Demo", "Links" ]



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

        "Why_Elm_6" ->
            Why_Elm_6

        "Currying_1" ->
            Currying_1

        "Currying_2" ->
            Currying_2

        "Currying_3" ->
            Currying_3

        "Currying_4" ->
            Currying_4

        "Currying_5" ->
            Currying_5

        "Currying_6" ->
            Currying_6

        "Currying_7" ->
            Currying_7

        "Advanced_Currying_1" ->
            Advanced_Currying_1

        "Advanced_Currying_2" ->
            Advanced_Currying_2

        "Advanced_Currying_3" ->
            Advanced_Currying_3

        "Advanced_Currying_4" ->
            Advanced_Currying_4

        "Advanced_Currying_5" ->
            Advanced_Currying_5

        "Maybe_1" ->
            Maybe_1

        "Maybe_2" ->
            Maybe_2

        "Maybe_3" ->
            Maybe_3

        "Maybe_4" ->
            Maybe_4

        "Maybe_5" ->
            Maybe_5

        "Maybe_6" ->
            Maybe_6

        "Maybe_7" ->
            Maybe_7

        "Maybe_8" ->
            Maybe_8

        "Result_Type_1" ->
            Result_Type_1

        "Result_Type_2" ->
            Result_Type_2

        "Result_Type_3" ->
            Result_Type_3

        "Result_Type_4" ->
            Result_Type_4

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

        "Commands_5" ->
            Commands_5

        "Commands_6" ->
            Commands_6

        "Commands_7" ->
            Commands_7

        "Elm_Architecture_1" ->
            Elm_Architecture_1

        "Elm_Architecture_2" ->
            Elm_Architecture_2

        "Elm_Architecture_3" ->
            Elm_Architecture_3

        "Elm_Architecture_4" ->
            Elm_Architecture_4

        "Demo" ->
            Demo

        "Links" ->
            Links

        _ ->
            Home


route : Parser (Route -> a) a
route =
    oneOf
        [ Url.map Home (s "")
        , Url.map About (s "about")
        , Url.map Overview (s "overview")
        , Url.map Why_Elm_1 (s "why_elm_1")
        , Url.map Why_Elm_2 (s "why_elm_2")
        , Url.map Why_Elm_3 (s "why_elm_3")
        , Url.map Why_Elm_4 (s "why_elm_4")
        , Url.map Why_Elm_5 (s "why_elm_5")
        , Url.map Why_Elm_6 (s "why_elm_6")
        , Url.map Currying_1 (s "currying_1")
        , Url.map Currying_2 (s "currying_2")
        , Url.map Currying_3 (s "currying_3")
        , Url.map Currying_4 (s "currying_4")
        , Url.map Currying_5 (s "currying_5")
        , Url.map Currying_6 (s "currying_6")
        , Url.map Currying_7 (s "currying_7")
        , Url.map Advanced_Currying_1 (s "advanced_currying_1")
        , Url.map Advanced_Currying_2 (s "advanced_currying_2")
        , Url.map Advanced_Currying_3 (s "advanced_currying_3")
        , Url.map Advanced_Currying_4 (s "advanced_currying_4")
        , Url.map Advanced_Currying_5 (s "advanced_currying_5")
        , Url.map Maybe_1 (s "maybe_1")
        , Url.map Maybe_2 (s "maybe_2")
        , Url.map Maybe_3 (s "maybe_3")
        , Url.map Maybe_4 (s "maybe_4")
        , Url.map Maybe_5 (s "maybe_5")
        , Url.map Maybe_6 (s "maybe_6")
        , Url.map Maybe_7 (s "maybe_7")
        , Url.map Maybe_8 (s "maybe_8")
        , Url.map Result_Type_1 (s "result_type_1")
        , Url.map Result_Type_2 (s "result_type_2")
        , Url.map Result_Type_3 (s "result_type_3")
        , Url.map Result_Type_4 (s "result_type_4")
        , Url.map Result_Demo (s "result_demo")
        , Url.map Maybe_vs_Result (s "maybe_vs_result")
        , Url.map Commands_1 (s "commands_1")
        , Url.map Commands_2 (s "commands_2")
        , Url.map Commands_3 (s "commands_3")
        , Url.map Commands_4 (s "commands_4")
        , Url.map Commands_5 (s "commands_5")
        , Url.map Commands_6 (s "commands_6")
        , Url.map Commands_7 (s "commands_7")
        , Url.map Elm_Architecture_1 (s "elm_architecture_1")
        , Url.map Elm_Architecture_2 (s "elm_architecture_2")
        , Url.map Elm_Architecture_3 (s "elm_architecture_3")
        , Url.map Elm_Architecture_4 (s "elm_architecture_4")
        , Url.map Demo (s "demo")
        , Url.map Links (s "links")
        ]



-- INTERNAL --


routeToString : Route -> String
routeToString page =
    "#/" ++ String.join "/" [ (toString page |> String.toLower) ]



-- PUBLIC HELPERS --


href : Route -> Attribute msg
href route =
    Attr.href (routeToString route)


modifyUrl : Route -> Cmd msg
modifyUrl =
    routeToString >> Navigation.modifyUrl


fromLocation : Location -> Maybe Route
fromLocation location =
    if String.isEmpty location.hash then
        Just Home
    else
        parseHash route location
