module Helpers.ValidatorFunctions exposing (..)


applyValidation : List (String -> Result String a) -> String -> Maybe String
applyValidation list str =
    list
        |> List.map (\x -> x str)
        |> getErrors


getErrors : List (Result String b) -> Maybe String
getErrors list =
    list
        |> List.map (\x -> unwrapErrors x)
        |> List.foldl (++) ""
        |> toMaybe


toMaybe : String -> Maybe String
toMaybe str =
    case (String.isEmpty str) of
        True ->
            Nothing

        False ->
            Just str


unwrapErrors : Result String b -> String
unwrapErrors x =
    case x of
        Ok _ ->
            ""

        Err str ->
            str


requiredLength : Int -> String -> Result String String
requiredLength i str =
    let
        valid =
            String.length str >= i
    in
        case valid of
            True ->
                Ok "Valid"

            False ->
                Err ("Must be " ++ toString i ++ " characters long.")
