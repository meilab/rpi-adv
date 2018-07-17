module Messages exposing (..)

import Navigation exposing (Location)
import Http
import Types exposing (VideoType, ImageType)


type Msg
    = OnLocationChange Location
    | NewUrl String
    | UpdateImageIdx
    | VideoEnded
    | VideosInfoReceived (Result Http.Error (List VideoType))
    | ImagesInfoReceived (Result Http.Error (List ImageType))
    | NoOp
