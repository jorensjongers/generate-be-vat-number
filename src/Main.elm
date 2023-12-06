module Main exposing (Model, Msg, main, view)

import Browser
import Html exposing (..)
import Http
import I18Next exposing (Translations, t)


fetchTranslations : String -> Cmd Msg
fetchTranslations path =
    Http.get
        { url = path
        , expect = Http.expectJson FetchTranslations I18Next.translationsDecoder
        }


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , subscriptions = \_ -> Sub.none
        , update = update
        , view = view
        }


type Msg
    = FetchTranslations (Result Http.Error Translations)


type alias Model =
    { translations : I18Next.Translations
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { translations = I18Next.initialTranslations }, fetchTranslations "/i18n/en-GB.json" )


view : Model -> Browser.Document Msg
view { translations } =
    { title = t translations "helloWorld"
    , body =
        [ div []
            [ text (t translations "helloWorld") ]
        ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- ...
        FetchTranslations (Ok translations) ->
            ( { model | translations = translations }, Cmd.none )

        FetchTranslations (Err _) ->
            ( model, Cmd.none )
