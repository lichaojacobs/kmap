<%@ page import="org.andy.kmap.model.entity.LoginViewModel" %><%--
  Created by IntelliJ IDEA.
  User: lichao
  Date: 16/3/16
  Time: 下午4:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>个人信息</title>
    <link rel="stylesheet" href="/kmap/style/map.css" type="text/css" charset="utf-8">
    <link rel="stylesheet" href="/kmap/style/bootstrap.min.css" charset="utf-8">
    <link rel="stylesheet" href="/kmap/style/bootstrap-theme.min.css" charset="utf-8">
    <link rel="stylesheet" href="/kmap/style/info.css" charset="utf-8">
</head>
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
                <li><a href="#">详情图</a></li>
                <li class="active"><a href="#">信息录入</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li><a href="#" class="active">欢迎,<%=((LoginViewModel)request.getSession().getAttribute("userRole")).getUserName()%></a></li>
                <li><a href="/kmap/quit.do">注销</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="info_form">
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">用户名称</span>
  <input type="text" id="username" class="form-control" placeholder="用户名" aria-describedby="basic-addon1">
</div>
<br/>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon2">专业名称</span>
  <input type="text" id="major" class="form-control" placeholder="专业名称" aria-describedby="basic-addon2">
  <div class="input-group-btn">
          <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" >搜索</button>
  </div><!-- /btn-group -->
</div>
<br/>
<div class="input-group">
  <span class="input-group-addon">办公网账号</span>
  <input type="text" id="eid" class="form-control" placeholder="办公网账号">
</div>
<br/>
<div class="input-group">
  <span class="input-group-addon">办公网密码</span>
  <input type="password" id="epassword" class="form-control" placeholder="办公网密码" >
</div>
<br/>
<div class="info_button">
    <input class="btn btn-primary lg" type="button" onclick="completeInfo.submit()" value="提交"/>
</div>
</div>

<!--modal-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">添加专业信息</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="majorinfo" class="control-label">专业年级与名称:</label>
            <select type="text" class="drop" id="majorinfo" name="majorinfo">
            </select>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" id="selectMajor" class="btn btn-primary">提交</button>
      </div>
    </div>
  </div>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="/kmap/admin/js/MessageBox.js"></script>
<script src="/kmap/js/info.js"></script>

</body>
</html>
