
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>首页</title>
	<link rel="stylesheet" href="/kmap/admin/bootstrap/css/bootstrap.min.css">
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/kmap/admin/css/bjqs.css">
	<link rel="stylesheet" href="/kmap/admin/css/style-main.css">
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="/kmap/admin/js/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="/kamp/admin/bootstrap/js/bootstrap.min.js"></script>
	<script src="/kmap/admin/js/bjqs-1.3.min.js" type="text/javascript"></script>
	<script src="/kmap/admin/js/jquery.validate.js" type="text/javascript"></script>
	<script src="/kmap/admin/js/additional-methods.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".div2").click(function(){
				$(this).next("div").slideToggle("slow")
						.siblings(".div3:visible").slideUp("slow");
			})});
	</script>
	<script type="text/javascript">

		jQuery(document).ready(function($) {

			$('#banner-fade').bjqs({
				animtype : 'fade',
				height: 480,
				width:    '100%',
				animduration : 450,
				animspeed : 3000,

				showcontrols : false,
				showmarkers : false,
				randomstart : true,
				responsive  : true
			});

		});
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#loginbtn").click(function(){
				$(".registerbox").addClass("change");
				$(".loginbox").removeClass("change");
			});
			$("#registerbtn").click(function(){
				$(".loginbox").addClass("change");
				$(".registerbox").removeClass("change");
			});
			$(".loginclose").click(function(){
				$(".loginbox").addClass("change");
			});
			$(".registerclose").click(function(){
				$(".registerbox").addClass("change");
			});
		});
	</script>
	<script type="text/javascript">

		$(document).ready(function(){
			$.validator.setDefaults({
				debug:true
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function(){

			$("#register").validate({
				rules:{
					confirm_password: {
						equalTo: "#passwordr"
					}
				},
				messages:
				{
					usernamer:'请输入用户名',
					emailr:
					{
						required: "请输入email地址",
						email: "请输入正确的email地址"
					},
					passwordr:'请输入密码',
					confirm_password:
					{
						required: "请输入确认密码",
						equalTo: "两次输入密码不一致"
					}
				}
			})

		});
	</script>
	<script type="text/javascript">
		function register(){

			var username=$("#usernamer")[0].value;
			var email=$("#emailr")[0].value;
			var password=$("#passwordr")[0].value;
			var confirm_password=$("#confirm_password")[0].value;

			if(username=="")
			{
				$.MsgBox.Alert("提示","用户名字段必须");
				return;
			}
			if(email=="")
			{
				$.MsgBox.Alert("提示","邮箱字段必须");
				return;
			}
			if(password=="")
			{
				$.MsgBox.Alert("提示","密码字段必须");
				return;
			}
			if(password!=confirm_password)
			{
				$.MsgBox.Alert("提示","俩次密码不一致！");
				return;
			}
			var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if(!filter.test(email)){
				$.MsgBox.Alert("提示","邮箱格式不符");
				return;
			}
			//register
			$.post("/kmap/register.do",{"username":username,"email":email,"password":password},function(data,status){

				if(status=="success"){

					if(data.status==1){

						$.MsgBox.Alert("提示",data.detail);

					}else{

						$.MsgBox.Alert("提示",data.detail)

					}
				}else {
					$.MsgBox.Alert("错误","网络故障,请稍后再试！")
				}
			})

		}
	</script>
</head>
<body>
<div class="container-fluid" id="container">
	<div class="row">
		<!--<img src="images/logo1.png" />style="height:90px; padding-top:10px"-->
		<div class="title">
			<span><img src="/kmap/admin/images/logo1.png" /></span>
			<span>天津大学知识地图信息管理系统</span>
			<div style="margin-top: -48px; margin-left: 85%;">
				<span class="btn-default btn loginstyle" id="loginbtn">登录</span>
				<span class="btn-default btn registerstyle" id="registerbtn">注册</span></div>
		</div>
	</div>
	<div class="row" style="border-top: 5px solid rgba(117, 180, 240, 0.62);">
		<div id="banner-fade" style="width:100%">

			<!-- start Basic Jquery Slider -->
			<ul class="bjqs">
				<li><img src="/kmap/admin/images/1.png" title=" "></li>
				<li><img src="/kmap/admin/images/2.png" title=""></li>
			</ul>
			<!-- end Basic jQuery Slider -->
			<div class="loginbox change">
				<span class="loginclose glyphicon glyphicon-remove"></span>
				<!--<form id="login" name="login" method="post" action="login.do">-->
				<div class="loginspace"><span style="font-size:30px">登  录</span></div>
				<div class="loginspace">
					<label for="email">邮箱</label>
					<input type="text" id="email" name="email" class="form-control" style="width:68%; display:inline-block" required/>
				</div>
				<div class="loginspace">
					<label for="password" style="margin-right:7px">密  码 </label>
					<input type="password" id="password" name="password" class="form-control" style="width:68%; display:inline-block" required/>
				</div>
				<div class="loginspace" style="padding-left:40px">
					<button class="btn-primary btn"  id="login_submit" onclick="login.submit()" style="width:75%">提  交</button>
				</div>
				<!-- </form>-->
			</div>
			<!--loginbox-->
			<div class="registerbox change" style="height:375px">
				<span class="registerclose glyphicon glyphicon-remove"></span>
				<%--<form id="register" name="register"  action="#">--%>
				<div class="loginspace"><span style="font-size:30px">注  册</span></div>
				<div class="loginspace">
					<label for="usernamer">用户名</label>
					<input type="text" id="usernamer" name="usernamer" class="form-control" style="width:68%; display:inline-block" required/>
				</div>
				<div class="loginspace">
					<label for="emailr" style="margin-right:7px">邮 箱</label>
					<input type="email" id="emailr" name="emailr" class="form-control" style="width:68%; display:inline-block" required />
				</div>
				<div class="loginspace">
					<label for="passwordr" style="margin-right:7px">密  码 </label>
					<input type="password" id="passwordr" name="passwordr" class="form-control" style="width:68%; display:inline-block" required/>
				</div>
				<div class="loginspace">
					<label for="confirm_password" style="margin-left:-17px">确认密码 </label>
					<input type="password" id="confirm_password" name="confirm_password" class="form-control" style="width:68%; display:inline-block" required/>
				</div>
				<div class="loginspace" style="padding-left:40px">
					<button class="btn-primary btn" onclick="register()"  style="width:75%">提  交</button>
				</div>
				<%--</form>--%>
			</div>
			<!--registerbox-->
		</div>
	</div>
</div>
<div class="row" id="footer"><span>联系我们：hello@163.com</span></div>
</div>
<!--MSG BOX-->
<script src="/kmap/admin/js/MessageBox.js"></script>
<script type="text/javascript">
	var login ={
		init: function(){},
		submit:function(){
			var email=$("#email")[0].value;
			var password=$("#password")[0].value;
			var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if(!filter.test(email)){
				$.MsgBox.Alert("提示","邮箱格式不正确");
				return;
			}
			if(password.length<6)
			{
				$.MsgBox.Alert("提示","密码长度小于6");
				return;
			}
			//提交登录请求
			//ajax函数
			$.ajax({
				url: "/kmap/login.do",
				data:{"email":email,"password":password},
				type: "POST",
				success:function(data,status){
					if(data.status==1){
						//登录成功
						$.MsgBox.Alert("提示",data.detail+"正在跳转...");
						setInterval(function (){
							if(data.isAdmin==1)
								location.href=data.redirectUrl;
							else
								location.href=data.redirectUrl;
						},3000);

					}else{
						$.MsgBox.Alert("登录失败",data.detail);
					}
				},
				error:function(data,status){
					$.MsgBox.Alert("提示","网络不通");
				}
			});

		}
	}
	login.init();
</script>
<script type="text/javascript">
	$(document).ready(function(){
		var ua=navigator.userAgent.toLocaleLowerCase();
		if(ua.match(/msie/) != null){$("#footer").css('marginTop','61px');}
		if(ua.match(/firefox/) != null){$("#footer").css('marginTop','106px');}
		if(ua.match(/chrome/) != null){$("#footer").css('marginTop','66px');}

	});
</script>
</body>
</html>
