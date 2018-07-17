module Commands exposing (..)

import Http exposing (..)
import Json.Decode as JD
import Json.Encode as JE
import Json.Decode.Pipeline exposing (decode, required, optional)
import Messages exposing (Msg(..))
import Types
    exposing
        ( VideoType
        , ImageType
        )


requestVideosInfo : String -> Cmd Msg
requestVideosInfo api_url =
    Http.request
        { method = "GET"
        , headers = []
        , url = videosRequestUrl api_url
        , body = emptyBody
        , expect = videosInfoExpect
        , timeout = Nothing
        , withCredentials = False
        }
        |> Http.send VideosInfoReceived


videosRequestUrl : String -> String
videosRequestUrl api_url =
    api_url ++ "/videos"


requestImagesInfo : String -> Cmd Msg
requestImagesInfo api_url =
    Http.request
        { method = "GET"
        , headers = []
        , url = imagesRequestUrl api_url
        , body = emptyBody
        , expect = imagesInfoExpect
        , timeout = Nothing
        , withCredentials = False
        }
        |> Http.send ImagesInfoReceived


imagesRequestUrl : String -> String
imagesRequestUrl api_url =
    api_url ++ "/images"



-- Decoder


videosInfoExpect : Expect (List VideoType)
videosInfoExpect =
    expectJson videosInfoDecoder


videosInfoDecoder : JD.Decoder (List VideoType)
videosInfoDecoder =
    JD.list videoDecoder


videoDecoder : JD.Decoder VideoType
videoDecoder =
    decode VideoType
        |> required "name" JD.string
        |> required "path" JD.string


imagesInfoExpect : Expect (List ImageType)
imagesInfoExpect =
    expectJson imagesInfoDecoder


imagesInfoDecoder : JD.Decoder (List ImageType)
imagesInfoDecoder =
    JD.list imageDecoder


imageDecoder : JD.Decoder ImageType
imageDecoder =
    decode ImageType
        |> required "name" JD.string
