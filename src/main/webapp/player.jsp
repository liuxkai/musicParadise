<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>音频播放器</title>
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
	<link rel="icon" href="static/images/280558b50ba60daaf75986fecfef32fd.png">
    <link rel="stylesheet" href="html5music/css/mobile.css">
    <!--音频播放器-->
    <link rel="stylesheet" href="html5music/audio/css/audio_player.css">
</head>
<body>
    <div class="bg_white mb_20 pb_20 pad30">
        <div class="box_radio">
            <div class="book_title">
                <div class="audio_title"> </div>
            </div>
            <div class="audio_box">
                <!--音乐控制面板-->
                <div class="audio_btn">
                    <!--快退-->
                    <img class="btn_fr" src="html5music/audio/img/btn_fr.png" alt="">
                    <!--旋转碟片-->
                    <div class="cover" id="play"></div>
                    <!--暂停/播放按钮-->
                    <div class="btn_play btn_pause"></div>
                    <!--快进-->
                    <img class="btn_ff" src="html5music/audio/img/btn_ff.png" alt="">
                </div>
                <div class="music-nav">
                    <!--当前时间-->
                    <div class="time" id="time_cur"> </div>
                    <!--进度条-->
                    <div class="audio_progress">
                        <span class="audio_line"></span>
                        <span class="audio_blue"></span>
                        <span class="audio_dot"></span>
                        <input type="range" min="0" max="0" step="0.4" value="0" id="scale" >
                    </div>
                    <!--歌曲时长-->
                    <div class="time" id="time_long"></div>
                </div>
                <audio id="music" src="">
                  	  您的浏览器不支持HTML5音频。
                </audio>
            </div>
        </div>
    </div>
    <div class="bg_white mb_20 pb_20 pad30">
        <div class="des_title">
        </div>
        <div class="des_sub_title">
            <span class="green_line"></span>
            歌词
        </div>

        <div class="des_info lyric_wrap" >
            <ul id="lyric_list">

            </ul>
        </div>

        <div class="des_sub_title">
            <span class="green_line"></span>
            歌手
        </div>
        <div class="des_info" id="singer"></div>
    </div>
	<!--底部导航-->
    <div class="height100"></div>
    <ul class="tabbar">
        <img class="btn_up" src="html5music/images/btn_up.png" alt="">
        <div class="pupbox">
            <img class="btn_down" src="html5music/images/btn_down.png" alt="">
            <!--歌曲列表-->
            <ul class="song_list">
            </ul>
        </div>
        <li>
            <div class="btn_prev">
                <span>上一首</span>
            </div>
        </li>
        <li>
            <div class="btn_next">
                <span>下一首</span>
            </div>
        </li>
    </ul>
    <input type="hidden" id="input4" value="${ param.Rid }" /><!-- 获取要请求推荐歌单的Rid -->
    <input type="hidden" id="input3" value="${ param.songName }" /><!-- 获取要请求的单首歌曲名称 -->
	<input type="hidden" id="input" value="${ param.singerType }" /><!-- 获取要请求的歌曲类型,这里写错了，是song不是singer -->
	<input type="hidden" id="input2" value="${ param.keyword }" /><!-- 获取搜索关键字 -->
    <script src="html5music/js/jquery.min.js"></script>
    <!--旋转动画插件-->
    <script src="html5music/audio/js/jquery.rotate.min.js"></script>
    <!--音频播放器-->
   <!-- <script src="html5music/audio/js/audio_player.js"></script>-->
    <script>
        $(function () {
            var $pupbox =  $(".pupbox"),
                $btnUp  = $(".btn_up"),
                $btnDown  = $(".btn_down");
            $pupbox.hide();
            $btnUp.show();
            /*弹窗*/
            $btnDown.click(function(){
                $pupbox.slideUp(500);   //巨坑:slideUP()和slideDown()方向的问题
                $btnUp.delay(500).show(0)//元素position属性为absolute时，可以通过设置top/bottom来控制方向
            });
            $btnUp.click(function(){ 
                $pupbox.slideDown(500);
                $(this).hide(0)
            });
            $(".bg_white, .height100").click(function() { //点击外部将.pupbox收回
            	$pupbox.slideUp(500);   
                $btnUp.delay(500).show(0)
            });
        });
    </script>
    
<script type="text/javascript">
		var url = $('#input').val();//动态的为ajax请求的接口赋值
		var url2 = '';
		if($('#input2').val() !== ''){
			url2 = '&keyword='+$('#input2').val()
		}
		var url3 = '';
		if($('#input3').val() !== ''){
			url3 = '&songName='+$('#input3').val()
		}
		var url4 = '';
		if($('#input4').val() !== ''){
			url4 = '&Rid='+$('#input4').val()
		}
		//console.log("JsonDataInterface?method=");
		//console.log("JsonDataInterface?method="+url2);
		;(function($){
	    var rotatetimer,    /* 旋转定时器 */
	        isNext = true,  /* 播放结束是下一首还是暂停 */
	        isloop = true,  /* 是否循环播放 */
	        isPlay = false, /* 播放状态 */
	        angle = 0,      /* 旋转角度 */
	        i = 0,
	        max = 0,        /* 时长 */
	        value = 0,
	        $cover = $('.cover'),
	        $btnPlay= $('.btn_play'),
	        $scale = $('#scale'),
	        $btnFf = $('.btn_ff'),
	        $btnFr = $('.btn_fr'),
	        $timeCur = $('#time_cur'),
	        $btnNext = $('.btn_next'),
	        $btnPrev = $('.btn_prev'),
	        $audioDot = $('.audio_dot'),
	        $audioBlue = $('.audio_blue'),
	        $audioLine = $('.audio_line'),
	        $audioTitle = $('.audio_title'),
	        $lyricList = $("#lyric_list"),
	        $singer = $('#singer'),
	        $songList = $('.song_list'),
	        wLine = $audioLine.width(),
	        wDot = $audioDot.width(),
	        $timeLong = $('#time_long'),
	        $music=$('#music'),
	        music = $music.get(0);          /* jQuery对象 转换为 DOM对象 以便于操作 Audio 对象*/
	    (function getData() {
	    	console.log("JsonDataInterface?method="+url+url2+url3+url4);
	        $.ajax({
	            url: "JsonDataInterface?method="+url+url2+url3+url4,//动态获得的请求url地址后，
	            cache:false,
	            dataType: "json",
	            success:function(data){
	                musList = data;         /* 获取json数据 赋值 给musList数组 */
	                lens=musList.length;
	                /*初始化*/
	                $cover.css('background-image', "url(" + musList[0].cov + ")");/*歌曲海报 */
	                $music.attr('src', musList[0].voi);          /* 歌曲链接 */
	                $audioTitle.html(musList[0].tit);            /* 歌曲名称 */
	                $singer.html(musList[0].inf);                /* 歌手信息，在此直接放字符串了，也可以像歌词一样单独列出来 */
	                /*歌曲列表*/
	                $.each( musList, function(index, items) {
	                    $songList.html($songList.html()+'<li>' +items.tit + '</li>');
	                });
	                $songList.find('li').eq(0).addClass('cur'); /* 初始化歌曲列表 第一首高亮 */
	                /*点播歌曲*/
	                $songList.find('li').on('click', function() {
	                    i = $(this).index();                    /* i 用来 关联点播以后的“上一首”“下一首”*/
	                    play(i)
	                });
	                getTime();                                   /* 初始化第一个歌曲时长 */
	                renderLyric(0)                               /* 初始化第一个歌曲歌词 */
	
	            },
	            error:function(){
	                $songList.html('<li>音乐列表获取失败！</li>');
	                $lyricList.html('<li style="color: red; font-size: 0.36rem">ajax异步获取歌曲， 必须服务器支持才能打开，例如：wampserver ，MAMP 或者 webstorm 浏览器！</li>');
	                console.log((" ajax异步获取歌曲， 必须服务器支持才能打开，例如：wampserver ，MAMP 或者 webstorm 浏览器预览"));
	            }
	        });
			
	    })();
	
	    /* 获取歌曲时长 因为要加载完成才能获取时长，所以设置 延时获取*/
	    function getTime() {
	        setTimeout(function () {
	            isNaN(music.duration)?getTime():$timeLong.html(toTwo(music.duration))
	        });
	    }
	    /*播放*/
	    $btnPlay.on('click', function() {
	        isPlay ? nplay() : iplay() ;
	    });
	
	    /*切换音乐*/
	    $btnNext.on('click', function() {
	        next();
	    });
	    $btnPrev.on('click', function() {
	        prev()
	    });
	    /*快进 快退*/
	    $btnFf.on('click', function() {
	        music.currentTime += 5;
	    });
	    $btnFr.on('click', function() {
	        music.currentTime -= 5;
	    });
	    function prev() {             /*上一首  是否向上循环播放*/
	        i>0 ? i-- :(isloop?i=lens-1:console.log('已经是最后一首了'));
	        play(i)
	    }
	    function next() {            /*下一首 是否向下循环播放*/
	        (i<=lens-2) ? i++ : (isloop ? i=0 : console.log('已经是最后一首了')) ;
	        play(i)
	    }
	
	    /*播放歌曲方法*/
	    function play(j) {
	        $cover.css('background-image', "url(" + musList[j].cov + ")");  /* 更换对应歌曲海报 */
	        $music.attr('src', musList[j].voi);                             /* 更换对应歌曲链接 */
	        $audioTitle.html(musList[j].tit);                               /* 更换对应歌曲名称 */
	        //console.log(musList[j].tit);
	        $singer.html(musList[j].inf);                                   /* 歌手信息，在此直接放字符串了，也可以像歌词一样单独列出来 */
	        $songList.find('.cur').removeClass('cur');
	        $songList.find('li').eq(i).addClass('cur');                     /* 当前播放歌曲高亮 */
	        isPlay ? iplay(): nplay();
	        renderLyric(j);                                                  /* 获取对应歌词 */
	        getTime();                                                       /* 获取对应时长 */
	    }
	
	    /*播放状态*/
	    function iplay() {
	        clearInterval(rotatetimer);
	        $btnPlay.removeClass('btn_pause');
	        (music.onloadeddata = function () {         /* loadeddata 当浏览器已加载音频/视频的当前帧时触发。*/
	            $scale.attr('max', music.duration);
	            max = Math.round(music.duration);
	            $timeLong.html(toTwo(music.duration));  /*加载载歌曲时长*/
	        })();
	        music.play();
	        isPlay = true;
	        <!--jquery.rotate旋转动画插件-->
	        rotatetimer = setInterval(function() {
	            angle += 1;
	            $cover.rotate(angle);
	          }, 20);
	    }
	
	    /*  歌曲当前播放时间 和进度条对应 */
	    music.ontimeupdate = function () {
	        value = Math.round(music.currentTime);
	        $scale.val(value);
	        $timeCur.html(toTwo(value));/*加载载歌曲当前播放时间*/
	        leftDot = wLine * value/max;
	        /*设置进度条样式*/
	        $audioDot.css({ 'left' : leftDot });
	        $audioBlue.css({ 'width' : leftDot+wDot/2 });
	        music.onended = function () {
	            console.log('音频播放完成');
	            if(isNext){
	            	//console.log('播放结束触发============='+musList[i].tit);
	     	        //歌曲播放结束发出ajxa请求,使歌曲播放量+1
	     	        $.ajax({
	     	        	type: "POST",
	     				url : 'SongController?method=updataVV',
	     				async : true,   //异步请求
	     				data: {'songName': musList[i].tit},  
	     			});

	            };
	            isNext?next():nplay();    /* 判断歌曲播放结束 是否下一首,*/
	        }
	    };
	
	    /*拖拽进度条*/
	    $scale.on('change', function() {
	        music.currentTime = $scale.val();
	    });
	
	    /*暂停状态*/
	    function nplay() {
	        music.pause();
	        isPlay = false;
	        clearInterval(rotatetimer);     /* 清除选择动画 */
	        $btnPlay.addClass('btn_pause'); /* 添加暂停按钮 */
	    }
	    /*时间格式转换器 - 00:00*/
	    function toTwo(num){
	        function changInt(num){
	            return (num < 10) ? '0'+num : num;
	        }
	        return changInt(parseInt(num/60))+":"+ changInt(Math.round(num%60));
	    }
	
	    /* 以下为歌词部分  重点难点*/
	    /* 解析歌词 用时间轴作为键，歌词作为值 放到lrcObj对象中 */
	    function parseLyric(lrc) {
	       if(lrc){
	           var lrcArr = lrc.split("\n");                    /*使用换行符拆分歌词为数组*/
	           var lrcObj = {};
	           for(var i=0,length=lrcArr.length;i<length;i++){
	               var lyric = decodeURIComponent(lrcArr[i]);   /*注意编码格式*/
	               var timeReg = /\[\d*:\d*((\.|\:)\d*)*\]/g;   /*重点：时间正则*/
	               var timeRegExpArr = lyric.match(timeReg);    /*提取 所有时间*/
	               if(!timeRegExpArr)continue;                  /*忽略没有时间戳的歌词*/
	               var lrcTxt = lyric.replace(timeReg,'');      /*去掉时间戳，只留下歌词部分*/
	               for(var k = 0,tLength = timeRegExpArr.length;k < tLength;k++) {
	                   var time = timeRegExpArr[k];             /*循环时间戳数组 转换成以秒为单位的时间*/
	                   var min = Number(String(time.match(/\[\d*/i)).slice(1)),
	                       sec = Number(String(time.match(/\:\d*/i)).slice(1));
	                   time = min * 60 + sec;
	                   lrcObj[time] = lrcTxt;                     /* 时间戳 和 歌词 的键值对*/
	               }
	               /* lrcObj[time] = lrcTxt;在此处  不能正确解析 《独自去偷欢的》 歌词
	                * 例如：[01:22.00][00:26.00]未去管 谁不满
	                * [00:26.00] 时间点的歌词被解析
	                * [01:22.00] 时间点的歌词没有解析
	                * */
	           }
	           return lrcObj;
	       }
	    }
	    /* 渲染歌词 */
	   function renderLyric(i){
	       $lyricList.stop().animate({top:0});
	       $lyricList.empty();                      /*先清空歌词内容 */
	       if(musList[i].lrcUrl){                   /*这里的歌词是用url形式，先判断是否有歌词链接，再用ajax请求歌词*/
	           $.ajax({
	               type: "post",
	               url: musList[i].lrcUrl,
	               success: function (lrc) {     /* 获取歌词 */
	                   var lrcData = parseLyric(lrc);
	                   var n=0;                     /*这个标记歌词行数，方便歌词滚动*/
	                   for( key in lrcData){        /*循环处理歌词*/
	                       n++;
	                       var txt = lrcData[key];
	                       if(!txt)txt = " ";       /*没有歌词显示空的一行*/
	                       var li = $("<li class=list_"+key+" data-line="+n+" >"+txt+"</li>");
	                       $lyricList.append(li);   /* 根据时间戳设置clssName，标记歌词行数data-line */
	                   }
	                   $music.on("timeupdate",  updateLyric);
	               },
	               statusCode:{
	                   404:function(){
	                       // 说明请求的url不存在
	                       console.log("请求的歌词url不存在");
	                   }
	               },
	               error: function (XMLHttpRequest, textStatus, errorThrown) {
	                   console.log(errorThrown);
	               }
	           });
	       }else {
	           $lyricList.html("<li>没有歌词</li>");
	       }
	    }
	    /* 滚动歌词 高亮同步 */
	    function updateLyric() {
	        value = Math.floor(music.currentTime);
	        var  $lyricLi = $lyricList.find('li'),
	             lineHeight = $lyricLi.height(),               /* 每行歌词的高度 */
	           $li =  $('.list_'+value);                       /* 当前行歌词 */
	        $li.addClass('on').siblings().removeClass('on');
	        nTop = $li.attr('data-line');                       /* 获取 当前行歌词 的行数 */
	
	        if(nTop >4){                                        /*歌词高亮显示在第四行*/
	            $lyricList.stop().animate({top:-(nTop-4)*lineHeight});
	        }
	    }
	})(jQuery);

	</script>
</body>
</html>