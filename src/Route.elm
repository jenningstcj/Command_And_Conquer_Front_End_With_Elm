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
    | Speed
    | Error_Messages
    | Semantic_Versioning
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
    | Result_Type
    | Result_Demo
    | Maybe_vs_Result
    | Commands_1
    | Commands_2
    | Commands_3
    | Commands_4
    | Elm_Architecture_1
    | Elm_Architecture_2



{- routeList ONLY USED TO GENERATE SIDE MENU -}


routeList : List String
routeList =
    [ "Home", "About", "Overview", "Why_Elm_1", "Why_Elm_2", "Why_Elm_3", "Why_Elm_4", "Why_Elm_5", "Speed", "Error_Messages", "Semantic_Versioning", "Currying_1", "Currying_2", "Currying_3", "Currying_4", "Currying_5", "Currying_6", "Currying_7", "Advanced_Currying_1", "Advanced_Currying_2", "Advanced_Currying_3", "Advanced_Currying_4", "Advanced_Currying_5", "Maybe_1", "Maybe_2", "Maybe_3", "Maybe_4", "Result_Type", "Result_Demo", "Maybe_vs_Result", "Commands_1", "Commands_2", "Commands_3", "Commands_4", "Elm_Architecture_1", "Elm_Architecture_2" ]



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

        "Speed" ->
            Speed

        "Error_Messages" ->
            Error_Messages

        "Semantic_Versioning" ->
            Semantic_Versioning

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

        "Result_Type" ->
            Result_Type

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

        "Elm_Architecture_1" ->
            Elm_Architecture_1

        "Elm_Architecture_2" ->
            Elm_Architecture_2

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
        , Url.map Speed (s "speed")
        , Url.map Error_Messages (s "error_messages")
        , Url.map Semantic_Versioning (s "semantic_versioning")
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
        , Url.map Result_Type (s "result_type")
        , Url.map Result_Demo (s "result_demo")
        , Url.map Maybe_vs_Result (s "maybe_vs_result")
        , Url.map Commands_1 (s "commands_1")
        , Url.map Commands_2 (s "commands_2")
        , Url.map Commands_3 (s "commands_3")
        , Url.map Commands_4 (s "commands_4")
        , Url.map Elm_Architecture_1 (s "elm_architecture_1")
        , Url.map Elm_Architecture_2 (s "elm_architecture_2")
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
