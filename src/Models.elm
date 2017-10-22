module Models exposing (..)

import Route exposing (Route)


-- MODEL --


type alias Model =
    { route : Route
    , showMenu : Bool
    , progressPercentage : Float
    , maybeDemoModel : MaybeDemoModel
    }


type alias MaybeDemoModel =
    { num : Maybe Int
    , result : String
    }
