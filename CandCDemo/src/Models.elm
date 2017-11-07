module Models exposing (..)

import Date exposing (Date(..))


---- MODEL ----


type alias Model =
    { form : FormModel
    , errors : ErrorModel
    , validators : ValidationModel
    }


type alias FormModel =
    { firstName : String
    , lastName : String
    , dateOfBirth : Maybe Date
    }


type alias ErrorModel =
    { firstName : Maybe String
    , lastName : Maybe String
    , dateOfBirth : Maybe String
    }


type alias ValidationModel =
    { firstName : List (String -> Result String String)
    , lastName : List (String -> Result String String)
    , dateOfBirth : List (Date -> Result String Date)
    }
