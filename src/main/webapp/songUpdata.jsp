<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>歌曲修改页面</title>
<link rel="stylesheet" href="layui/css/layui.css">
<style type="text/css">
</style>
</head>
<body>
<div class="layui-row" id="update">
  	    <div class="layui-col-md10">
  	        <form class="layui-form" id="updateSongForm" action="${pageContext.request.contextPath}/SongController?method=updata" method="post">
  	            <div class="layui-form-item">
  	                <input type="hidden" name="songId" value="${requestScope.song.songId}">
			        <label class="layui-form-label">选择歌单:</label>
			        <div class="layui-input-inline"  style="width: 100px;">
			            <select class="ttt" name="Rid" id="recommend">
			            	<option value=""></option>
			                <option value="1" ${requestScope.song.rid == 1 ? "selected" : ""}>洗脑神曲</option>
			                <option value="2" ${requestScope.song.rid == 2 ? "selected" : ""}>百听不厌</option>
			                <option value="3" ${requestScope.song.rid == 3 ? "selected" : ""}>失恋歌曲</option>
			                <option value="4" ${requestScope.song.rid == 4 ? "selected" : ""}>程序员歌曲</option>
			                <option value="5" ${requestScope.song.rid == 5 ? "selected" : ""}>伤感歌曲</option>
			                <option value="6" ${requestScope.song.rid == 6 ? "selected" : ""}>每日推荐</option>
			            </select>
			        </div>
  	            </div>
  	            <div class="layui-form-item">
  	                <div class="layui-input-block">
  	                    <button type="submit" class="layui-btn layui-btn-normal">提交</button>
  	                </div>
  	            </div>
  	        </form>
  	    </div>
  	</div>
</body>
<script src="static/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="layui/layui.js"></script>
<script type="text/javascript">
layui.use(['element','form'], function() {
	var element = layui.element //元素操作
		,
		form = layui.form //滑块
});
</script>
</html>