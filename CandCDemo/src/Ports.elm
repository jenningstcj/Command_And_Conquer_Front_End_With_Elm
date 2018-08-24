port module Ports exposing (emitFormData, receiveFormData)

import Models exposing (Model)



--outgoing


port emitFormData : Model -> Cmd msg



--incoming


port receiveFormData : (Model -> msg) -> Sub msg
