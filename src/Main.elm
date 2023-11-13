module Main exposing (main, view)

import Browser
import Html exposing (..)


main : Program () () Never
main =
    Browser.document
        { init = \_ -> ( (), Cmd.none )
        , subscriptions = \_ -> Sub.none
        , update = \_ -> \_ -> ( (), Cmd.none )
        , view = view
        }


view : () -> Browser.Document Never
view () =
    { title = "Hello world!"
    , body =
        [ div []
            [ text "Hello world!" ]
        ]
    }
