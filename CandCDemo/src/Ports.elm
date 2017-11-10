port module Ports exposing (..)

import Models exposing (Model)


--outgoing


port sendDataOutside : Model -> Cmd msg



--incoming


port receiveDataFromOutside : (Model -> msg) -> Sub msg
