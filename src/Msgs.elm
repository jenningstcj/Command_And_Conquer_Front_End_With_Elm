module Msgs exposing (Msg(..))

import Browser
import Route exposing (Route)
import Url


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
      -- |  SetRoute (Maybe Route)
    | Next
    | Prev
    | ToggleMenu
    | Noop
    | MaybeDemoUpdateNum1 String
    | MaybeDemoUpdateNum2 String
    | ResultDemoUpdateDate String
