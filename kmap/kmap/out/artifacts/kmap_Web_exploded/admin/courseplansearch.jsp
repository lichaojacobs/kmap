<%@ page import="org.andy.kmap.model.entity.LoginViewModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程计划查看</title>
	<link rel="stylesheet" href="/kmap/admin/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/kmap/admin/css/bootstrap-spinner.css">
	<link rel="stylesheet" href="/kmap/admin/css/style-main.css">
	<link rel="stylesheet" href="/kmap/admin/css/bootstrap-treeview.css">
	<link rel="stylesheet" href="/kmap/admin/css/bootstrap-table.min.css">
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
	<script src="/kmap/admin/js/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="/kmap/admin/bootstrap/js/bootstrap.min.js"></script>
	<script src="/kmap/admin/js/bootstrap-treeview.js"></script>
	<script src="/kmap/admin/js/bootstrap-table.js"></script>
	<script src="/kmap/admin/js/jquery.spinner.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		$(".div2").click(function(){ 
			$(this).next("div").slideToggle("slow")  
			.siblings(".div3:visible").slideUp("slow");
		});
	});
</script>
<style>

</style>
</head>
<body>
<div class="container-fluid" id="container">
  <div class="row">
    <div class="title">
	<span><img src="images/logo1.png" /></span>
	<span>天津大学知识地图信息管理系统</span>
	</div>
  </div>
  <div class="row" id="maincontent" style="height:80%">
  <!--start of content-->
    <div class="col-md-2" style=" background-color: rgba(194, 190, 190, 0.3); height:100%">
      <div class="content">
        <div class="div1">
          <div class="div2">
            <div class="college"><span class="glyphicon glyphicon-user"></span></div>
            学院信息</div>
          <div class="div3">
            <ul>
				<li>
					<div class="college"><span class="glyphicon glyphicon-plus"></span></div>
					<a href="/kmap/API/Academy/Index.do" style="color:#337ab7">学院信息添加</a></li>
				<li>
					<div class="college"><span class="glyphicon glyphicon-plus"></span></div>
					<a href="/kmap/API/Academy/addGradePage.do">年级信息添加</a></li>
				<li>
					<div class="college"><span class="glyphicon glyphicon-plus"></span></div>
					<a href="/kmap/API/Major/Index.do">专业信息添加</a></li>
            </ul>
          </div>
          <div class="div2">
            <div class="college"><span class="glyphicon glyphicon-book"></span></div>
            课程信息</div>
          <div class="div3" id="course">
            <ul>
				<li>
					<div class="college"><span class="glyphicon glyphicon-plus"></span></div>
					<a href="/kmap/API/Course/Index.do">专业课程添加</a></li>
				<li>
					<div class="college"><span class="glyphicon glyphicon-search"></span></div>
					<a href="/kmap/API/Course/CoursePlanSearch.do">课程计划查看</a></li>
				<li>
					<div class="college"><span class="glyphicon glyphicon-plus"></span></div>
					<a href="/kmap/API/Course/CoursePlanAdd.do">课程计划添加</a></li>
				<li>
					<div class="college"><span class="glyphicon glyphicon-plus"></span></div>
					<a href="/kmap/API/Course/CourseKnowledgeAdd.do">课程知识添加</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
<!--end of content-->
<div class="col-md-10" style="height:100%">
<div class="row navigation">
<!--<div class="three"></div>-->
	<div class="flagword">您现在所在的位置：课程信息 》课程计划查看</div>
	<div class="login_info">
		欢迎: <%=((LoginViewModel)request.getSession().getAttribute("userRole")).getUserName()%>
		<a href="/kmap/quit.do">注销</a>
	</div>
</div>
<div class="row">
<div class="col-md-4 horizen">
<div class="search">
<div class="querytip" style="padding-left:40px; text-align:center">查询信息</div>
<div class="gosearch"><button type="button" class="btn btn-primary" style="padding-top:3px; padding-bottom:3px" onclick="search()">检索</button></div>
<div class="queryform">
<form id="queryform" method="get" action="">
<div id="treeview1" class=""></div>
</form>
</div>
</div>
</div>
<div class="col-md-8">
<div class="querytip" style="text-align:center">查询结果</div>
<div class="showtable">
<!--start of table-->
<table data-toggle="table" id="table"  data-cache="false" data-height="500">
    <thead>
        <tr>
            <th data-field="courseid">课程编号</th>
            <th data-field="coursename">课程名称</th>
            <th data-field="credit">学分</th>
        </tr>
    </thead>
</table>
<!--end of table-->
</div>
</div>
</div>
</div>	
  </div>
  <!--
  <div class="row" id="footer"></div>
  -->
</div>

<!--MSG BOX-->
<script type="text/javascript">
	(function () {
		$.MsgBox = {
			Alert: function (title, msg) {
				GenerateHtml("alert", title, msg);
				btnOk();  //alert只是弹出消息，因此没必要用到回调函数callback
				btnNo();
			},
			Confirm: function (title, msg, callback) {
				GenerateHtml("confirm", title, msg);
				btnOk(callback);
				btnNo();
			}
		}
		//生成Html
		var GenerateHtml = function (type, title, msg) {

			var _html = "";

			_html += '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + title + '</span>';
			_html += '<a id="mb_ico">x</a><div id="mb_msg">' + msg + '</div><div id="mb_btnbox">';

			if (type == "alert") {
				_html += '<input id="mb_btn_ok" type="button" value="确定" />';
			}
			if (type == "confirm") {
				_html += '<input id="mb_btn_ok" type="button" value="确定" />';
				_html += '<input id="mb_btn_no" type="button" value="取消" />';
			}
			_html += '</div></div>';

			//必须先将_html添加到body，再设置Css样式
			$("body").append(_html); GenerateCss();
		}

		//生成Css
		var GenerateCss = function () {

			$("#mb_box").css({
				width: '100%', height: '100%', zIndex: '99999', position: 'fixed',
				filter: 'Alpha(opacity=60)', backgroundColor: 'black', top: '0', left: '0', opacity: '0.6'
			});

			$("#mb_con").css({
				zIndex: '999999', width: '400px', position: 'fixed',
				backgroundColor: 'White', borderRadius: '15px'
			});

			$("#mb_tit").css({
				display: 'block', fontSize: '14px', color: '#444', padding: '10px 15px',
				backgroundColor: '#DDD', borderRadius: '15px 15px 0 0',
				borderBottom: '3px solid #009BFE', fontWeight: 'bold'
			});

			$("#mb_msg").css({
				padding: '20px', lineHeight: '20px',
				borderBottom: '1px dashed #DDD', fontSize: '13px'
			});

			$("#mb_ico").css({
				display: 'block', position: 'absolute', right: '10px', top: '9px',
				border: '1px solid Gray', width: '18px', height: '18px', textAlign: 'center',
				lineHeight: '16px', cursor: 'pointer', borderRadius: '12px', fontFamily: '微软雅黑'
			});

			$("#mb_btnbox").css({ margin: '15px 0 10px 0', textAlign: 'center' });
			$("#mb_btn_ok,#mb_btn_no").css({ width: '85px', height: '30px', color: 'white', border: 'none' });
			$("#mb_btn_ok").css({ backgroundColor: '#168bbb' });
			$("#mb_btn_no").css({ backgroundColor: 'gray', marginLeft: '20px' });


			//右上角关闭按钮hover样式
			$("#mb_ico").hover(function () {
				$(this).css({ backgroundColor: 'Red', color: 'White' });
			}, function () {
				$(this).css({ backgroundColor: '#DDD', color: 'black' });
			});

			var _widht = document.documentElement.clientWidth;  //屏幕宽
			var _height = document.documentElement.clientHeight; //屏幕高

			var boxWidth = $("#mb_con").width();
			var boxHeight = $("#mb_con").height();

			//让提示框居中
			$("#mb_con").css({ top: (_height - boxHeight) / 2 + "px", left: (_widht - boxWidth) / 2 + "px" });
		}


		//确定按钮事件
		var btnOk = function (callback) {
			$("#mb_btn_ok").click(function () {
				$("#mb_box,#mb_con").remove();
				if (typeof (callback) == 'function') {
					callback();
				}
			});
		}

		//取消按钮事件
		var btnNo = function () {
			$("#mb_btn_no,#mb_ico").click(function () {
				$("#mb_box,#mb_con").remove();
			});
		}
	})();
</script>

<script type="text/javascript">
	//检索事件
	function search(){
		//获取选中的查询条件
		var belongcollege;
		var belongmajor;
		var selectyear;
		belongcollege=$('#select').attr('data-1');
		belongmajor=$('#select').attr('data-2');
		selectyear=$('#select').text();
		var $table = $('#table');
		$.get("/kmap/API/CoursePlan/Search.do",{"college":belongcollege,"major":belongmajor,"year":selectyear},function(data,status){
			if(data.length!=0)
			{
				$table.bootstrapTable('load',data);
			}
			else
			{
				$.MsgBox.Alert("提示","暂无搜索结果");
			}
		});

	}
	$(function(){
		//初始化下拉表
		//获取数据
		$.get("/kmap/API/CoursePlan/GetDropDownModel.do?type=1",null,function(data,status){
			$('#treeview1').treeview({
				levels:1,
				data: data

			});
		})

	});
</script>
</body>
</html>
