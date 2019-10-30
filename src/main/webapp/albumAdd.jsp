<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加专辑</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
	<div class="layui-row" id="add">
  	    <div class="layui-col-md10">
  	        <form class="layui-form" id="addAlbumForm" action="${pageContext.request.contextPath}/AlbumController?method=add" method="post">
  	        	<div class="layui-form-item">
	  	            <label class="layui-form-label">歌手:</label>
	  	                <div class="layui-input-inline">
	  	                    <input type="text" name="singerName" class="layui-input">
	  	                </div>
  	            </div>
  	            <div class="layui-form-item">
  	                <input type="hidden" name="Aid" >
  	                <label class="layui-form-label">专辑:</label>
  	                <div class="layui-input-inline">
  	                    <input type="text" name="albumName" class="layui-input">
  	                </div>
  	            </div>
  	            <div class="layui-form-item">
	  	            <label class="layui-form-label">专辑介绍:</label>
	  	                <div class="layui-input-inline">
	  	                    <textarea name="albumIntroduce" class="layui-input" style="width:400px; height:200px"></textarea>
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