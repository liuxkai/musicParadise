<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 404.jsp页面应该放在web-inf下面说是要防止用户直接访问jsp页面,可以访问到页面，但是访问不到任何资源，如页面上的图片 -->
<head>
<meta charset="utf-8">
<meta http-equiv="Cache-Control" content="no-transform"/>
<meta http-equiv="Cache-Control" content="no-siteapp"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta http-equiv="Content-Language" content="zh-CN" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="{dede:global.cfg_description/}" />
<meta name="keywords" content="{dede:global.cfg_keywords/}" />
<style type="text/css">
    #cuowu {
        width: 50%;
        float: left;
        margin-left: 25%;
        margin-top: 5%;
    }
    #cuowu p {
        margin-left: 20%;
        width: 60%;
        float: left;
    }
    #cuowu h1,p {
        color: #333333;
    }
</style>
<title>对不起，您所访问的标签不存在</title>
</head>


<body>
<div id="cuowu">
<center>
<img src="http://localhost:1928/musicPara/img/404.jpg"/> 
<h1>对不起！您访问的页面不存在</h1>
</center>

<P>1、请检查您输入的网址是否正确</P>
<P>2、网址确认无误可能页面正在维护或已删除</P>
<p>3、您可以访问网站的<a href="http://localhost:1928/musicPara/musicparadise.jsp">首页</a></p>

</div>
</body>
</html>
