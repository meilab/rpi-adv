module Config exposing (..)

import Array exposing (Array, fromList)
import Types exposing (Hero)


siteName : String
siteName =
    "Johnny-Art"


siteTime : String
siteTime =
    "2018"


heroInfoInit : Array Hero
heroInfoInit =
    let
        hero0 =
            Hero "images/hero/slider0.jpg" "电视编导" "你是否有一个导演梦"

        hero1 =
            Hero "images/hero/slider1.jpg" "电台人生" "你有什么话想通过电台传播"

        hero2 =
            Hero "images/hero/slider2.jpg" "电视主持" "你是否想走上台前"

        hero3 =
            Hero "images/hero/slider3.jpg" "广播电台" "手把手实战操作"
    in
        fromList [ hero0, hero1, hero2, hero3 ]
