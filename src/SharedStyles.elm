module SharedStyles exposing (..)

import Css exposing (..)
import Css.Colors exposing (..)
import Css.Media exposing (minWidth, screen, withMediaQuery)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick, onInput)


listedMenu : Style
listedMenu =
    Css.batch
        [ Css.width (pct 100)
        , displayFlex
        , justifyContent spaceAround
        , listStyle none
        , padding zero
        , margin zero
        , withMediaQuery [ "screen and (min-width: 48em)" ]
            [ justifyContent flexStart ]
        ]


linkCss : Style
linkCss =
    Css.batch
        [ textDecoration none
        , textAlign center
        , display block
        , padding (px 10)
        , color white
        ]


menuItem : Style
menuItem =
    Css.batch
        [ paddingLeft (Css.rem 0.2)

        -- , border3 (px 1) solid silver
        ]


contentContainerCss : Style
contentContainerCss =
    Css.batch
        [ flex (int 1)
        , width (pct 100)
        , displayFlex
        , flexDirection column
        , alignItems center
        , maxWidth (px 759)
        , padding (Css.em 1.5)
        , withMediaQuery [ "screen and (min-width: 48em)" ]
            [ padding2 zero (pct 12) ]
        ]


columnGrid : Style
columnGrid =
    Css.batch
        [ displayFlex
        , flexDirection column
        , justifyContent center
        , alignItems center
        , textAlign center
        ]


rowGrid : Style
rowGrid =
    Css.batch
        [ displayFlex

        --, flexWrap wrap
        , justifyContent center
        ]


reviewMetaCss : Style
reviewMetaCss =
    Css.batch
        [ rowGrid
        , justifyContent spaceBetween
        , width (pct 100)
        ]


reviewItemCss : Style
reviewItemCss =
    Css.batch
        [ rowGrid
        , flex (pct 90)
        , backgroundColor (rgba 255 255 255 0.8)
        , color (hex "#3e3e3e")
        , borderRadius (px 5)
        , padding (pct 2)
        , marginTop (px 10)
        , withMediaQuery [ "screen and (min-width: 48em)" ]
            [ flex3 (int 0) (int 0) (pct 28)
            ]
        ]


gridItem : Style
gridItem =
    Css.batch
        [ columnGrid
        , flex (pct 90)
        , borderRadius (px 5)
        , padding (pct 2)
        , marginTop (px 10)
        , withMediaQuery [ "screen and (min-width: 48em)" ]
            [ flex3 (int 1) (int 0) (pct 28)
            ]
        ]


avatarContainerCss : Style
avatarContainerCss =
    Css.batch
        [ displayFlex
        , justifyContent center
        , alignItems center
        , margin (px 10)
        ]


avatarImgCss : Style
avatarImgCss =
    Css.batch
        [ borderRadius (pct 50)
        , maxWidth (pct 100)
        , width (Css.rem 3)
        , height (Css.rem 3)
        ]


bigTitle : Style
bigTitle =
    Css.batch
        [ fontSize (px 21)
        , lineHeight (Css.em 1.3)
        , marginTop (px 30)
        , marginBottom (px 8)
        ]


linkFont : Style
linkFont =
    Css.batch
        [ fontSize (px 13)
        , fontStyle italic
        , color (hex "#a3a3a3")
        , hover [ color (hex "#0085a1") ]
        ]


blockquoteCss : Style
blockquoteCss =
    Css.batch
        [ fontSize (px 14)
        , margin2 (px 10) zero
        ]


bigBold : Style
bigBold =
    Css.batch [ fontWeight bold, fontSize (Css.em 2) ]


iconCss : Style
iconCss =
    Css.batch
        [ maxWidth (pct 100)
        , border zero
        ]
