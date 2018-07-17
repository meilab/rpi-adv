module Models exposing (..)

import Routing exposing (Route)
import Types exposing (VideoType, ImageType)
import Array exposing (Array, fromList)


type alias Url =
    { base_url : String
    , assets_url : String
    , videos_url : String
    , images_url : String
    , api_url : String
    }


type alias Model =
    { route : Route
    , url : Url
    , videos : Array VideoType
    , images : Array ImageType
    , currentVideoIdx : Int
    , currentImageIdx : Int
    }


initialModel : Route -> Url -> Model
initialModel route url =
    { route = route
    , url = url
    , videos = fromList []
    , images = fromList []
    , currentVideoIdx = 0
    , currentImageIdx = 0
    }
