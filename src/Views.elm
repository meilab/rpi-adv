module Views exposing (..)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src, controls, autoplay)
import Html.Styled.Events exposing (on, onClick, onInput)
import Css.Colors exposing (..)
import Messages exposing (Msg(..))
import Models exposing (..)
import Types exposing (..)
import SharedStyles exposing (..)
import Json.Decode as JD
import Array exposing (get)


view : Model -> Html Msg
view model =
    let
        videoInfo =
            Maybe.withDefault (VideoType "" "") (get model.currentVideoIdx model.videos)

        imageInfo =
            Maybe.withDefault (ImageType "") (get model.currentImageIdx model.images)
    in
        div
            [ css
                [ displayFlex
                , flexDirection column
                , alignItems center
                , width (vw 100)
                , height (vh 100)
                ]
            ]
            [ renderVideo model.url.videos_url videoInfo
            , renderBottomView model.url.images_url imageInfo
            ]


renderVideo : String -> VideoType -> Html Msg
renderVideo videos_url videoInfo =
    div
        [ css
            [ flex3 (int 1) (int 0) (pct 60)
            , width (pct 100)
            , backgroundColor (hex "#0a57a3")
            , backgroundImage (linearGradient (stop <| rgba 0 0 0 0) (stop <| rgba 0 0 0 0.5) [])
            , columnGrid
            ]
        ]
        [ video
            [ css
                [ width (vh 90)
                ]
            , src (videos_url ++ videoInfo.name)
            , controls True
            , autoplay True
            , onEnded VideoEnded
            ]
            []
        ]


renderBottomView : String -> ImageType -> Html Msg
renderBottomView images_url imageInfo =
    div
        [ css
            [ flex3 (int 0) (int 1) (pct 40)
            , width (pct 100)
            , backgroundColor (hex "#0a57a3")
            , backgroundImage (linearGradient (stop <| rgba 0 0 0 0) (stop <| rgba 0 0 0 0.5) [])
            , rowGrid
            ]
        ]
        [ renderImage (images_url ++ imageInfo.name)
        , renderText "Welcome boy!"
        ]


renderImage : String -> Html Msg
renderImage imagePath =
    div
        [ css
            [ flex3 (int 1) (int 0) (pct 50)
            , width (pct 100)
            , height (vh 40)
            , color white
            , backgroundImage (url imagePath)
            , backgroundColor (hex "#222")
            , backgroundAttachment fixed
            , backgroundRepeat noRepeat
            , backgroundSize cover
            , backgroundSize contain
            , backgroundAttachment local
            , backgroundPosition center
            , displayFlex
            , flexDirection column
            , justifyContent center
            , alignItems center
            , textAlign center
            ]
        ]
        []


renderText : String -> Html Msg
renderText str =
    div [ css [ flex (pct 50), columnGrid, color white ] ] [ text str ]


onEnded : Msg -> Attribute Msg
onEnded msg =
    on "ended" (JD.succeed msg)
