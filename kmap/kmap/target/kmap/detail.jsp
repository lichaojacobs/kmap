<%@ page import="org.andy.kmap.model.entity.LoginViewModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Detail</title>
	<link rel="stylesheet" href="/kmap/style/map.css" type="text/css" charset="utf-8">
    <link rel="stylesheet" href="/kmap/style/bootstrap.min.css" charset="utf-8">
    <link rel="stylesheet" href="/kmap/style/bootstrap-theme.min.css" charset="utf-8">
</head>
<body>
<!--导航栏目-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-9" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Kmap</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
            <ul class="nav navbar-nav">
                <li><a href="/kamp/Course/Index.do">首页</a></li>
                <li class="active"><a href="#">详情图</a></li>
                <li><a href="#">信息录入</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li><a href="#" class="active">欢迎,<%=((LoginViewModel)request.getSession().getAttribute("userRole")).getUserName()%></a></li>
                <li><a href="/kmap/quit.do">注销</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<input id="courseName" type="hidden" value="<%=request.getSession().getAttribute("courseName")%>">
<!--导航栏结束-->
<div id="maps"><a href="/">back</a><ul></ul></div>
  <canvas id="viewport" width="800" height="600"></canvas>
  <script src="/kmap/lib/jquery/jquery-1.6.1.min.js"></script>
  <script src="/kmap/lib/arbor/arbor.js"></script>
<script src="/kmap/lib/arbor/arbor-tween.js"></script>
<script src="/kmap/lib/arbor/arbor-graphics.js"></script>
  <script src="/kmap/js/detail.js"></script>
</body>
</html>
