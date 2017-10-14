<%--
  Created by IntelliJ IDEA.
  User: yyq
  Date: 2017/9/15
  Time: 5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"  pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ACG音乐</title>
    <%--<link rel="stylesheet" href="${ctxStatic}/css/style.css"/>--%>

    <link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css"/>

    <style type="text/css">


        body {
            padding-top: 40px;
            background-color: #44240d;
        }

        .myWrapper {
            background: url(${ctxStatic}/pic/songBg.jpg) no-repeat center top;
        }

        .logo {
            height: 70px;
        }

        .logo-gif {
            position: absolute;
            top: 20%;
            margin-left: 116px;
        }

        .headline {
            background: url(/static/pic/nav-bg-img.jpg) no-repeat;
        }

        #bs-example-navbar-collapse-2 li > a:hover {
            text-decoration: none;
            cursor: pointer;
            color: #F6F
        }

        .dropdown{
            position: relative;
        }
        .dropdown-menu{
            /*padding: 0;*/
            display: none;
            position: absolute;
        }


        .nav .dropdown:hover .dropdown-menu{
            display: block;
        }

        #bs-example-navbar-collapse-2 .second-nav .dropdown-menu a:hover{
            padding-left: 24px;
            color: #000;
        }

        a {
            outline: none;
            text-decoration: none;
        }

        .left {
            float: left;
        }

        .right {
            float: right;
        }

        .clear {
            clear: both;
        }

        #background {
            background: url(${ctxStatic}/pic/player/mainbg.jpg);
            background-size: cover;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            -moz-user-select: none;
            -khtml-user-select: none;
            -webkit-user-select: none;
            -o-user-select: none;
            user-select: none;
        }

        #player {
            width: 500px;
            height: 180px;
            padding: 25px;
            margin: 25px auto 30px;
            position: relative;
        }
        #player .cover {
            background: rgba(0, 0, 0, 0.5);
            border: 1px solid #333;
            position: absolute;
            top: 25px;
            left: 25px;
            overflow: hidden;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            -o-border-radius: 10px;
            -ms-border-radius: 10px;
            -khtml-border-radius: 10px;
            border-radius: 10px;
            width: 130px;
            height: 130px;
            -moz-box-shadow: 0 2px 10px black;
            -webkit-box-shadow: 0 2px 10px black;
            -o-box-shadow: 0 2px 10px black;
            box-shadow: 0 2px 10px black;
        }
        #player .cover img {
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            -o-border-radius: 10px;
            -ms-border-radius: 10px;
            -khtml-border-radius: 10px;
            border-radius: 10px;
            width: 130px;
            height: 130px;
        }
        #player .ctrl {
            margin-left: 155px;
            text-shadow: 0 1px 2px #000;
            line-height: 16px;
        }
        #player .ctrl .tag strong, #player .ctrl .tag span {
            display: block;
            text-overflow: ellipsis;
        }
        #player .ctrl .tag span {
            font-size: 12px;
            margin-top: 5px;
            color: #ccc;
        }
        #player .ctrl .icon {
            background-repeat: no-repeat;
            background-position: center;
            display: inline-block;
            opacity: 0.6;
            cursor: pointer;
            width: 24px;
            height: 24px;
            -moz-transition: 0.3s;
            -webkit-transition: 0.3s;
            -o-transition: 0.3s;
            transition: 0.3s;
            -moz-user-select: none;
            -khtml-user-select: none;
            -webkit-user-select: none;
            -o-user-select: none;
            user-select: none;
        }
        #player .ctrl .icon:hover, #player .ctrl .icon.enable {
            opacity: 1;
        }
        #player .ctrl .icon:active {
            opacity: 0.3;
        }
        #player .ctrl .control {
            margin-top: 10px;
            height: 25px;
        }
        #player .ctrl .control .rewind {
            background-image: url(${ctxStatic}/pic/player/rewind.png);
        }
        #player .ctrl .control .playback {
            background-image: url(${ctxStatic}/pic/player/play.png);
        }
        #player .ctrl .control .playback.playing {
            background-image: url(${ctxStatic}/pic/player/pause.png);
        }
        #player .ctrl .control .fastforward {
            background-image: url(${ctxStatic}/pic/player/fastforward.png);
        }
        #player .ctrl .control .volume .mute {
            background-image: url(${ctxStatic}/pic/player/volume.png);
        }
        #player .ctrl .control .volume .mute.enable {
            background-image: url(${ctxStatic}/pic/player/mute.png);
        }
        #player .ctrl .control .volume .slider {
            margin-top: 11px;
            margin-left: 10px;
            width: 100px;
        }
        #player .ctrl .myProgress {
            margin-top: 10px;
        }
        #player .ctrl .myProgress .timer {
            font-size: 12px;
            color: #ccc;
            margin-top: 8px;
        }
        #player .ctrl .myProgress .repeat, #player .ctrl .myProgress .shuffle {
            background-position: center bottom;
        }
        #player .ctrl .myProgress .repeat {
            background-image: url(${ctxStatic}/pic/player/repeat.png);
        }
        #player .ctrl .myProgress .repeat.once, #player .ctrl .myProgress .repeat.all {
            opacity: 1;
        }
        #player .ctrl .myProgress .repeat.once {
            position: relative;
        }
        #player .ctrl .myProgress .repeat.once:before {
            content: "1";
            position: absolute;
            top: 3px;
            right: -2px;
            font-size: 8px;
        }
        #player .ctrl .myProgress .shuffle {
            background-image: url(${ctxStatic}/pic/player/shuffle.png);
        }

        .slider {
            background: rgba(0, 0, 0, 0.3);
            height: 5px;
            position: relative;
            cursor: pointer;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            -o-border-radius: 5px;
            -ms-border-radius: 5px;
            -khtml-border-radius: 5px;
            border-radius: 5px;
            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.5) inset;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.5) inset;
            -o-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.5) inset;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.5) inset;
        }
        .slider:hover a, .slider.enable a {
            opacity: 1;
        }
        .slider a {
            background: #fff;
            margin-left: -2.5px;
            position: absolute;
            opacity: 0;
            width: 5px;
            height: 5px;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            -o-border-radius: 50%;
            -ms-border-radius: 50%;
            -khtml-border-radius: 50%;
            border-radius: 50%;
            -moz-transition: opacity 0.3s;
            -webkit-transition: opacity 0.3s;
            -o-transition: opacity 0.3s;
            transition: opacity 0.3s;
        }
        .slider .loaded, .slider .pace {
            position: absolute;
            height: 100%;
            opacity: 0.7;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            -o-border-radius: 5px;
            -ms-border-radius: 5px;
            -khtml-border-radius: 5px;
            border-radius: 5px;
        }
        .slider .loaded {
            background: rgba(255, 255, 255, 0.1);
        }
        .slider .pace {
            background: #258fb8;
        }

        #playlist {
            background: rgba(0, 0, 0, 0.5);
            width: 470px;
            margin: 0 auto 50px;
            padding: 10px 15px;
            list-style: none;
            position: relative;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            -o-border-radius: 5px;
            -ms-border-radius: 5px;
            -khtml-border-radius: 5px;
            border-radius: 5px;
            -moz-box-shadow: 0 2px 6px rgba(0, 0, 0, 0.5);
            -webkit-box-shadow: 0 2px 6px rgba(0, 0, 0, 0.5);
            -o-box-shadow: 0 2px 6px rgba(0, 0, 0, 0.5);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.5);
        }
        #playlist li {
            color: #aaa;
            font-size: 12px;
            line-height: 2;
            padding-left: 25px;
            cursor: pointer;
            text-overflow: ellipsis;
            -moz-transition: 0.3s;
            -webkit-transition: 0.3s;
            -o-transition: 0.3s;
            transition: 0.3s;
        }
        #playlist li:hover {
            color: #fff;
        }
        #playlist li.playing {
            background: url(${ctxStatic}/pic/player/playing.png) no-repeat 0 center;
            color: #fff;
            font-weight: bold;
        }

        footer {
            position: relative;
            font-size: 12px;
            color: white;
            margin-top:160px;
            text-shadow: 0 1px 2px #000;
            text-align: center;
        }
        footer a {
            color: #fff;
            font-weight: bold;
        }
        footer a:hover {
            text-decoration: none;
        }

    </style>

</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false"><span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav first-nav">
                <li><a href="#">首页 </a></li>
                <li class="dropdown nav_178"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                                aria-haspopup="true" aria-expanded="false">导航</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">新闻资讯保</a></li>
                        <li><a href="#">动漫频道</a></li>
                        <li><a href="#">游戏</a></li>
                        <li><a href="#">社区</a></li>
                    </ul>
                </li>
                <li class="weibo"><a href="#">新浪微博</a></li>
                <li class="wechat"><a href="#">关注微信</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="myWrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 logo">
                <%--<img class="logo-png" src="${ctxStatic}/pic/head-logo.png"> --%>
                <%--<img class="logo-gif" src="${ctxStatic}/pic/songGif.gif">--%>
            </div>
        </div>
    </div>
    <div class="container">
    <div class="row">
        <div class="col-lg-12">
            <nav class="navbar navbar-default headline">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-2" aria-expanded="false"><span
                                class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span></button>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                            <ul class="nav navbar-nav second-nav">
                                <li class="item"><a href="${ctxPath}/client/showAnimation">看过的动画 </a></li>
                                <%--<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                                        role="button" aria-haspopup="true" aria-expanded="false">动漫情报 </a>
                                    <ul class="dropdown-menu ">
                                        <li><a href="#">国产动画/漫画</a></li>
                                        <li><a href="#">动画/漫画情报</a></li>
                                        <li><a href="#">真人/舞台剧</a></li>
                                        <li><a href="#">广播剧/轻小说/杂志</a></li>
                                        <li><a href="#">音乐/OP/ED/OST</a></li>
                                    </ul>
                                </li>--%>
                                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                                        role="button" aria-haspopup="true" aria-expanded="false">动漫歌曲</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">歌曲</a></li>
                                        <li><a href="#">配乐</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                                        role="button" aria-haspopup="true"
                                                        aria-expanded="false">萌周边</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">黏土人偶</a></li>
                                        <li><a href="#">立体手办</a></li>
                                        <li><a href="#">周边其他</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                                        role="button" aria-haspopup="true"
                                                        aria-expanded="false">福利社 </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">腐女</a></li>
                                        <li><a href="#">绅士</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                                        role="button" aria-haspopup="true"
                                                        aria-expanded="false">万事屋</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">涨姿势</a></li>
                                        <li><a href="#">猎奇文化</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">游戏宅</a></li>
                                <li><a href="#">八卦谈</a></li>
                                <!--
                                <form class="navbar-form navbar-left navbar-myform ">
                                  <div class="form-group">
                                    <input type="text" class="form-control " placeholder="请输入关键字进行搜索">
                                  </div>
                                </form>-->
                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                    </div>
                </div><!-- /.container-fluid -->
            </nav>
        </div>
    </div>
</div>

    <div id="player">
                    <div class="cover"></div>
                    <div class="ctrl">
                        <div class="tag">
                            <strong>Title</strong>
                            <span class="artist">Artist</span>
                            <span class="album">Album</span>
                        </div>
                        <div class="control">
                            <div class="left">
                                <div class="rewind icon"></div>
                                <div class="playback icon"></div>
                                <div class="fastforward icon"></div>
                            </div>
                            <div class="volume right">
                                <div class="mute icon left"></div>
                                <div class="slider left">
                                    <div class="pace"></div>
                                </div>
                            </div>
                        </div>
                        <div class="myProgress">
                            <div class="slider">
                                <div class="loaded"></div>
                                <div class="pace"></div>
                            </div>
                            <div class="timer left">0:00</div>
                            <div class="right">
                                <div class="repeat icon"></div>
                                <div class="shuffle icon"></div>
                            </div>
                        </div>
                    </div>
                </div>
    <ul id="playlist"></ul>

</div>




<%--<script src="${ctxStatic}/js/script.js"></script>--%>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<%--<script src="${ctxStatic}/js/jquery172.js"></script>--%>
<script src="${ctxStatic}/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/js/jquery-ui-1.12.1.min.js"></script>
<script>
     $(document).ready(function () {
        var repeat = localStorage.repeat || 0,
            shuffle = localStorage.shuffle || 'false',
            autoplay = true,//列表不停循环（repeat=2），设为true;列表只循环一遍（repeat=1），设为false
            playlist = [

        {
            title: '创圣のアクエリオン(オープニングテーマ)',
            artist: 'AKINO',
            album: '创圣のアクエリオン',
            cover:'${ctxStatic}/pic/songCover/csddts.jpg',
            mp3: '${ctxStatic}/music/csddts.mp3'
        },
        {
            title: 'Motherland',
            artist: 'Crystal Kay',
            album: '鋼の錬金術師 THE BEST',
            cover: '${ctxStatic}/pic/songCover/gzljss.jpg',
            mp3: '${ctxStatic}/music/Motherland.mp3'
        },
        {
            title: 'The Everlasting Guilty Crown',
            artist: 'EGOIST',
            album: 'Extra terrestrial Biological Entities',
            cover: '${ctxStatic}/pic/songCover/zuiewangguan.jpg',
            mp3: '${ctxStatic}/music/The Everlasting Guilty Crown.mp3'
         },
         {
             title: 'PRIDE',
             artist: 'HIGH and MIGHTY COLOR',
             album: 'PRIDE',
             cover: '${ctxStatic}/pic/songCover/gaodasd.jpg',
             mp3: '${ctxStatic}/music/PRIDE.mp3'
          },
          {
             title: 'heavenly blue',
             artist: 'Kalafina',
             album: 'heavenly blue',
             cover: '${ctxStatic}/pic/songCover/AldnoahZero.jpg',
             mp3: '${ctxStatic}/music/heavenly blue.mp3'
          },
          {
              title: 'DAYBREAK’S BELL',
              artist: 'LArc-en-Ciel',
              album: '機動戦士ガンダムOO ORIGINAL SOUND TRACK 2',
              cover: '${ctxStatic}/pic/songCover/gaoda00.jpg',
              mp3: '${ctxStatic}/music/DAYBREAKS BELL.mp3'
           },
           {
               title: 'つないだ手',
               artist: 'LilB',
               album: 'つないだ手',
               cover: '${ctxStatic}/pic/songCover/gzljss.jpg',
               mp3: '${ctxStatic}/music/jqds.mp3'
            },
            {
               title: 'I Will',
               artist: 'Sowelu',
               album: '鋼の錬金術師 THE BEST',
               cover: '${ctxStatic}/pic/songCover/gzljss.jpg',
               mp3: '${ctxStatic}/music/I Will.mp3'
             },
             {
                title: '乱舞のメロディ',
                artist: 'シド',
                album: 'BLEACH BEST TRAX',
                cover: '${ctxStatic}/pic/songCover/bleach.jpg',
                mp3: '${ctxStatic}/music/luanwu.mp3'
             },
             {
                 title: '桜音',
                 artist: 'ピコ',
                 album: '银魂BEST2',
                 cover: '${ctxStatic}/pic/songCover/yinhun.jpg',
                 mp3: '${ctxStatic}/music/yingyin.mp3'
             },
             {
                 title: 'ほうき星(bleach ed3)',
                 artist: 'ユンナ',
                 album: 'Bleach The Best',
                 cover: '${ctxStatic}/pic/songCover/bleach.jpg',
                 mp3: '${ctxStatic}/music/huixing.mp3'
             },
             {
                 title: 'Fight Together',
                 artist: '安室奈美恵',
                 album: 'ONE PIECE 15th Anniversary BEST ALBUM',
                 cover: '${ctxStatic}/pic/songCover/onepiece.jpg',
                 mp3: '${ctxStatic}/music/Fight Together.mp3'
             },
             {
                 title: 'Pray',
                 artist: '川瀬智子',
                 album: '银魂BEST',
                 cover: '${ctxStatic}/pic/songCover/yinhun.jpg',
                 mp3: '${ctxStatic}/music/Pray.mp3'
              },
              {
                  title: 'ラヴァーズ(火影疾风传op9)',
                  artist: '7!!',
                  album: 'ラヴァーズ',
                  cover:'${ctxStatic}/pic/songCover/huoying.jpg',
                  mp3:'${ctxStatic}/music/Lovers.mp3'
               },
              {
                  title: 'ウォーアイニー',
                  artist: '高橋瞳,BEAT CRUSADERS DL',
                  album: '银魂BEST2',
                  cover: '${ctxStatic}/pic/songCover/yinhun.jpg',
                  mp3: '${ctxStatic}/music/yhwan.mp3'
               },
               {
                  title: '今、話したい誰かがいる',
                  artist: '乃木坂46',
                  album: '今、話したい誰かがいる',
                  cover: '${ctxStatic}/pic/songCover/xinyuhuhuan.jpg',
                  mp3: '${ctxStatic}/music/xzyhxdmrs.mp3'
               },
               {
                   title: 'アンインストール',
                   artist: '石川智晶',
                   album: '仆はまだ何も知らない',
                   cover: '${ctxStatic}/pic/songCover/dqfwsn.jpg',
                   mp3: '${ctxStatic}/music/xiezai.mp3'
               },
               {
                   title: 'HEART OF SWORD~夜明け前~',
                   artist: '西川貴教',
                   album: 'るろうに剣心-明治剣客浪漫谭',
                   cover: '${ctxStatic}/pic/songCover/langkejianxin.jpg',
                   mp3: '${ctxStatic}/music/HEART OF SWORD.mp3'
               }
        ];

        // Load playlist
        for (var i=0; i<playlist.length; i++){
            var item = playlist[i];
            $('#playlist').append('<li>'+item.artist+' - '+item.title+'</li>');
        }

        var time = new Date(),
            currentTrack = shuffle === 'true' ? time.getTime() % playlist.length : 0,
            audio,
            timeout,
            isPlaying = true;

        //按播放键
        var play = function(){
            isPlaying = true;
            audio.play();
            $('.playback').addClass('playing');
            timeout = setInterval(updateProgress, 500);
         }

        //按暂停键
        var pause = function(){
            isPlaying = false;
            audio.pause();
            $('.playback').removeClass('playing');
            clearInterval(updateProgress);
         }

        //播放进度
        var setProgress = function(value){
            var currentSec = parseInt(value%60) < 10 ? '0' + parseInt(value%60) : parseInt(value%60),
            ratio = value / audio.duration * 100;
            //进度时间显示
            $('.timer').html(parseInt(value/60)+':'+currentSec);
            $('.myProgress .pace').css('width', ratio + '%');
            $('.myProgress .slider a').css('left', ratio + '%');
        }

        var updateProgress = function(){
            setProgress(audio.currentTime);
        }

        // Progress slider
        $('.myProgress .slider').slider({step: 0.1, slide: function(event, ui){
            $(this).addClass('enable');
            setProgress(audio.duration * ui.value / 100);
            clearInterval(timeout);
        }, stop: function(event, ui){
            audio.currentTime = audio.duration * ui.value / 100;
            $(this).removeClass('enable');
            timeout = setInterval(updateProgress, 500);
        }});

        // Volume slider
        var setVolume = function(value){
            audio.volume = localStorage.volume = value;
            $('.volume .pace').css('width', value * 100 + '%');
            $('.volume .slider a').css('left', value * 100 + '%');
        }

        var volume = localStorage.volume || 0.5;
        $('.volume .slider').slider({max: 1, min: 0, step: 0.01, value: volume, slide: function(event, ui){
            setVolume(ui.value);
            $(this).addClass('enable');
            $('.mute').removeClass('enable');
        }, stop: function(){
            $(this).removeClass('enable');
        }}).children('.pace').css('width', volume * 100 + '%');

        $('.mute').click(function(){
                if ($(this).hasClass('enable')){
                setVolume($(this).data('volume'));
                $(this).removeClass('enable');
            } else {
                $(this).data('volume', audio.volume).addClass('enable');
                setVolume(0);
            }
        });

        // 更换曲子
        var switchTrack = function(i){
            if (i < 0){
                currentTrack = playlist.length - 1;
            } else if (i >= playlist.length){
                currentTrack = 0;
            } else {
                currentTrack = i;
            }
            $('audio').remove();
            loadMusic(currentTrack);
        }

        // Shuffle
        var shufflePlay = function(){
            var time = new Date(),
            lastTrack = currentTrack;
            currentTrack = time.getTime() % playlist.length;
            if (lastTrack == currentTrack) ++currentTrack;
            switchTrack(currentTrack);
        }

        // Fire when track ended
        var ended = function(){
            //pause();
            audio.currentTime = 0;
            if (repeat == 1){
                autoplay = true;
                play();
            } else {
                if (shuffle === 'true'){
                    autoplay = true;
                    shufflePlay();
                } else {
                    if (repeat == 2){
                        autoplay = true;
                        switchTrack(++currentTrack);
                    } else {
                        if (currentTrack+1 < playlist.length )
                            switchTrack(++currentTrack);
                        else
                            pause();
                    }
                }
            }
        }

        var beforeLoad = function(){
            var endVal = this.seekable && this.seekable.length ? this.seekable.end(0) : 0;
            $('.myProgress .loaded').css('width', (100 / (this.duration || 1) * endVal) +'%');
        }

        // 曲子准备好了。播放之前做的事
        var afterLoad = function(){
            if (autoplay == true){
                if(isPlaying == true)
                    play();
                else pause();
            }
        }

        // Load track
        var loadMusic = function(i){
                var item = playlist[i],
                newaudio = $('<audio>').html('<source src="'+item.mp3+'">').appendTo('#player');

                $('.cover').html('<img src="'+item.cover+'" alt="'+item.album+'">');
                $('.tag').html('<strong>'+item.title+'</strong><span class="artist">'+item.artist+'</span><span class="album">'+item.album+'</span>');
                $('#playlist li').removeClass('playing').eq(i).addClass('playing');
                audio = newaudio[0];
                audio.volume = $('.mute').hasClass('enable') ? 0 : volume;
                audio.addEventListener('myProgress', beforeLoad, false);
                audio.addEventListener('durationchange', beforeLoad, false);
                audio.addEventListener('canplay', afterLoad, false);
                audio.addEventListener('ended', ended, false);
            }

            loadMusic(currentTrack);

            //开始播放和暂停
            $('.playback').on('click', function(){
                if ($(this).hasClass('playing')){
                    pause();
                } else {
                    play();
                }
            });

            //上一首
            $('.rewind').on('click', function(){
                if (shuffle === 'true'){
                    shufflePlay();
                } else {
                    switchTrack(--currentTrack);
                }
            });

            //下一首
            $('.fastforward').on('click', function(){
                if (shuffle === 'true'){
                shufflePlay();
              } else {
                switchTrack(++currentTrack);
              }
            });

            //点击其中一首
            $('#playlist li').each(function(i){
                var _i = i;
                $(this).on('click', function(){
                    switchTrack(_i);
                });
            });

            //随机的样子
            if (shuffle === 'true') $('.shuffle').addClass('enable');

             //重复的样子
            if (repeat == 1){
                $('.repeat').addClass('once');
            } else if (repeat == 2){
                $('.repeat').addClass('all');
            }

            //点了重复按钮
            $('.repeat').on('click', function(){
            if ($(this).hasClass('once')){
                repeat = localStorage.repeat = 2;
                $(this).removeClass('once').addClass('all');
            } else if ($(this).hasClass('all')){
                repeat = localStorage.repeat = 0;
                $(this).removeClass('all');
            } else {
                repeat = localStorage.repeat = 1;
                $(this).addClass('once');
            }
            });

            //点了随机按钮
            $('.shuffle').on('click', function(){
                if ($(this).hasClass('enable')){
                shuffle = localStorage.shuffle = 'false';
                $(this).removeClass('enable');
            } else {
                shuffle = localStorage.shuffle = 'true';
                $(this).addClass('enable');
            }
            });
        });
</script>

</body>
</html>