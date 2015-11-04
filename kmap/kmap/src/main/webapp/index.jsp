
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link rel="stylesheet" href="admin/bootstrap/css/bootstrap.min.css">
<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="admin/css/bjqs.css">
<link rel="stylesheet" href="admin/css/style-main.css">
<script src="admin/bootstrap/js/bootstrap.min.js"></script>
<script src="admin/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="admin/js/bjqs-1.3.min.js" type="text/javascript"></script>
<script src="admin/js/jquery.validate.js" type="text/javascript"></script>
<script src="admin/js/additional-methods.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
		$(".div2").click(function(){ 
			$(this).next("div").slideToggle("slow")  
			.siblings(".div3:visible").slideUp("slow");
		});
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
$("#login").validate({

})
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
$(document).ready(function(){
var ua=navigator.userAgent.toLocaleLowerCase();
if(ua.match(/msie/) != null){$("#footer").css('marginTop','61px');}
if(ua.match(/firefox/) != null){$("#footer").css('marginTop','106px');}
if(ua.match(/chrome/) != null){$("#footer").css('marginTop','66px');}
});
	function register(){

		var username=$("#usernamer")[0].value;
		var email=$("#emailr")[0].value;
		var password=$("#passwordr")[0].value;
		var confirm_password=$("#confirm_password")[0].value;

		if(username==null||email==null||password==null)
		{
			alert("此字段必须！");
			return;
		}
		if(password!=password)
		{
			alert("俩次密码不一致！");
			return;
		}
		var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if(!filter.test(email)){
			alert("邮箱格式不符");
			return;
		}
		//ajax方法
		$.post("/kmap/register.do",{"username":username,"email":email,"password":password},function(data,status){

			if(status=="success"){

				if(data.status==1){

					alert(data.detail);

				}else{

					alert(data.detail)

				}

			}else {
				alert("网络故障,请稍后再试！")
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
	<span><img src="admin/images/logo1.png" /></span>
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
          <li><img src="admin/images/1.png" title=" "></li>
          <li><img src="admin/images/2.png" title="Knowledge change world"></li>
          <li><img src="admin/images/3.png" title=" "></li>
        </ul>
        <!-- end Basic jQuery Slider -->
      <div class="loginbox change">
	  <span class="loginclose glyphicon glyphicon-remove"></span>
	  <form id="login" name="login" method="post" action="login.do">
	  <div class="loginspace"><span style="font-size:30px">登  录</span></div>
	  <div class="loginspace">
	  <label for="username">邮箱</label>
	  <input type="text" id="username" name="email" class="form-control" style="width:68%; display:inline-block" required/>
	  </div>
	  <div class="loginspace">
	  <label for="password" style="margin-right:7px">密  码 </label>
	  <input type="password" id="password" name="password" class="form-control" style="width:68%; display:inline-block" required/>
	  </div>
	  <div class="loginspace" style="padding-left:40px">
	  <button class="btn-primary btn" type="submit" style="width:75%">提  交</button>
	  </div>
	  </form>
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
</body>
</html>
