<%--
  Created by IntelliJ IDEA.
  User: li
  Date: 2015/10/28
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="/kmap/style/map.css" type="text/css" charset="utf-8">
    <link rel="stylesheet" href="/kmap/style/bootstrap.min.css" charset="utf-8">
    <link rel="stylesheet" href="/kmap/style/bootstrap-theme.min.css" charset="utf-8">
    <title>错误页面</title>
</head>
<body>
<!--导航栏目-->
    <jsp:include page="navagation.jsp"/>
    <div class="container" style="margin:0 auto">
    <div class="jumbotron">
    <h1>糟糕, 程序开小差啦!</h1>
    <p>网络或者系统原因</p>
    <p><a class="btn btn-primary btn-lg" href="/kmap/Course/Index.do" role="button">试试返回首页</a></p>
    </div>
    </div>

<script src="/kmap/lib/jquery/jquery-1.6.1.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
