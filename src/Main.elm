module Main exposing (..)

import Views exposing (view)
import Messages exposing (Msg(..))
import Update exposing (..)
import Models exposing (..)
import Navigation
import Routing exposing (parseLocation)
import Time exposing (Time)
import Html.Styled exposing (..)
import Types exposing (VideoType)


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view >> toUnstyled
        , update = update
        , subscriptions = subscriptions
        }


ghProjectName : String
ghProjectName =
    "adv"


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        base_url =
            case
                location.pathname
                    |> String.split "/"
                    |> List.member ghProjectName
            of
                True ->
                    "/" ++ ghProjectName

                False ->
                    ""

        currentRoute =
            parseLocation location base_url

        assets_url =
            location.origin ++ "/assets"

        url =
            { base_url = base_url
            , assets_url = assets_url
            , videos_url = assets_url ++ "/videos/"
            , images_url = assets_url ++ "/images/"
            , api_url = location.origin ++ "/api/v1"
            }
    in
        changeUrlCommand (initialModel currentRoute url)
            currentRoute


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every (Time.second * 2) (always UpdateImageIdx)
