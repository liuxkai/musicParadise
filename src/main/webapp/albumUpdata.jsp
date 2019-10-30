<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>专辑信息修改界面</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
	<div class="layui-row" id="update">
  	    <div class="layui-col-md10">
  	        <form class="layui-form" id="updateAlbumForm" action="${pageContext.request.contextPath}/AlbumController?method=updata" method="post">
  	            <div class="layui-form-item">
  	                <!-- 此处由于java命名不规范应该aid的A是大写,但是由于EL表达式会报PropertyNotFoundException，所以改成小写，但也可正常运行 -->
  	                <input type="hidden" name="Aid" value="${requestScope.album.aid}">
  	                <label class="layui-form-label">专辑:</label>
  	                <div class="layui-input-inline">
  	                    <input type="text" name="albumName" class="layui-input" value="${requestScope.album.albumName}">
  	                </div>
  	            </div>
  	            <div class="layui-form-item">
	  	            <label class="layui-form-label">专辑介绍:</label>
	  	                <div class="layui-input-inline">
	  	                    <textarea name="albumIntroduce" class="layui-input" style="width:400px; height:200px">${requestScope.album.albumIntroduce}</textarea>
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