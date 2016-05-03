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
<jsp:include page="navagation.jsp"/>

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
