<%@ page import="org.andy.kmap.common.model.entity.CourseWiki" %>
<%@ page import="org.springframework.util.StringUtils" %>
<%@ page import="org.andy.kmap.common.model.entity.LoginViewModel" %><%--
  Created by IntelliJ IDEA.
  User: lichao
  Date: 6/1/16
  Time: 2:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>课程维基</title>
    <link rel="stylesheet" href="/kmap/style/map.css" type="text/css" charset="utf-8">
    <link rel="stylesheet" href="/kmap/style/bootstrap.min.css" charset="utf-8">
    <link rel="stylesheet" href="/kmap/style/bootstrap-theme.min.css" charset="utf-8">
    <link rel="stylesheet" href="/kmap/style/coursewiki.css">
</head>
<body style="height: 100%; overflow: auto">
<!--导航-->
<jsp:include page="navagation.jsp"></jsp:include>
<!--content start-->
<%CourseWiki courseWiki = (CourseWiki) request.getAttribute("courseWiki");
    String userName=((LoginViewModel)request.getSession().getAttribute("userRole")).getUserName();
%>
<input type="hidden" id="courseId" value="<%=courseWiki.getCourse().getId()%>">
<div class="container" style="width: 70%;margin:0 auto;">
    <div class="row">
        <div class="col-md-6">
            <div class="col-sm-6 col-md-8">
                <div class="thumbnail">
                    <img src="/kmap/admin/images/wiki_1.jpg" width="230" height="130" alt="...">
                    <div class="caption">
                        <h3><%=courseWiki.getCourse().getName()%>
                        </h3>
                        <%
                            if (!StringUtils.isEmpty(courseWiki.getCourse().getInfo())) {
                        %>
                        <p><%=courseWiki.getCourse().getInfo()%>
                        </p>
                        <%} else {%>
                        <p>暂无简介</p>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-6">
                    <div class="bs-example" data-example-id="contextual-panels">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">学分</h3>
                            </div>
                            <div class="panel-body">
                                <%=courseWiki.getCourse().getCredit()%>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">课时</h3>
                            </div>
                            <div class="panel-body">
                                18学时
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">课程评分</h3>
                            </div>
                            <div class="panel-body">
                                <div>
                                    <ul>
                                        <li>难度: <%=courseWiki.getDiffcultRate()%>
                                        </li>
                                        <li>重要性: <%=courseWiki.getImportantRate()%>
                                        </li>
                                        <li>应用性: <%=courseWiki.getUsefulRate()%>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="list-group">
                        <a href="#" class="list-group-item active">
                            相关链接
                        </a>
                        <a href="#" class="list-group-item">百度百科</a>
                        <a href="#" class="list-group-item">E-Learning</a>
                        <a href="#" class="list-group-item">慕课网</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="alert alert-info" role="alert" style="border: none">课程评价</div>
        <div class="grade_warp">
            <div class="User_ratings User_grade" id="diffculty_rate">
                <div class="ratings_title01">
                    <p><span>难度</span><i>分数越高表示越难。</i></p>
                </div>
                <div class="ratings_bars"><span id="title2">4.9</span> <span
                        class="bars_10">0</span>
                    <div class="scale" id="bar2">
                        <div style="width: 142px;"></div>
                        <span id="btn2" style="left: 142px;"></span></div>
                    <span class="bars_10">10</span></div>
            </div>
            <div class="User_ratings User_grade" id="important_rate">
                <div class="ratings_title01">
                    <p><span>重要性</span><i>分数越高表示越重要。</i></p>
                </div>
                <div class="ratings_bars"><span id="title3">0</span> <span class="bars_10">0</span>
                    <div class="scale" id="bar3">
                        <div></div>
                        <span id="btn3"></span></div>
                    <span class="bars_10">10</span></div>
            </div>
            <div class="User_ratings User_grade" id="useful_rate">
                <div class="ratings_title01">
                    <p><span>应用性</span><i>分数越高表示用处越大。</i></p>
                </div>
                <div class="ratings_bars"><span id="title4">0</span> <span class="bars_10">0</span>
                    <div class="scale" id="bar4">
                        <div style="width: 0px;"></div>
                        <span id="btn4" style="left: -2px;"></span></div>
                    <span class="bars_10">10</span></div>
            </div>
        </div>
        <!--效果html结束-->
        <div class="clear"></div>
    </div>
    <div class="row">
        <%
            if (!courseWiki.isCurrentUserCommented()) {
        %>
        <textarea class="form-control" id="comment_textarea" style="width: 400px;height: 150px"></textarea>
        <button id="submit_comment" class="btn btn-primary"
                onclick="submitComment('<%=((LoginViewModel)request.getSession().getAttribute("userRole")).getUserEmail()%>')">
            提交评价
        </button>
        <%
        } else {
        %>
        <textarea class="form-control" id="comment_textarea" style="width: 400px;height: 150px"
                  disabled="disabled"></textarea>
        <button class="btn btn-primary" disabled="disabled"
                onclick="submitComment('<%=((LoginViewModel)request.getSession().getAttribute("userRole")).getUserEmail()%>')">
            已评价
        </button>
        <%}%>
    </div>

    <div class="row">
        <div class="alert alert-info" role="alert" style="border: none">其他用户评价</div>
        <div class="comments" id="comments">
            <div class="comments-item">
                数据挖掘（英语：Data mining），又译为资料探勘、数据采矿。它是数据库知识发现（英语：Knowledge-Discovery in Databases
                <p class="author"><img src="/kmap/admin/images/wiki_1.jpg" height="25" width="25">
                    李超 :&nbsp;</p>
                <br/>
                <div style="float: right">
                   <span style="font-weight: bold"> 难度: 4.9
                    重要性: 3.0
                    应用性: 4.0</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!--content end-->
<script src=""></script>
<script src="/kmap/lib/jquery/jquery-1.6.1.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="/kmap/js/coursewiki.js"></script>
<script src="/kmap/admin/js/MessageBox.js"></script>
<script type="text/javascript">
    scale = function (btn, bar, title) {
        this.btn = document.getElementById(btn);
        this.bar = document.getElementById(bar);
        this.title = document.getElementById(title);
        this.step = this.bar.getElementsByTagName("div")[0];
        this.init();
    };
    scale.prototype = {
        init: function () {
            var f = this, g = document, b = window, m = Math;
            f.btn.onmousedown = function (e) {
                var x = (e || b.event).clientX;
                var l = this.offsetLeft;
                var max = f.bar.offsetWidth - this.offsetWidth;
                g.onmousemove = function (e) {
                    var thisX = (e || b.event).clientX;
                    var to = m.min(max, m.max(-2, l + (thisX - x)));
                    f.btn.style.left = to + 'px';
                    f.ondrag(m.round(m.max(0, to / max) * 100), to);
                    b.getSelection ? b.getSelection().removeAllRanges()
                            : g.selection.empty();
                };
                g.onmouseup = new Function('this.onmousemove=null');
            };
        },
        ondrag: function (pos, x) {
            this.step.style.width = Math.max(0, x) + 'px';
            this.title.innerHTML = pos / 10 + '';
        }
    }
    new scale('btn2', 'bar2', 'title2');
    new scale('btn3', 'bar3', 'title3');
    new scale('btn4', 'bar4', 'title4');
</script>
<script type="text/javascript">

    $(document).ready(function () {
        var courseId = $("#courseId").val();
        var comments = $("#comments");
        $.post("/kmap/wiki/getComments.do", {"courseId": courseId}, function (data, status) {
            if (data.length != 0) {
                for (var i = 0; i < data.length; i++) {
                    comments =
                            comments.append('<div class="comments-item" id="comments_' + i + '"> '
                                            + data[i].comment +
                                            '<p class="author"><img src="/kmap/admin/images/wiki_1.jpg" height="25" width="25">'
                                            + data[i].user.name + ':&nbsp;</p> <br/> ' +
                                            '<div style="float: right"> <span style="font-weight: bold"> 难度: '
                                            + data[i].diffcultRate + ' 重要性: '
                                            + data[i].importantRate + '应用性: ' + data[i].usefulRate
                                            + '</span> </div> </div>')
                }
            }
        })
    })
    function submitComment(email) {
        var diffcultyRate = $("#title2").text().trim();
        var importantRate = $("#title3").text().trim();
        var usefulRate = $("#title4").text().trim();
        var courseId = $("#courseId").val();
        var comment = $("#comment_textarea").val();
        $.post("/kmap/wiki/addComment.do", {
                   "diffcultyRate": diffcultyRate,
                   "importantRate": importantRate,
                   "usefulRate": usefulRate,
                   "courseId": courseId,
                   "comment": comment,
                   "userEmail": email
               }, function (data, status) {
                   if (data.status == 0) {
                       $.MsgBox.Alert("提示", data.detail);
                       //伪动态插入
                       var comments = $("#comments");
                       comments.append('<div class="comments-item" id="comments_i"> '
                                       + comment+
                                       '<p class="author"><img src="/kmap/admin/images/wiki_1.jpg" height="25" width="25">'
                                       + '<%=userName%>'+ ':&nbsp;</p> <br/> ' +
                                       '<div style="float: right"> <span style="font-weight: bold"> 难度: '
                                       + $("#title2").text().trim() + ' 重要性: '
                                       + $("#title3").text().trim() + '应用性: ' + $("#title4").text().trim()
                                       + '</span> </div> </div>')
                       //防止再次评论
                       $("#submit_comment").attr("disabled","disabled");
                       $("#comment_textarea").attr("disabled","disabled");

                   }
                   else {
                       $.MsgBox.Alert("错误提示", data, detail);
                   }
               }
        )
    }
</script>
</body>
</html>
