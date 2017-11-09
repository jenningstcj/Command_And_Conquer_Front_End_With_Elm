module Models exposing (..)

import Route exposing (Route)
import Date


-- MODEL --


type alias Model =
    { route : Route
    , showMenu : Bool
    , progressPercentage : Float
    , maybeDemoModel : MaybeDemoModel
    , resultDemoModel : ResultDemoModel
    }


type alias MaybeDemoModel =
    { num : Maybe Int
    , defaultValue : String
    }


type alias ResultDemoModel =
    { date : Result String Date.Date
    }
