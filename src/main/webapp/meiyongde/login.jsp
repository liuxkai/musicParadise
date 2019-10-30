<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页面</title>
<style type="text/css">
	html{
			background-image: url(img/gou3.jpg);
			width: 100%;
			height: 100%;
			position: fixed;
			background-repeat: no-repeat;
			background-position: 0px 0px;
			background-size: 100% 100%;
			font-size: 30upx;
		}
	form {
		width: 500px;
		margin: 10px auto;
	}	
	#div1 {
		width: 300px;
		height: 200px;
		margin: 250px auto;
		background-image: linear-gradient(to top, rgba(255, 239, 213, 0.5), rgba(255, 222, 173, 1));
	}
	#div2 {
		color: red;
	}
</style>
</head>
<body>
<div id="div1">
	<form action="${ pageContext.request.contextPath }/UserServlet?method=login" method="post">
		用户名：<input type="text" name="username" value="${ requestScope.username eq '' ? cookie.username.value : requestScope.username}"><br>
		密码：<input type="password" name="password" value="${ requestScope.password eq '' ? cookie.password.value : requestScope.password }"><br> 
		<input type="checkbox" name="rememberMe" value="1" ${ cookie.rememberMe.value eq 1 ? "checked='checked'" : "" }>记住用户名和密码。<br> 
		
		<button type="submit">登录</button>
		<a href="register.jsp">立即注册</a><br><br>
		<div id="div2">${ message }</div>
	</form>
</div>	
</body>
</html>