<%@ page import="org.andy.kmap.model.entity.LoginViewModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学院添加</title>
<link rel="stylesheet" href="admin/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="admin/css/bootstrap-spinner.css">
<link rel="stylesheet" href="admin/css/style-main.css">
<link rel="stylesheet" href="admin/css/bootstrap-treeview.css">
<link rel="stylesheet" href="admin/css/bootstrap-table.min.css">
<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function(){
		$(".div2").click(function(){ 
			$(this).next("div").slideToggle("slow")  
			.siblings(".div3:visible").slideUp("slow");
		});
	});
</script>
<script>
var collegeactionid;
var collegeactionname;
var collegeactionindex;
function actionFormatter(value, row, index) {
    return [
        '<span style="width:15%; display:inline-block"><a class="edit ml10" href="javascript:void(0)" title="Edit">',
        '<i class="glyphicon glyphicon-edit"></i>',
        '</a></span>',
        '<span style="width:15%; display:inline-block"><a class="remove ml10" href="javascript:void(0)" title="Remove">',
        '<i class="glyphicon glyphicon-remove"></i>',
        '</a></span>'
    ].join('');
}

window.actionEvents = {
    'click .edit': function (e, value, row, index) {
        //alert('You click edit icon, row: ' + JSON.stringify(row));
        collegeactionid=row.collegeid;
		collegeactionname=row.collegename;
		collegeactionindex=index;
		$('#editModal').modal({
		
});
$("#editModal .modal-body input:first").val(row.collegeid);
$("#editModal .modal-body input:eq(1)").val(row.collegename);
    },
    'click .remove': function (e, value, row, index) {
        //alert('You click remove icon, row: ' + JSON.stringify(row));
		collegeactionid=row.collegeid;
		collegeactionname=row.collegename;
		$('#collegedeletesure').modal({
		
});
$("#collegedeletesure .modal-body p").empty();
$("#collegedeletesure .modal-body p").append('确认要删除'+collegeactionname+'吗?');
    }
};

function collegedelete(e)
{
//alert(collegeactionid);
    //ajax函数
    $.post("API/Academy/deleteAcademy.do",{"collegeid":collegeactionid},function(data,status){

        if(data.status=='1'){
            alert(data.detail);
            //前端伪变化
            $("#collegetable").bootstrapTable('remove', {
                field: 'collegeid',
                values: [collegeactionid]
            });
        }
        else
        {
            alert(data.detail);
        }
    })

}

<!--添加新行-->
function collegeadd()
{
var insertcollegeid=$("#myModal input:first").val();
var insertcollegename=$("#myModal input:eq(1)").val();
    //ajax函数
    $.post("API/Academy/addAcademy.do",{"collegeid":insertcollegeid,"collegename":insertcollegename},function(data,status){

        if(data.status=='1'){
            alert(data.detail);
            //前端伪变化
            $("#collegetable").bootstrapTable('insertRow', {
                index: 0,
                row: {
                    collegename: insertcollegename,
                    collegeid: insertcollegeid
                }
            });
        }
        else
        {
            alert(data.detail);
        }
    })
}
function collegeedit()
{

    var updateCollegeid= $("#editModal .modal-body input:first").val();
    var updateName= $("#editModal .modal-body input:eq(1)").val();
    //ajax函数
    $.post("API/Academy/editAcademy.do",{"collegeid":updateCollegeid,"collegename":updateName},function(data,status){

        if(data.status=='1'){
            alert(data.detail);
            //前端伪变化
            $("#collegetable").bootstrapTable('updateRow', {
                index: collegeactionindex,
                row: {
                    collegeid: $("#editModal .modal-body input:first").val(),
                    collegename: $("#editModal .modal-body input:eq(1)").val()
                }
            });
        }
        else
        {
            alert(data.detail);
        }
    })
}
</script>
</head>
<body>

<div class="container-fluid" id="container">
  <div class="row">
    <div class="title"><span><img src="admin/images/logo1.png" /></span> <span>天津大学知识地图信息管理系统</span> </div>
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
                <a href="#" style="color:#337ab7">学院信息添加</a></li>
              <li>
                <div class="college"><span class="glyphicon glyphicon-plus"></span></div>
                <a href="admin/gradeadd.jsp">年级信息添加</a></li>
              <li>
                <div class="college"><span class="glyphicon glyphicon-plus"></span></div>
                <a href="admin/majoradd.html">专业信息添加</a></li>
            </ul>
          </div>
          <div class="div2">
            <div class="college"><span class="glyphicon glyphicon-book"></span></div>
            课程信息</div>
          <div class="div3">
            <ul>
              <li>
                <div class="college"><span class="glyphicon glyphicon-plus"></span></div>
                <a href="admin/courseadd.html">专业课程添加</a></li>
              <li>
                <div class="college"><span class="glyphicon glyphicon-search"></span></div>
                <a href="admin/courseplansearch.html">课程计划查看</a></li>
              <li>
                <div class="college"><span class="glyphicon glyphicon-plus"></span></div>
                <a href="admin/courseplanadd.html">课程计划添加</a></li>
				<li>
                <div class="college"><span class="glyphicon glyphicon-plus"></span></div>
                <a href="admin/pointadd.html">课程知识添加</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!--end of content-->
    <div class="col-md-10" style="height:100%">
      <div class="row navigation">
        <!--<div class="three"></div>-->
        <div class="flagword">欢迎 <%=((LoginViewModel)request.getSession().getAttribute("userRole")).getUserEmail()%>现在所在的位置：学院信息 》学院信息添加</div>
      </div>
      <div class="row">
        <div class="col-md-10 col-md-offset-1">
          <div class="search">
            <div class="querytip"><span class="glyphicon glyphicon-education"  style="margin-right:10px"></span>学院信息</div>
            <div class="addform">
			  <div class="btn_add">
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">添加学院</button></div>

              <table data-toggle="table" id="collegetable" data-height="430" data-toolbar="#get"  data-url="API/Academy/getAllAcademies.do">
                <thead>
                  <tr>
                    <th data-field="collegename" data-align="center">学院名称</th>
                    <th data-field="collegeid" data-align="center">学院代码</th>
                    <th data-field="action" data-formatter="actionFormatter" data-events="actionEvents" data-align="center">操作</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
          <!--search-->
        </div>
      </div>
    </div>
  </div>
  <!--
  <div class="row" id="footer"></div>
  -->
</div>
<!--删除确认框-->
<div class="modal fade" id="collegedeletesure">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4>提示</h4>
      </div>
      <div class="modal-body">
        <p></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="deletecollegesure" data-dismiss="modal" class="btn btn-primary" onclick="collegedelete()">确认</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--添加学院框-->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">添加学院</h4>
                    </div>
                    <div class="modal-body">
                      <!--<form id="collegeadd"  method="get" action="">-->
                        <div class="space">
                          <label for="collegeid">学院代码</label>
                          <input type="text" id="collegeid" name="collegeid" class="form-control upline" />
                        </div>
                        <div class="space">
                          <label for="collegename">学院名称</label>
                          <input type="text" id="collegename" name="collegename" class="form-control upline" />
                        </div>
						<!--
						<div style="text-align:center">
                        <button type="submit" id="collegesubmit" class="btn btn-primary" >提交</button></div>-->
                      <!--</form>-->
                    </div>
					<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="deletecollegesure" data-dismiss="modal" class="btn btn-primary" onclick="collegeadd()">确认</button>
      </div>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- /.modal -->
<!--修改内容框-->
  <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">修改学院信息</h4>
                    </div>
                    <div class="modal-body">
                      <!--<form id="collegeadd"  method="get" action="">-->
                        <div class="space">
                          <label for="collegeid">学院代码</label>
                          <input type="text" id="collegeid" name="collegeid" class="form-control upline" />
                        </div>
                        <div class="space">
                          <label for="collegename">学院名称</label>
                          <input type="text" id="collegename" name="collegename" class="form-control upline" />
                        </div>
						<!--
						<div style="text-align:center">
                        <button type="submit" id="collegesubmit" class="btn btn-primary" >提交</button></div>-->
                      <!--</form>-->
                    </div>
					<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="editcollegesure" data-dismiss="modal" class="btn btn-primary" onclick="collegeedit()">确认</button>
      </div>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- /.modal -->
<!--script start-->
<script src="admin/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="admin/bootstrap/js/bootstrap.min.js"></script>
<script src="admin/js/bootstrap-treeview.js"></script>
<script src="admin/js/bootstrap-table.js"></script>
<script src="admin/js/jquery.spinner.min.js"></script>
</body>
</html>
