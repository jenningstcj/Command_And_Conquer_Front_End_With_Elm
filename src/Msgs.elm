module Msgs exposing (Msg(..))

import Route exposing (Route)


type Msg
    = SetRoute (Maybe Route)
    | Next
    | Prev
    | ToggleMenu
    | Noop
    | MaybeDemoUpdateNum1 String
    | MaybeDemoUpdateNum2 String
    | ResultDemoUpdateDate String
