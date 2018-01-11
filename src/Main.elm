module Main exposing (main)

import Navigation exposing (Location)
import Json.Decode as Decode exposing (Value)
import Keyboard
import Msgs exposing (Msg(..))
import Models exposing (Model, MaybeDemoModel, ResultDemoModel)
import Views exposing (view)
import Route exposing (Route)
import Date exposing (Date)
import Result


init : Value -> Location -> ( Model, Cmd Msg )
init val location =
    setRoute (Route.fromLocation location)
        { route = Route.Home
        , showMenu = False
        , progressPercentage = 0
        , maybeDemoModel = MaybeDemoModel (Just 0) "0"
        , resultDemoModel = ResultDemoModel (Date.fromString "2018-1-12")
        }



-- UPDATE --


setRoute : Maybe Route -> Model -> ( Model, Cmd Msg )
setRoute maybeRoute model =
    case maybeRoute of
        Nothing ->
            ( { model | route = Route.Home, progressPercentage = getProgressPercentage Route.Home, showMenu = False }, Cmd.none )

        Just r ->
            ( { model | route = r, progressPercentage = getProgressPercentage r, showMenu = False }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetRoute route ->
            setRoute route model

        Next ->
            case (findNextPage model.route) of
                Just r ->
                    ( { model | maybeDemoModel = MaybeDemoModel Nothing "0" }, Route.stringToRoute r |> Route.modifyUrl )

                Nothing ->
                    ( model, Cmd.none )

        Prev ->
            case (findPreviousPage model.route) of
                Just r ->
                    ( model, Route.stringToRoute r |> Route.modifyUrl )

                Nothing ->
                    ( model, Cmd.none )

        ToggleMenu ->
            ( { model | showMenu = not model.showMenu }, Cmd.none )

        Noop ->
            ( model, Cmd.none )

        MaybeDemoUpdateNum1 n ->
            ( { model | maybeDemoModel = MaybeDemoModel (n |> String.toInt |> Result.toMaybe) n }, Cmd.none )

        MaybeDemoUpdateNum2 n ->
            ( { model | maybeDemoModel = MaybeDemoModel (n |> String.toInt |> Result.toMaybe |> Maybe.map (\x -> x * 60)) n }, Cmd.none )

        ResultDemoUpdateDate d ->
            ( { model | resultDemoModel = ResultDemoModel (d |> Date.fromString) }, Cmd.none )


getProgressPercentage : Route -> Float
getProgressPercentage route =
    let
        length =
            List.length Route.routeList
                |> toFloat

        indexedList =
            List.indexedMap (,) Route.routeList

        currentRouteString =
            toString route

        findRouteIndex list num =
            case list of
                [] ->
                    num

                x :: [] ->
                    if x == currentRouteString then
                        num + 1
                    else
                        num

                x :: y :: rest ->
                    if x == currentRouteString then
                        num + 1
                    else
                        findRouteIndex (y :: rest) (num + 1)

        currentPos =
            findRouteIndex Route.routeList 0
    in
        (currentPos * 100) / length


findNextPage : Route -> Maybe String
findNextPage current =
    let
        currentRouteString =
            toString current

        findNextInList l =
            case l of
                [] ->
                    Nothing

                x :: [] ->
                    Nothing

                x :: y :: rest ->
                    if x == currentRouteString then
                        Just y
                    else
                        findNextInList (y :: rest)
    in
        findNextInList Route.routeList


findPreviousPage : Route -> Maybe String
findPreviousPage current =
    let
        currentRouteString =
            toString current

        findPrevInList l =
            case l of
                [] ->
                    Nothing

                x :: [] ->
                    Nothing

                x :: y :: rest ->
                    if y == currentRouteString then
                        Just x
                    else
                        findPrevInList (y :: rest)
    in
        findPrevInList Route.routeList



-- SUBSCRIPTIONS --


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Keyboard.ups keyPressDispatcher
        ]



-- 37 left arrow key
-- 39 right arrow key
-- 77 m key
--34  right arrow on presenter
--33 left arrow on presenter


keyPressDispatcher : Int -> Msg
keyPressDispatcher keyCodeMap =
    case keyCodeMap of
        33 ->
            Prev

        37 ->
            Prev

        34 ->
            Next

        39 ->
            Next

        77 ->
            ToggleMenu

        _ ->
            Noop



-- MAIN --


main : Program Value Model Msg
main =
    Navigation.programWithFlags (Route.fromLocation >> SetRoute)
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
