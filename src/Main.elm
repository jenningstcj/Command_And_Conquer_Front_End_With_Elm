module Main exposing (main)

import Browser
import Browser.Events as Events
import Browser.Navigation as Nav
import Json.Decode as Decode exposing (Value)
import Models exposing (MaybeDemoModel, Model, ResultDemoModel)
import Msgs exposing (Msg(..))
import Result
import Route exposing (Route)
import Url
import Views exposing (view)


init : flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key url False 0 (MaybeDemoModel (Just 0) "0") (ResultDemoModel "2018-08-17"), Nav.pushUrl key "/" )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( { model | showMenu = False }, Nav.pushUrl model.navKey (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url }, Cmd.none )

        Next ->
            case findNextPage (Route.fromUrl model.url) of
                Just r ->
                    ( { model | maybeDemoModel = MaybeDemoModel Nothing "0" }, r |> Nav.pushUrl model.navKey )

                Nothing ->
                    ( model, Cmd.none )

        Prev ->
            case findPreviousPage (Route.fromUrl model.url) of
                Just r ->
                    ( model, r |> Nav.pushUrl model.navKey )

                Nothing ->
                    ( model, Cmd.none )

        ToggleMenu ->
            ( { model | showMenu = not model.showMenu }, Cmd.none )

        Noop ->
            ( model, Cmd.none )

        MaybeDemoUpdateNum1 n ->
            ( { model | maybeDemoModel = MaybeDemoModel (n |> String.toInt) n }, Cmd.none )

        MaybeDemoUpdateNum2 n ->
            ( { model | maybeDemoModel = MaybeDemoModel (n |> String.toInt |> Maybe.map (\x -> x * 60)) n }, Cmd.none )

        ResultDemoUpdateDate d ->
            ( { model | resultDemoModel = ResultDemoModel d }, Cmd.none )


getProgressPercentage : Route -> Float
getProgressPercentage route =
    let
        length =
            List.length Route.routeList
                |> toFloat

        indexedList =
            List.indexedMap (\a b -> ( a, b )) Route.routeList

        currentRouteString =
            Debug.toString route

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
            Debug.toString current

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
    findNextInList Route.routeList |> Maybe.map (\x -> String.toLower x)


findPreviousPage : Route -> Maybe String
findPreviousPage current =
    let
        currentRouteString =
            Debug.toString current

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
    findPrevInList Route.routeList |> Maybe.map (\x -> String.toLower x)



-- SUBSCRIPTIONS --


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Events.onKeyUp keyDecoder
        ]



-- 37 left arrow key
-- 39 right arrow key
-- 77 m key
--34 key code or PageDown  right arrow on presenter
--33 key code or PageUp left arrow on presenter


keyDecoder : Decode.Decoder Msg
keyDecoder =
    Decode.map keyPressDispatcher (Decode.field "key" Decode.string)


keyPressDispatcher : String -> Msg
keyPressDispatcher keyCodeMap =
    case keyCodeMap of
        "PageUp" ->
            Prev

        "ArrowLeft" ->
            Prev

        "PageDown" ->
            Next

        "ArrowRight" ->
            Next

        "m" ->
            ToggleMenu

        _ ->
            Noop



-- MAIN --


main : Program Value Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



{- Navigation.programWithFlags (Route.fromLocation >> SetRoute)
   { init = init
   , view = view
   , update = update
   , subscriptions = subscriptions
   }
-}
