<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>天堂音乐首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="icon" href="static/images/280558b50ba60daaf75986fecfef32fd.png">
<link rel="stylesheet" href="layui/css/layui.css">
<link rel="stylesheet" href="static/css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="static/css/slider-styles.css" type="text/css" media="all" />
</head>
<body>
<div class="header">
<div class="wrap">
<div class="logo"><a href="index.html"><img src="static/images/logo.png" /></a></div>
    <div class="right">

    <div class="header-nav">
        <ul>
            <li><a href="">首页</a></li>
            <li><a href="">管理</a></li>
            <li><a href="">商品</a></li>
            <li><a href="">联系我们</a></li>
            <li><a href="">我</a></li>
        </ul>
    </div>
    <div class="search">
    	<form>
    		<input type="text" value="" id="searchInformation"/>
    		<input type="submit" value="搜索" />
    	</form>
    </div>
        	
    </div>
    <div class="clear"></div>
    </div>
</div>
<div class="nav-wrap">
	<div class="wrap">
	<div class="nav">
        <ul>
            <li class="active"><a href="player.jsp?singerType=newMusic">最新音乐</a></li>
            <li><a href="player.jsp?singerType=fashionMusic">流行音乐</a></li>
            <li><a href="player.jsp?singerType=classicsMusic">经典音乐</a></li>
            <li><a href="player.jsp?singerType=rockMusic">摇滚音乐</a></li>
            <li><a href="player.jsp?singerType=childrenMusic">儿歌</a></li>
            <div class="clear"></div>
        </ul>
    </div>
     </div>
</div>
<div class="bottom-bg">
<div class="wrap">
<div class="main-body">
	
<!--   	<div class="slide">
    		<div id="slider">
				<a href="#" target="_blank">
					<img src="static/images/森林公园,女孩,小提琴,音乐,高清6K图片_彼岸图网.jpg" alt="Mini Ninjas" />
				</a>
				<a href="#" target="_blank">
					<img src="static/images/夜空中最亮的其实是心情 零度鱼意境4K文字壁纸_彼岸图网.jpg" alt="Price of Persia" />
				</a>
				<a href="#" target="_blank">
					<img src="static/images/Devil's Bridge 桥梁和绿色树木 河流 倒映6k自然风景壁纸_彼岸图网.jpg" alt="Price of Persia" />
				</a>
			</div>
    	</div>
   --> 
   
	  <div class="layui-carousel" id="test10">
		  <div carousel-item="">
		    <div><img src="static/images/森林公园,女孩,小提琴,音乐,高清6K图片_彼岸图网.jpg"></div>
		    <div><img src="static/images/夜空中最亮的其实是心情 零度鱼意境4K文字壁纸_彼岸图网.jpg"></div>
		    <div><img src="static/images/Devil's Bridge 桥梁和绿色树木 河流 倒映6k自然风景壁纸_彼岸图网.jpg"></div>
		    <div><img src="static/images/王俊凯4k桌面壁纸_彼岸图网.jpg"></div>
		    <div><img src="static/images/刘亦菲白色低胸连衣裙4K壁纸_彼岸图网.jpg"></div>
		    <div><img src="static/images/年轻漂亮的美女女孩弹电吉他5k壁纸_彼岸图网.jpg"></div>
		    <div><img src="static/images/湖 日落 优雅 舞蹈 唯美 年轻的芭蕾舞5120x1440壁纸_彼岸图网.jpg"></div>
		  </div>
		</div> <br><br>	
    	<div class="content">
			<div class="sub-cont">
				<div class="gallery">
					<h1>推荐歌单</h1>
					<ul>
						<li><a href="player.jsp?singerType=recommend&Rid=1">
							<img src="static/images/洗脑神曲.jpg" alt=""  width="190" height="190"/>
							<h3>洗脑神曲</h3>
							<p>点击量135万</p>
							<!-- <button>Add to cart</button> -->
						</a></li>
						<li><a href="player.jsp?singerType=recommend&Rid=2">
							<img src="static/images/百听不厌.jpg" alt=""  width="190" height="190"/>
							<h3>让你百听不厌</h3>
							<p>点击量935万</p>
							<!-- <button>Add to cart</button> -->
						</a></li>
						<li><a href="player.jsp?singerType=recommend&Rid=3">
							<img src="static/images/失恋情歌.jpg" alt=""  width="190" height="190"/>
							<h3>失恋情歌</h3>
							<p>点击量185万</p>
							<!-- <button>Add to cart</button> -->
						</a></li>
						<li><a href="player.jsp?singerType=recommend&Rid=4">
							<img src="static/images/程序员之歌.jpg" alt=""  width="190" height="190"/>
							<h3>程序员之歌</h3>
							<p>点击量1350万</p>
							<!-- <button>Add to cart</button> -->
						</a></li>
						<li><a href="player.jsp?singerType=recommend&Rid=5">
							<img src="static/images/伤感歌曲.jpg" alt=""  width="190" height="190"/>
							<h3>听到落泪的伤感歌曲</h3>
							<p>点击量13万</p>
							<!-- <button>Add to cart</button> -->
						</a></li>
						<li><a href="player.jsp?singerType=recommend&Rid=6">
							<img src="static/images/每日推荐.jpg" alt=""  width="190" height="190"/>
							<h3>每日推荐</h3>
							<p>点击量105万</p>
							<!-- <button>Add to cart</button> -->
						</a></li>					</ul>
					<div class="clear"></div>
				</div>
			
			</div>
		</div>
    	<div class="sidebar">
    		<div class="list">
    			<h3>歌曲排行榜</h3>
    			
    		<ul id="ranking">
    			<li><a href="d">第1首歌</a></li>
    			<li><a href="d">第2首歌</a></li>
    			<li><a href="dd">第3首歌</a></li>
    			<li><a href="d">第4首歌</a></li>
    			<li><a href="d">第5首歌</a></li>
    			<li><a href="d">第6首歌</a></li>
    			<li><a href="">第7首歌</a></li>
    			<li><a href="">第8首歌</a></li>
    			<li><a href="">第9首歌</a></li>
    			<li><a href="">第10首歌</a></li>
    		</ul>
    	</div>
    	</div>
    	
		
		   <div class="clear"></div>
</div>
</div>
</div>
<div class="footer">
    <div class="wrap">
    	<div class="half-footer">
        <ul>
        	<h3>音乐是一种信仰</h3>
            <li><a href="index.html">音乐，是人生最大的快乐</a></li>
            <li><a href="single.html">音乐，是生活中的一股清流</a></li>
            <li><a href="single.html">音乐，是陶冶性情的熔炉</a></li>
            <li><a href="single.html">音乐歌颂人们的生活，引导人们走向光明的未来</a></li>
            <li><a href="feedback.html">音乐是生活中最美好的一面</a></li>
        </ul>
        <div class="footer-pic"><img src="static/images/f-icon.png" alt="" /></div>
        <div class="clear"></div>
        </div>
        <div class="half-footer">
        <ul>
        	<h3>联系我们</h3>
            <li><a href="http://www.bdqn.cn/">音乐国际</a></li>
            <li><a href="http://www.bdqn.cn/">中国</a></li>
            <li><a href="http://www.bdqn.cn/">联系电话:18888888888</a></li>
            <li><a href="http://www.bdqn.cn/">musicparadise@gmail.com</a></li>
            <li><a href="http://www.bdqn.cn/">地址:北大青鸟</a></li>
        </ul>
        <div class="footer-pic"><img src="static/images/foot-icon.png" alt="" /></div>
        </div>
    	<div class="clear"></div>
        
    </div>
    <div class="copy">
    	<p>&copy; 2019 出版 | 设计公司 <a href="http://w3layouts.com">天堂音乐工作室</a></p>
    </div>
</div>

<script src="static/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="layui/layui.js"></script>
<script type="text/javascript">
$(function(){
//ajax发出请求，请求到歌曲播放量前十牌行榜
	var resultSongName = $.ajax({
		url : 'JsonDataInterface?method=rankingMusic',
		async : false,   //同步请求，异步获取不到数据，因为数据还没获取到就会往下执行
		dataType: 'json',
	});
	//获取排名前十歌手数据转换成json对象
	var jsonObj = JSON.parse(resultSongName.responseText)
	//console.log(jsonObj);
	//遍历json对象，取出songName并显示到页面
	for (let x in jsonObj) {
		$("#ranking li:eq("+x+") a").text(jsonObj[x].songName).attr("href","player.jsp?singerType=rankingSongName&songName="+jsonObj[x].songName+"");
		console.log(jsonObj[x].songName);
	}
	
})
</script>
<script>
	$(function(){
		$('form').submit(function(){
			var url = $('#searchInformation').val();
			if (url === '') {
				alert('请输入搜索内容'+url);
				return false;
			}else{
			//利用ajax请求数据，判断模糊查询返回的数据是否为空，如果为空就不调转页面，如果不为空就跳转到播放页面
				var result = $.ajax({
					url : 'JsonDataInterface?method=searchMusic&keyword='+url,
					async : false,   //同步请求
					dataType: 'json',
				});
				
				//console.log(result);
				//console.log(result.responseText);
				//var jsonObj = JSON.parse(result.responseText)
				//console.log(jsonObj);
				//console.log(jsonObj.users);
				//for (let x in jsonObj.users) {
				//	console.log(jsonObj.users[x]);
			//	}
				
				if(result.responseText !== '[]'){
					//alert(result.responseText);
					//利用表单提交不能把keyword数据带过去
					window.location.href="player.jsp?singerType=searchMusic&keyword="+url;
					return false;
				}else{
					alert('抱歉没有查到');
				}
				return false;
			}
			return false;
		});
	})
</script>
<script>
layui.use(['carousel', 'form'], function(){
  var carousel = layui.carousel
  ,form = layui.form;
  
  //图片轮播
  carousel.render({
    elem: '#test10'
    ,width: '1024px'
    ,height: '350px'
    ,interval: 5000
  });
  
  var $ = layui.$, active = {
    set: function(othis){
      var THIS = 'layui-bg-normal'
      ,key = othis.data('key')
      ,options = {};
      
      othis.css('background-color', '#5FB878').siblings().removeAttr('style'); 
      options[key] = othis.data('value');
      ins3.reload(options);
    }
  };
  
  //监听开关
  form.on('switch(autoplay)', function(){
    ins3.reload({
      autoplay: this.checked
    });
  });
  
  $('.demoSet').on('keyup', function(){
    var value = this.value
    ,options = {};
    if(!/^\d+$/.test(value)) return;
    
    options[this.name] = value;
    ins3.reload(options);
  });
  
  //其它示例
  $('.demoTest .layui-btn').on('click', function(){
    var othis = $(this), type = othis.data('type');
    active[type] ? active[type].call(this, othis) : '';
  });
});
</script>
</body>
</html>
