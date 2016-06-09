<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Course</title>
    <link rel="stylesheet" href="/kmap/style/map.css" type="text/css" charset="utf-8">
    <link rel="stylesheet" href="/kmap/style/bootstrap.min.css" charset="utf-8">
    <link rel="stylesheet" href="/kmap/style/bootstrap-theme.min.css" charset="utf-8">
</head>
<body>
<!--导航-->
<jsp:include page="navagation.jsp"></jsp:include>
<div style="width:100%">
    <canvas id="viewport" width="100%" height="650"></canvas>
</div>
<div id="modal" class="list-group" style="display:none;">
    <a href="#" class="list-group-item">百科</a>
    <a href="#" class="list-group-item" onchange="">局部详情图</a>
    <a href="/kmap/wiki/index.do?courseId=0" class="list-group-item">课程维基</a>
</div>

<div id="partialload" class="partialload" style="display: none;">
    <div class="loading" style="display:block;position:absolute; left:100px; top:150px">
        <h1>Loading...</h1>
    </div>
    <div>
        <canvas id="partialviewport" width="400px" height="400px"></canvas>
    </div>
</div>
<script src="/kmap/lib/jquery/jquery-1.6.1.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="/kmap/lib/jquery/jquery.address-1.4.min.js"></script>
<script src="/kmap/lib/arbor/arbor.js"></script>
<script src="/kmap/lib/arbor/arbor-tween.js"></script>
<script src="/kmap/lib/arbor/arbor-graphics.js"></script>
<script src="/kmap/lib/ajax.js"></script>
<script src="/kmap/js/course.js"></script>
</body>
</html>
