module Slides.Overview exposing (view)

import Html exposing (..)
import Html.Attributes exposing (style)
import Msgs exposing (Msg)
import Styles exposing (titleSize2, mainFontSize2, centerStyle)


view : Html Msg
view =
    div []
        [ h1 [ titleSize2, centerStyle ] [ text "Overview" ]
        , ul []
            [ li [ mainFontSize2 ] [ text "Why Elm?" ]
              --    , li [ mainFontSize2 ] [ text "The Elm Platform" ]
            , li [ mainFontSize2 ] [ text "Functional Concepts and Data Types" ]
            , li [ mainFontSize2 ] [ text "The Elm Architecture" ]
            , li [ mainFontSize2 ] [ text "Integrating Elm into existing code bases" ]
            ]
        ]
