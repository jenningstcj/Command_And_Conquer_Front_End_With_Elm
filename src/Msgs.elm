module Msgs exposing (Msg(..))

import Route exposing (Route)


type Msg
    = SetRoute (Maybe Route)
    | Next
    | Prev
    | ToggleMenu
    | Noop
    | MaybeDemoUpdateNum String
    | ResultDemoUpdateDate String
