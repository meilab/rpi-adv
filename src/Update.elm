module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (..)
import Routing exposing (Route(..), parseLocation)
import Navigation exposing (Location)
import Array exposing (Array, fromList)
import Commands exposing (requestVideosInfo, requestImagesInfo)
import Types exposing (..)


changeUrlCommand : Model -> Route -> ( Model, Cmd Msg )
changeUrlCommand model route =
    case route of
        AboutRoute ->
            ( model, Cmd.none )

        _ ->
            ( model
            , Cmd.batch
                [ requestVideosInfo model.url.api_url
                , requestImagesInfo model.url.api_url
                ]
            )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location model.url.base_url
            in
                changeUrlCommand
                    model
                    newRoute

        NewUrl url ->
            model
                ! [ Navigation.newUrl url
                  ]

        UpdateImageIdx ->
            let
                totalImages =
                    Array.length model.images

                newIdx =
                    case totalImages == 0 of
                        True ->
                            0

                        False ->
                            (model.currentImageIdx + 1) % totalImages
            in
                ( { model | currentImageIdx = newIdx }, Cmd.none )

        VideoEnded ->
            let
                totalVideos =
                    Array.length model.videos

                newIdx =
                    case totalVideos == 0 of
                        True ->
                            0

                        False ->
                            (model.currentVideoIdx + 1) % totalVideos
            in
                ( { model | currentVideoIdx = newIdx }, Cmd.none )

        VideosInfoReceived (Ok data) ->
            let
                videos =
                    filterVideos data
            in
                ( { model
                    | videos = fromList videos
                  }
                , Cmd.none
                )

        VideosInfoReceived (Err error) ->
            ( model, Cmd.none )

        ImagesInfoReceived (Ok data) ->
            let
                images =
                    filterImages data
            in
                ( { model
                    | images = fromList images
                  }
                , Cmd.none
                )

        ImagesInfoReceived (Err error) ->
            ( model, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


getMediaType : String -> String
getMediaType name =
    name
        |> String.split "."
        |> List.reverse
        |> List.head
        |> Maybe.withDefault ""


filterVideos : List VideoType -> List VideoType
filterVideos videos =
    List.filter (\item -> List.member (getMediaType item.name) supportedVideoTypes) videos


filterImages : List ImageType -> List ImageType
filterImages images =
    List.filter (\item -> List.member (getMediaType item.name) supportedImageTypes) images
