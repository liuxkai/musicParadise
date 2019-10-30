<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>用户激活账号跳转页面倒计时五秒</title>
		<link rel="icon" href="static/images/280558b50ba60daaf75986fecfef32fd.png">
	</head>
	<body>
		<input type="hidden" id="isActive" value="${requestScope.isActive}"/>
		<p><span id="Time">5</span><span id="Text"></span></p>
	</body>
	<script>
			//使用匿名函数方法
			function countDownSucceed(){
				
				var time = document.getElementById("Time");
				//alert(time.innerHTML);
				//获取到id为time标签中的内容，现进行判断
				if(time.innerHTML == 0){
					//等于0时清除计时
					window.location.href="login.html";
				}else{
					time.innerHTML = time.innerHTML-1;
				}
			}
			function countDownFailure(){
				
				var time = document.getElementById("Time");
				//alert(time.innerHTML);
				//获取到id为time标签中的内容，现进行判断
				if(time.innerHTML == 0){
					//等于0时清除计时
					window.location.href="register.jsp";
				}else{
					time.innerHTML = time.innerHTML-1;
				}
			}
			
			//接收后台isActive数据1代表激活成功，-1代表激活失败
			var isActive = document.getElementById("isActive").value;
			if(isActive === '1'){   //激活成功
				console.log(isActive);
				//1000毫秒调用一次
				document.getElementById("Text").innerText = "秒后跳转到--登录--页面(激活成功)";
				window.setInterval("countDownSucceed()",1000);
			}else{                   //激活失败
				document.getElementById("Text").innerText = "秒后跳转到--注册--页面(激活失败)";
				window.setInterval("countDownFailure()",1000);
			}
		</script>
		<style>
			#Time, p{
				font-size: 100px;
				text-align: center;
			}
		</style>
</html>