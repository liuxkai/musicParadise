<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>歌手信息修改界面</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
	<div class="layui-row" id="update">
  	    <div class="layui-col-md10">
  	        <form class="layui-form" id="updateSingerForm" action="${pageContext.request.contextPath}/SingerController?method=updata" method="post">
  	            <div class="layui-form-item">
  	                <!-- 此处由于java命名不规范应该sid的S是大写,但是由于EL表达式会报PropertyNotFoundException，所以改成小写，但也可正常运行 -->
  	                <input type="hidden" name="Sid" value="${requestScope.singer.sid}">
  	                <label class="layui-form-label">姓名:</label>
  	                <div class="layui-input-inline">
  	                    <input type="text" name="singerName" class="layui-input" value="${requestScope.singer.singerName}">
  	                </div>
			        <label class="layui-form-label">性别:</label>
			        <div class="layui-input-inline"  style="width: 100px;">
			            <select class="ttt" name="sex" lay-search="" id="sex">
			            	<option value=""></option>
			                <option value="1" ${requestScope.singer.sex == 1 ? "selected" : ""}>男</option>
			                <option value="0" ${requestScope.singer.sex == 0 ? "selected" : ""}>女</option>
			            </select>
			        </div>
  	            </div>
  	            <div class="layui-form-item">
  	                <div class="layui-inline">
					    <label class="layui-form-label">生日</label>
					    <div class="layui-input-inline">
					       <input type="text" name="birthday" class="layui-input" id="test1" placeholder="yyyy-MM-dd" value="${requestScope.singer.birthday}">
					    </div>
					</div>
  	                <label class="layui-form-label">爱好:</label>
  	                <div class="layui-input-inline">
  	                    <input type="text" name="hobby" class="layui-input"  value="${requestScope.singer.hobby}">
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
layui.use(['element','form','laydate'], function() {
	var element = layui.element //元素操作
		,
		form = layui.form //滑块
		,
		laydate = layui.laydate;
		
		laydate.render({
		    elem: '#test1',
		    trigger: 'click'  //laydate文件中的默认配置,trigger: 'focus' 呼出控件的事件这个focus改成click。
		  });
});
</script>
</html>