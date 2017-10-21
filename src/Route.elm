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
    | Currying1
    | Currying2
    | Currying3
    | Currying4
    | Currying5
    | Currying6
    | Currying7
    | AdvancedCurrying1
    | AdvancedCurrying2
    | AdvancedCurrying3
    | AdvancedCurrying4
    | AdvancedCurrying5



{- routeList ONLY USED TO GENERATE SIDE MENU -}


routeList : List String
routeList =
    [ "Home", "About", "Overview", "WhyElm1_1", "WhyElm1_2", "WhyElm1_3", "WhyElm1_4", "WhyElm1_5", "Speed", "ErrorMessages", "SemanticVersioning", "Currying1", "Currying2", "Currying3", "Currying4", "Currying5", "Currying6", "Currying7", "AdvancedCurrying1", "AdvancedCurrying2", "AdvancedCurrying3", "AdvancedCurrying4", "AdvancedCurrying5" ]



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

        "Currying1" ->
            Currying1

        "Currying2" ->
            Currying2

        "Currying3" ->
            Currying3

        "Currying4" ->
            Currying4

        "Currying5" ->
            Currying5

        "Currying6" ->
            Currying6

        "Currying7" ->
            Currying7

        "AdvancedCurrying1" ->
            AdvancedCurrying1

        "AdvancedCurrying2" ->
            AdvancedCurrying2

        "AdvancedCurrying3" ->
            AdvancedCurrying3

        "AdvancedCurrying4" ->
            AdvancedCurrying4

        "AdvancedCurrying5" ->
            AdvancedCurrying5

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
        , Url.map Currying1 (s "currying1")
        , Url.map Currying2 (s "currying2")
        , Url.map Currying3 (s "currying3")
        , Url.map Currying4 (s "currying4")
        , Url.map Currying5 (s "currying5")
        , Url.map Currying6 (s "currying6")
        , Url.map Currying7 (s "currying7")
        , Url.map AdvancedCurrying1 (s "advancedcurrying1")
        , Url.map AdvancedCurrying2 (s "advancedcurrying2")
        , Url.map AdvancedCurrying3 (s "advancedcurrying3")
        , Url.map AdvancedCurrying4 (s "advancedcurrying4")
        , Url.map AdvancedCurrying5 (s "advancedcurrying5")
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

                Currying1 ->
                    [ "currying1" ]

                Currying2 ->
                    [ "currying2" ]

                Currying3 ->
                    [ "currying3" ]

                Currying4 ->
                    [ "currying4" ]

                Currying5 ->
                    [ "currying5" ]

                Currying6 ->
                    [ "currying6" ]

                Currying7 ->
                    [ "currying7" ]

                AdvancedCurrying1 ->
                    [ "advancedcurrying1" ]

                AdvancedCurrying2 ->
                    [ "advancedcurrying2" ]

                AdvancedCurrying3 ->
                    [ "advancedcurrying3" ]

                AdvancedCurrying4 ->
                    [ "advancedcurrying4" ]

                AdvancedCurrying5 ->
                    [ "advancedcurrying5" ]
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
