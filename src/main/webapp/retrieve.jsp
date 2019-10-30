<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="jquery-validation-1.19.1/lib/jquery.js"></script>
<script src="jquery-validation-1.19.1/dist/jquery.validate.min.js"></script>
<script src="jquery-validation-1.19.1/dist/localization/messages_zh.js"></script>
<script src="layui/layui.js"></script>
<script>
	layui.use(['element','form'], function() {
		var element = layui.element //元素操作
			,
			form = layui.form //滑块
	});


	$.validator.setDefaults({
		submitHandler : function() {
			if(confirm("确认找回密码!")){
				 return true
			 }
		}
	});
	
	$().ready(function() {
		// 在键盘按下并释放及提交后验证提交表单
		$("#signupForm").validate({
			rules : {
				name : "required",
				username : {
					required : true,
					minlength : 2
				},
				password : {
					required : true,
					minlength : 5
				},
				confirm_password : {
					required : true,
					minlength : 5,
					equalTo : "#password"
				},
				age : {
					range : [ 0, 150 ],
					required : true
				},
				email : {
					required : true,
					email : true
				},
				agree: "required"
			},
			messages : {
				name : "请输入您的名字",
				username : {
					required : "请输入用户名",
					minlength : "用户名必需由两个字母组成"
				},
				password : {
					required : "请输入密码",
					minlength : "密码长度不能小于 5 个字母"
				},
				confirm_password : {
					required : "请输入密码",
					minlength : "密码长度不能小于 5 个字母",
					equalTo : "两次密码输入不一致"
				},
				age : {
					range : "年龄在0到150之间"
				},
				email: "请输入一个正确的邮箱",
				agree: "请接受我们的声明"
			},
		});
	});
</script>
<style>
.error {
	color: red;
}
</style>
<link rel="icon" href="static/images/280558b50ba60daaf75986fecfef32fd.png">
<link rel="stylesheet" href="layui/css/layui.css">
<link rel="stylesheet" href="frame/static/css/style.css">
</head>
<body>
 
<div class="login-main">
	<header class="layui-elip" style="margin-top: 10px;">密码找回</header>
	<form class="layui-form"  id="signupForm" method="post" action="${pageContext.request.contextPath}/UserController?method=retrieve">
			<div class="layui-input-inline">
				<input id="name" name="name" type="text" class="layui-input" placeholder="名字">
			 </div>
			<div class="layui-input-inline">
				<input id="username" name="username" type="text" class="layui-input" placeholder="用户名">
			</div>
			<div class="layui-input-inline">
				<input type="number" name="age"   class="layui-input" placeholder="年龄">
			</div>
			<div class="layui-input-inline">
				<input id="email" name="email" type="email"  class="layui-input" placeholder="Email">
			</div>
			<div class="layui-input-inline login-btn">
				<button type="submit" lay-submit lay-filter="login" class="layui-btn">
					找回密码
				</button>
			</div>
			<div class="layui-input-inline login-btn">
				<button type="button" lay-submit lay-filter="login" class="layui-btn">
					<a href="login.html">去登录</a>
				</button>
			</div>
	</form>
	
</div>

</body>
</html>