﻿(function($){
	// Settings
	var repeat = localStorage.repeat || 0,
		shuffle = localStorage.shuffle || 'false',
		continous = true,
		autoplay = true,
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
},
{
title: '挪威的森林',
artist: '伍佰',
album: '挪威的森林',
cover: 'images/20130325084808733.jpg',
mp3: 'http://7xnu97.com2.z0.glb.qiniucdn.com/music/挪威的森林.mp3',
ogg: 'http://dxsn.gongzuo.in/bowen/HTML5player/music/yiwangeshebude.ogg'
},
{
title: '天黑',
artist: '阿杜',
album: '天黑',
cover: 'images/20130325084808733.jpg',
mp3: 'http://7xnu97.com2.z0.glb.qiniucdn.com/music/天黑.mp3',
ogg: 'http://dxsn.gongzuo.in/bowen/HTML5player/music/yiwangeshebude.ogg'
},
{
title: '今天你要嫁给',
artist: '嫁给我',
album: '今天你要嫁给我',
cover: 'images/20130325084808733.jpg',
mp3: 'http://7xnu97.com2.z0.glb.qiniucdn.com/music/今天你要嫁给我.mp3',
ogg: 'http://dxsn.gongzuo.in/bowen/HTML5player/music/yiwangeshebude.ogg'
},
{
title: '漂洋过海来看你',
artist: '李宗盛',
album: '飘洋过海来看你',
cover: 'images/20130325084808733.jpg',
mp3: 'http://7xnu97.com2.z0.glb.qiniucdn.com/music/漂洋过海来看你.mp3',
ogg: 'http://dxsn.gongzuo.in/bowen/HTML5player/music/yiwangeshebude.ogg'
},
{
title: '琵琶语',
artist: '轻音乐',
album: '琵琶语',
cover: 'images/20130325084808733.jpg',
mp3: 'http://7xnu97.com2.z0.glb.qiniucdn.com/music/琵琶语.mp3',
ogg: 'http://dxsn.gongzuo.in/bowen/HTML5player/music/yiwangeshebude.ogg'
},
{
title: '饿狼传说',
artist: '张学友',
album: '饿狼传说',
cover: 'images/20130325084808733.jpg',
mp3: 'http://7xnu97.com2.z0.glb.qiniucdn.com/music/饿狼传说.mp3',
ogg: 'http://dxsn.gongzuo.in/bowen/HTML5player/music/yiwangeshebude.ogg'
},
{
title: '偏偏喜欢你',
artist: '陈百强',
album: '偏偏喜欢你',
cover: 'images/20130325084808733.jpg',
mp3: 'http://7xnu97.com2.z0.glb.qiniucdn.com/music/偏偏喜欢你-陈百强.mp3',
ogg: 'http://dxsn.gongzuo.in/bowen/HTML5player/music/yiwangeshebude.ogg'
},
{
title: '机器铃 砍菜刀',
artist: '张卫',
album: '机器铃 砍菜刀',
cover: 'images/20130325084808733.jpg',
mp3: 'http://7xnu97.com2.z0.glb.qiniucdn.com/music/机器铃 砍菜刀-张卫.mp3',
ogg: 'http://dxsn.gongzuo.in/bowen/HTML5player/music/yiwangeshebude.ogg'
},
{
title: '木有了',
artist: '木有了',
album: '木有了',
cover: 'images/20130325084808733.jpg',
mp3: 'http://7xnu97.com2.z0.glb.qiniucdn.com/music/木有了.mp3',
ogg: 'http://dxsn.gongzuo.in/bowen/HTML5player/music/yiwangeshebude.ogg'
},];

	// Load playlist
	for (var i=0; i<playlist.length; i++){
		var item = playlist[i];
		$('#playlist').append('<li>'+item.artist+' - '+item.title+'</li>');
	}

	var time = new Date(),
		currentTrack = shuffle === 'true' ? time.getTime() % playlist.length : 0,
		trigger = false,
		audio, timeout, isPlaying, playCounts;

	var play = function(){
		audio.play();
		$('.playback').addClass('playing');
		timeout = setInterval(updateProgress, 500);
		isPlaying = true;
	}

	var pause = function(){
		audio.pause();
		$('.playback').removeClass('playing');
		clearInterval(updateProgress);
		isPlaying = false;
	}

	// Update progress
	var setProgress = function(value){
		var currentSec = parseInt(value%60) < 10 ? '0' + parseInt(value%60) : parseInt(value%60),
			ratio = value / audio.duration * 100;

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

	// Switch track
	var switchTrack = function(i){
		if (i < 0){
			track = currentTrack = playlist.length - 1;
		} else if (i >= playlist.length){
			track = currentTrack = 0;
		} else {
			track = i;
		}

		$('audio').remove();
		loadMusic(track);
		if (isPlaying == true) play();
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
		pause();
		audio.currentTime = 0;
		playCounts++;
		if (continous == true) isPlaying = true;
		if (repeat == 1){
			play();
		} else {
			if (shuffle === 'true'){
				shufflePlay();
			} else {
				if (repeat == 2){
					switchTrack(++currentTrack);
				} else {
					if (currentTrack < playlist.length) switchTrack(++currentTrack);
				}
			}
		}
	}

	var beforeLoad = function(){
		var endVal = this.seekable && this.seekable.length ? this.seekable.end(0) : 0;
		$('.progress .loaded').css('width', (100 / (this.duration || 1) * endVal) +'%');
	}

	// Fire when track loaded completely
	var afterLoad = function(){
		if (autoplay == true) play();
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
	$('.playback').on('click', function(){
		if ($(this).hasClass('playing')){
			pause();
		} else {
			play();
		}
	});
	$('.rewind').on('click', function(){
		if (shuffle === 'true'){
			shufflePlay();
		} else {
			switchTrack(--currentTrack);
		}
	});
	$('.fastforward').on('click', function(){
		if (shuffle === 'true'){
			shufflePlay();
		} else {
			switchTrack(++currentTrack);
		}
	});
	$('#playlist li').each(function(i){
		var _i = i;
		$(this).on('click', function(){
			switchTrack(_i);
		});
	});

	if (shuffle === 'true') $('.shuffle').addClass('enable');
	if (repeat == 1){
		$('.repeat').addClass('once');
	} else if (repeat == 2){
		$('.repeat').addClass('all');
	}

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

	$('.shuffle').on('click', function(){
		if ($(this).hasClass('enable')){
			shuffle = localStorage.shuffle = 'false';
			$(this).removeClass('enable');
		} else {
			shuffle = localStorage.shuffle = 'true';
			$(this).addClass('enable');
		}
	});
})(jQuery);