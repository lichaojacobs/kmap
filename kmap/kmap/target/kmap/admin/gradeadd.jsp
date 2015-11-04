<%@ page import="org.andy.kmap.model.entity.LoginViewModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>年级添加</title>
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
<script type="text/javascript">
$(document).ready(function(){

		$("#allchoose").bind("click", function () {
                if($(this).is(":checked"))
		{
		$(".belong :checkbox").prop("checked", true);
		}
		else
		{
		$(".belong :checkbox").prop("checked", false);
		}
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
	<span>天津大学知识地图信息管理系统</span> </div>
  </div>
  <div class="row" id="maincontent" style="height:80%">

	  <!--start of content-->
	  <div class="col-md-2" style=" background-color: rgba(194, 190, 190, 0.3); height:100%">
		  <div class="content">
			  <div class="div1">
				  <div class="div2">
					  <div class="college"><span class="glyphicon glyphicon-user"></span></div>
					  学院信息</div>
				  <div class="div3" id="collegeinfo">
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
				  <div class="div3">
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
			<div class="flagword">欢迎 <%=((LoginViewModel)request.getSession().getAttribute("userRole")).getUserEmail()%>现在所在的位置：学院信息 》添加年级</div>
		</div>
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <div class="search">
            <div class="querytip">添加年级</div>
            <div class="addform">
              <form id="gradeadd"  method="get" action="">
                <div class="space">
                  <label for="gradeid" style="margin-left: -25%">年级代码</label>
                  <select id="gradeid" name="gradeid" class="drop">
				  <option value="2010">2010</option>
				  <option value="2011">2011</option>
				  <option value="2012">2012</option>
				  <option value="2013">2013</option>
				  <option value="2014">2014</option>
				  <option value="2015">2015</option>
				  <option value="2016">2016</option>
				  <option value="2017">2017</option>
				  <option value="2018">2018</option>
				  <option value="2019">2019</option>
				  <option value="2020">2020</option>
				  <option value="2021">2021</option>
				  <option value="2022">2022</option>
				  <option value="2023">2023</option>
				  <option value="2024">2024</option>
				  <option value="2025">2025</option>
				  <option value="2026">2026</option>
				  <option value="2027">2027</option>
				  <option value="2028">2028</option>
				  <option value="2029">2029</option>
				  <option value="2030">2030</option>
				</select>
                </div>
                <div class="space">
                  <label for="collegebelong" style="margin-left: 7px">所属学院</label>
				  <div class="contain">
                  <div class="belong">
				  <input type="checkbox" name="collegebelong" value="209" /><label>管理与经济学部</label>
				  </div>
				  <div class="belong">
				  <input type="checkbox" name="collegebelong" value="213" /><label>建筑学院</label>
				  </div>
				  <div class="belong">
				  <input type="checkbox" name="collegebelong" value="214" /><label>自动化学院</label>
				  </div>
				  <div class="belong">
				  <input type="checkbox" name="collegebelong" value="211" /><label>材料学院</label>
				  </div>
				  <div class="belong">
				  <input type="checkbox" name="collegebelong" value="212" /><label>文法学院</label>
				  </div>
				  <div class="belong">
				  <input type="checkbox" name="collegebelong" value="" /><label>精仪学院</label>
				  </div>
				  <div class="belong">
				  <input type="checkbox" name="collegebelong" value="" /><label>化工学院</label>
				  </div>
				  <div class="belong">
				  <input type="checkbox" name="collegebelong" value="" /><label>建工学院</label>
				  </div>
				  <div class="belong">
				  <input type="checkbox" name="collegebelong" value="" /><label>生命科学学院</label>
				  </div>
				  <div class="allchoose">
				  <input type="checkbox" name="allchoose" id="allchoose" /><label style="color:#286090">全选</label></div>
				  </div>
                </div>
				<a role="button"  onclick="submitToAdd()" class="btn btn-primary">添加年级</a>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--
  <div class="row" id="footer"></div>
  -->
</div>
<script type="text/javascript">
	function submitToAdd(){
		//获取下拉选项
		var gradeyear= $("#gradeid").find("option:selected").text();
		//获取所属学院
		var collegeid;
		$("input[name=collegebelong]").each(function(){
			if(this.checked==true){
				collegeid =this.value;
			}
		})
		//ajax函数
		$.post("/kmap/API/Academy/addGrade.do",{"collegeid":collegeid,"gradeyear":gradeyear},function(data,status){

			if(data.status=='1'){

				alert(data.detail);
			}
			else
			{
				alert(data.detail);
			}
		})




	}
</script>

</body>
</html>
