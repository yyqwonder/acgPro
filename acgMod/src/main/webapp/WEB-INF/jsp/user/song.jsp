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
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ACG音乐</title>
    <link rel="stylesheet" href="${ctxStatic}/css/style.css"/>

    <%--<link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css"/>--%>
</head>
<body>



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
                        <div class="progress">
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






<%--<script src="${ctxStatic}/js/script.js"></script>--%>

<%--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>--%>
<script src="${ctxStatic}/js/jquery172.js"></script>
<%--<script src="${ctxStatic}/js/bootstrap.min.js"></script>--%>
<script src="${ctxStatic}/js/jquery-ui-1.8.17.custom.min.js"></script>
<script>
     $(document).ready(function () {
        var repeat = localStorage.repeat || 0,
            shuffle = localStorage.shuffle || 'false',
            autoplay = true,//列表不停循环（repeat=2），设为true;列表只循环一遍（repeat=1），设为false
            playlist = [
        {
            title: 'trust you',
            artist: '伊藤由奈',
            album: 'trust you',
            cover:'${ctxStatic}/pic/songCover/gaoda00.jpg',
            mp3:'${ctxStatic}/music/trust you.mp3'
        },

        {
            title: '梦缠绵',
            artist: '庄心妍',
            album: '梦缠绵',
            cover:'images/gaoda00.jpg',
            mp3: 'http://7xnu97.com2.z0.glb.qiniucdn.com/music/梦缠绵.mp3',
            ogg: 'http://dxsn.gongzuo.in/bowen/HTML5player/music/jianshangdie.ogg'
        },
        {
            title: '漂洋过海的鱼',
            artist: '庄心妍',
            album: '漂洋过海的鱼',
            cover: 'images/132731360220331_4.jpg',
            mp3: 'http://7xnu97.com2.z0.glb.qiniucdn.com/music/庄心妍%20-%20飘洋过海的鱼.mp3',
            ogg: 'http://dxsn.gongzuo.in/bowen/HTML5player/music/wokeyibaonima.ogg'
        },
        {
            title: '两个人的回忆一个人过',
            artist: '庄心妍',
            album: '两个人的回忆一个人过',
            cover: 'images/20130325084808733.jpg',
            mp3: 'http://7xnu97.com2.z0.glb.qiniucdn.com/music/庄心妍%20-%20两个人的回忆一个人过.mp3',
            ogg: 'http://dxsn.gongzuo.in/bowen/HTML5player/music/yiwangeshebude.ogg'
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
            $('.progress .pace').css('width', ratio + '%');
            $('.progress .slider a').css('left', ratio + '%');
        }

        var updateProgress = function(){
            setProgress(audio.currentTime);
        }

        // Progress slider
        $('.progress .slider').slider({step: 0.1, slide: function(event, ui){
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
            $('.progress .loaded').css('width', (100 / (this.duration || 1) * endVal) +'%');
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
                audio.addEventListener('progress', beforeLoad, false);
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