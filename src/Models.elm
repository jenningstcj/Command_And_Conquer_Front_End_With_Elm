module Models exposing (MaybeDemoModel, Model, ResultDemoModel)

--import Date

import Browser.Navigation as Nav
import Parser exposing (Parser)
import Route exposing (Route)
import Time exposing (Posix)
import Url



-- MODEL --


type alias Model =
    { navKey : Nav.Key
    , url : Url.Url

    --route : Route
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
    { date : String --Result (List Parser.DeadEnd) Posix
    }
