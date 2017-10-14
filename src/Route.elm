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
    | WhyElm1_1
    | WhyElm1_2
    | WhyElm1_3
    | WhyElm1_4
    | WhyElm1_5
    | Speed
    | ErrorMessages
    | SemanticVersioning



{- routeList ONLY USED TO GENERATE SIDE MENU -}


routeList : List String
routeList =
    [ "Home", "About", "Overview", "WhyElm1_1", "WhyElm1_2", "WhyElm1_3", "WhyElm1_4", "WhyElm1_5", "Speed", "ErrorMessages", "SemanticVersioning" ]


stringToRoute : String -> Route
stringToRoute str =
    case str of
        "Home" ->
            Home

        "About" ->
            About

        "Overview" ->
            Overview

        "WhyElm1_1" ->
            WhyElm1_1

        "WhyElm1_2" ->
            WhyElm1_2

        "WhyElm1_3" ->
            WhyElm1_3

        "WhyElm1_4" ->
            WhyElm1_4

        "WhyElm1_5" ->
            WhyElm1_5

        "Speed" ->
            Speed

        "ErrorMessages" ->
            ErrorMessages

        "SemanticVersioning" ->
            SemanticVersioning

        _ ->
            Home


route : Parser (Route -> a) a
route =
    oneOf
        [ Url.map Home (s "")
        , Url.map About (s "about")
        , Url.map Overview (s "overview")
        , Url.map WhyElm1_1 (s "whyelm1_1")
        , Url.map WhyElm1_2 (s "whyelm1_2")
        , Url.map WhyElm1_3 (s "whyelm1_3")
        , Url.map WhyElm1_4 (s "whyelm1_4")
        , Url.map WhyElm1_5 (s "whyelm1_5")
        , Url.map Speed (s "speed")
        , Url.map ErrorMessages (s "errormessages")
        , Url.map SemanticVersioning (s "semanticversioning")
        ]



-- INTERNAL --


routeToString : Route -> String
routeToString page =
    let
        pieces =
            case page of
                Home ->
                    []

                About ->
                    [ "about" ]

                Overview ->
                    [ "overview" ]

                WhyElm1_1 ->
                    [ "whyelm1_1" ]

                WhyElm1_2 ->
                    [ "whyelm1_2" ]

                WhyElm1_3 ->
                    [ "whyelm1_3" ]

                WhyElm1_4 ->
                    [ "whyelm1_4" ]

                WhyElm1_5 ->
                    [ "whyelm1_5" ]

                Speed ->
                    [ "speed" ]

                ErrorMessages ->
                    [ "errormessages" ]

                SemanticVersioning ->
                    [ "semanticversioning" ]
    in
        "#/" ++ String.join "/" pieces



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
