module Types exposing (..)


type alias Author =
    { name : String
    , avatar : String
    , email : String
    , bio : String
    , blog : String
    , location : String
    , github : String
    }


type alias Hero =
    { srcUrl : String
    , title : String
    , des : String
    }


type alias VideoType =
    { name : String
    , path : String
    }


type alias ImageType =
    { name : String }


supportedVideoTypes : List String
supportedVideoTypes =
    [ "mp4", "mpeg" ]


supportedImageTypes : List String
supportedImageTypes =
    [ "jpg", "png" ]
