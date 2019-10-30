<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>实现在线播放音乐</title>
</head>
<body>
<!-- <embed src="music/yigerendeyan.mp3" loop="-1"> -->
<audio  controls=stopbutton >
  <source src="uploadmusic/zhe.mp3" type="audio/mpeg">
  <source src="uploadmusic/zhe.mp3" type="audio/ogg">
  您的浏览器不支持该音频格式。
</audio>
</html>