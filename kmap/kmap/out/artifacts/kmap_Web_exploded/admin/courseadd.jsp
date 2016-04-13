<%@ page import="org.andy.kmap.model.entity.LoginViewModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程添加</title>
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
    <script src="/kmap/admin/js/MessageBox.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		$(".div2").click(function(){ 
			$(this).next("div").slideToggle("slow")  
			.siblings(".div3:visible").slideUp("slow");
		});
	});
</script>
<script>
function courseactionFormatter(value, row, index) {
    return [
        /*'<span style="width:15%; display:inline-block"><a class="edit ml10" href="javascript:void(0)" title="Edit">',
        '<i class="glyphicon glyphicon-edit"></i>',
        '</a></span>',*/
        '<span style="width:15%; display:inline-block"><a class="remove ml10" href="javascript:void(0)" title="Remove">',
        '<i class="glyphicon glyphicon-remove"></i>',
        '</a></span>',
		'<span style="width:15%; display:inline-block"><a class="add ml10" href="javascript:void(0)" title="Add">',
        '<i class="glyphicon glyphicon-plus"></i>',
        '</a></span>'
    ].join('');
}
var courseactionid;
var courseactionname;
var courseactionindex;
window.courseactionEvents = {
    'click .remove': function (e, value, row, index) {
        //alert('You click remove icon, row: ' + JSON.stringify(row));
        //console.log(value, row, index);
		courseactionid=row.id;
		courseactionname=row.name;
		$('#coursedeletesure').modal({
		
})
$("#coursedeletesure .modal-body p").empty();
$("#coursedeletesure .modal-body p").append('确认要删除'+courseactionname+'全部课程吗?'); 
		
		
    },
	 'click .add': function (e, value, row, index) {
         courseactionid = row.id;
         courseactionname = row.academyName;
         courseactionindex = index;
         $('#addcourseModal').modal({});
         $("#addcourseModal .modal-body input:eq(3)").val(row.academyName);
     }
};
function coursedelete(e)
{


$("#coursetable").bootstrapTable('remove', {
                field: 'id',
                values: [courseactionid]
            });
};
//添加方法
function courseadd()
{
    var id=$("#addcourseModal .modal-body input:first").val();
    var name=$("#addcourseModal .modal-body input:eq(1)").val();
    var credit=$("#addcourseModal .modal-body input:eq(2)").val();
    var category=$("#coursecategory").val();
    var property=$("#courseproperty").val();
    var html;
    //ajax方法
    $.post("/kmap/API/Course/addCourse.do",{"courseid":id,"coursename":name,"coursecredit":credit,"academyId":courseactionid,"category":category,"property":property},function(data,status){
        if(status=="success"){
            if(data.status==1){
                $.MsgBox.alert("提示",data.detail);
                //伪动态代码
                html=detailadd(courseactionindex,id,  name,credit);
                var istable=html.indexOf('<table');
                if(istable==0)
                {
                    $("#coursetable tbody .detail-view td:first p").remove();
                    $("#coursetable tbody .detail-view td:first").append(html);
                }
                else
                {
                    $("#coursetable tbody .detail-view table").append(html);

                }

            }else{

                $.MsgBox.alert("错误",data.detail);

            }
        }else {
            $.MsgBox.alert("错误","网络故障");
        }
    });
};
</script>
<script>
var anycourseactionindex;
var anycourseactionid;
var anycourseactionname;
function detailFormatter(index,row)
{
        var html=[];
		var j=0;
		var data;
		var tempdata;
		var l;
		var detailwid=$("#coursetable thead:first tr th:first").css("width");
		var idwid=$("#coursetable thead tr th:eq(1)").css("width");
		var namewid=$("#coursetable thead tr th:eq(2)").css("width");
		var action=$("#coursetable thead tr th:eq(3)").css("width");
		$.each(row, function (key, value) {
		if(key=="courses"){
		l=value.length;
		if(l==0)
		{
		html.push('<p>还没有课程！</p>');
		}
        for(j=0; j<=l-1;j++)
		{
		if(j==0)
		{
		html.push('<table data-toggle='+'table'+'><tr><th style='+'text-align:center'+'>'+'编号'+'</th><th style= '+'text-align:center'+'>'+'名称'+'</th><th style='+'text-align:center'+'>'+'学分'+'</th></tr><tr><td style='+'width:'+idwid+'>'+value[j].id+'</td><td style='+'width:'+namewid+'>'+value[j].name+'</td><td style='+'width:'+idwid+'>'+value[j].credit+'</td><td style='+'padding-left:0px'+'>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="edit ml10" href="javascript:void(0)" onclick="anycourseedit($(this))" title="Edit">'+'<i class="glyphicon glyphicon-edit"></i>'+'</a></span>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="remove ml10" href="javascript:void(0)" onclick="anycourseremove($(this))" title="Remove">'+'<i class="glyphicon glyphicon-remove"></i>'+'</a><span>'+'</td></tr>');
		}
		else if(j==l-1)
		{
		html.push('<tr><td style='+'width:'+idwid+'>'+value[j].id+'</td><td style='+'width:'+namewid+'>'+value[j].name+'</td><td style='+'width:'+idwid+'>'+value[j].credit+'</td><td style='+'padding-left:0px'+'>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="edit ml10" href="javascript:void(0)" onclick="anycourseedit($(this))" title="Edit">'+'<i class="glyphicon glyphicon-edit"></i>'+'</a></span>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="remove ml10" href="javascript:void(0)" onclick="anycourseremove($(this))" title="Remove">'+'<i class="glyphicon glyphicon-remove"></i>'+'</a></span>'+'</td></tr></table>');
		}
		
		else 
		{
		html.push('<tr><td style='+'width:'+idwid+'>'+value[j].id+'</td><td style='+'width:'+namewid+'>'+value[j].name+'</td><td style='+'width:'+idwid+'>'+value[j].credit+'</td><td style='+'padding-left:0px'+'>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="edit ml10" href="javascript:void(0)" onclick="anycourseedit($(this))" title="Edit">'+'<i class="glyphicon glyphicon-edit"></i>'+'</a></span>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="remove ml10" href="javascript:void(0)" onclick="anycourseremove($(this))" title="Remove">'+'<i class="glyphicon glyphicon-remove"></i>'+'</a></span>'+'</td></tr>');
		}

		}
		}
        });
		return html.join('');
        
};

function detailadd(index,id,name,credit)
{
        var detailwid=$("#coursetable thead:first tr th:first").css("width");
		var idwid=$("#coursetable thead tr th:eq(1)").css("width");
		var namewid=$("#coursetable thead tr th:eq(2)").css("width");
		var action=$("#coursetable thead tr th:eq(3)").css("width");
		var html=[];
		var l=false;
		if(!l)
		{
		html.push('<table data-toggle='+'table'+'><tr><td style='+'width:'+idwid+';'+'padding-left:15px'+'>'+id+'</td><td style='+'width:'+namewid+';'+'padding-left:15px'+'>'+name+'</td><td style='+'width:'+idwid+'>'+credit+'</td><td style='+'padding-left:15px'+'>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="edit ml10" href="javascript:void(0)" title="Edit" onclick="anycourseedit($(this))">'+'<i class="glyphicon glyphicon-edit"></i>'+'</a></span>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="remove ml10" href="javascript:void(0)" onclick="anycourseremove($(this))" title="Remove">'+'<i class="glyphicon glyphicon-remove"></i>'+'</a><span>'+'</td></tr></table>');
		istable=true;
		}
		else
		{
		html.push('<tr><td style='+'width:'+idwid+';'+'padding-left:15px'+'>'+id+'</td><td style='+'width:'+namewid+';'+'padding-left:15px'+'>'+name+'</td><td style='+'width:'+idwid+'>'+credit+'</td><td style='+'padding-left:15px'+'>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="edit ml10" href="javascript:void(0)" title="Edit" onclick="anycourseedit($(this))">'+'<i class="glyphicon glyphicon-edit"></i>'+'</a></span>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="remove ml10" href="javascript:void(0)" title="Remove" onclick="anycourseremove($(this))">'+'<i class="glyphicon glyphicon-remove"></i>'+'</a></span>'+'</td></tr>');
		istable=false;
		}
		return html.join('');

}
/*$("#coursetable tr.detail-view .remove").click(function(){
		alert();
		$('#anycoursedeletesure').modal({

})
		});*/
var actiontr;
function anycourseremove(obj)
{
actiontr=obj;
anycourseactionname=actiontr.parent().parent().parent("tr").children("td:eq(1)").html();
$('#anycoursedeletesure').modal({
		
})
$("#anycoursedeletesure .modal-body p").empty();
$("#anycoursedeletesure .modal-body p").append('确认要删除'+anycourseactionname+'吗?'); 

};
function anycoursedelete()
{
actiontr.parent().parent().parent("tr").remove();
anycourseactionid=actiontr.parent().parent().parent("tr").children("td:eq(0)").html();
anycourseactionname=actiontr.parent().parent().parent("tr").children("td:eq(1)").html();
//$("#coursetable tr.detail-view table tbody").remove('tr:eq('+anycourseactionindex+')');
    $.post("/kmap/API/Course/deleteCourse.do",{"courseid":anycourseactionid,"coursename":anycourseactionname},function(data,status){
        if(status=="success"){
            if(data.status==1){
                $.MsgBox.alert("提示",data.detail);
                //伪动态操作
                actiontr.parent().parent().parent("tr").remove();
            }
            else
            {
                $.MsgBox.alert("错误",data.detail);
            }

        }else
        {
            $.MsgBox.alert("错误","网络异常");
        }
    });
}

//修改课程信息
function anycourseedit(obj)
{
$('#anycourseedit').modal({
		
});
actiontr=obj;
var id=actiontr.parent().parent().parent("tr").children("td:eq(0)").html();
var name=actiontr.parent().parent().parent("tr").children("td:eq(1)").html();
var credit=actiontr.parent().parent().parent("tr").children("td:eq(2)").html();
$("#anycourseedit .modal-body input:first").val(id);
$("#anycourseedit .modal-body input:eq(1)").val(name);
$("#anycourseedit .modal-body input:eq(2)").val(credit);

};
function courseedit()
{
    var id=$("#anycourseedit .modal-body input:first").val();
    var name=$("#anycourseedit .modal-body input:eq(1)").val();
    var credit=$("#anycourseedit .modal-body input:eq(2)").val();
    //调用ajax方法
    $.post("/kmap/API/Course/editCourse.do",{"courseid":id,"coursename":name,"coursecredit":credit},function(data,status){

        if(status=="success"){
            if(data.status==1){
                $.MsgBox.alert("提示",data.detail);
                actiontr.parent().parent().parent("tr").children("td:eq(1)").html(name);
                actiontr.parent().parent().parent("tr").children("td:eq(2)").html(credit);
            }
            else
            {
                $.MsgBox.alert("错误",data.detail);
            }


        }else
        {
            $.MsgBox.alert("错误","网络异常");
        }
    });
}
</script>
<style>

</style>
</head>
<body>
<div class="container-fluid" id="container">
  <div class="row">
    <div class="title"><span><img src="/kmap/admin/images/logo1.png" /></span> <span>天津大学知识地图信息管理系统</span> </div>
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
        <div class="flagword">您现在所在的位置：课程信息 》专业课程添加</div>
          <div class="login_info">
              欢迎: <%=((LoginViewModel)request.getSession().getAttribute("userRole")).getUserName()%>
              <a href="/kmap/quit.do">注销</a>
          </div>
      </div>
      <div class="row">
        <div class="col-md-10 col-md-offset-1">
          <div class="search">
            <div class="querytip"><span class="glyphicon glyphicon-education" style="margin-right:10px"></span>课程信息</div>
            <div class="addform">
              <table id="coursetable"
               data-toggle="table"
               data-height="460"
               data-detail-view="true"
               data-detail-formatter="detailFormatter"
               data-toolbar="#get"  data-url="/kmap/API/Course/getAllCourses.do">
                <thead>
                  <tr>
                    <th data-field="id" data-align="center">代码</th>
                    <th data-field="academyName" data-align="center">名称</th>
                    <th data-field="courseaction" data-formatter="courseactionFormatter" data-events="courseactionEvents" data-align="center">操作</th>
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
<!--删除学院全部课程确认框-->
<div class="modal fade" id="coursedeletesure">
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
        <button type="button" id="deletecoursesure" data-dismiss="modal" class="btn btn-primary" onclick="coursedelete()">确认</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--删除学院某一课程确认框-->
<div class="modal fade" id="anycoursedeletesure">
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
        <button type="button" id="anydeletecoursesure" data-dismiss="modal" class="btn btn-primary" onclick="anycoursedelete()">确认</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--编辑课程框-->
  <div class="modal fade" id="anycourseedit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">修改课程信息</h4>
                    </div>
                    <div class="modal-body">
                      <!--<form id="collegeadd"  method="get" action="">-->
                        <div class="space">
                          <label for="courseid">课程代码</label>
                          <input type="text" id="courseid" readonly="readonly" name="majorid" class="form-control upline" />
                        </div>
                        <div class="space">
                          <label for="coursename">课程名称</label>
                          <input type="text" id="coursename" name="majorname" class="form-control upline" />
                        </div>
                        <div class="space">
                            <label for="coursecredit">学分</label>
                            <input type="text" id="coursecredit" name="coursecredit" class="form-control upline" />
                        </div>
						<!--
						<div style="text-align:center">
                        <button type="submit" id="collegesubmit" class="btn btn-primary" >提交</button></div>-->
                      <!--</form>-->
                    </div>
					<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="editcoursesure" data-dismiss="modal" class="btn btn-primary" onclick="courseedit()">确认</button>
      </div>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- /.modal -->
<!--添加课程框-->
  <div class="modal fade" id="addcourseModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">添加课程</h4>
                    </div>
                    <div class="modal-body">
                      <!--<form id="collegeadd"  method="get" action="">-->
					  
                        <div class="space">
                          <label for="courseid">课程代码</label>
                          <input type="text" id="courseid" name="courseid" class="form-control upline" />
                        </div>
                        <div class="space">
                          <label for="coursename">课程名称</label>
                          <input type="text" id="coursename" name="coursename" class="form-control upline" />
                        </div>
                        <div class="space">
                            <label for="coursecredit">学分</label>
                            <input type="text" id="coursecredit" name="coursecredit" class="form-control upline" />
                        </div>
						<div class="space">
                          <label for="coursebelongcollege">所属学院</label>
                          <input type="text" id="coursebelongcollege" name="coursebelongcollege" readonly="readonly" class="form-control upline" />
                        </div>
                        <!--课程属性-->
                        <div class="space">
                            <label for="coursecategory">课程类别</label>
                            <select id="coursecategory" name="coursecategory">
                                <option value="1">人文与社会科学类</option>
                                <option value="2">训练与健康类</option>
                                <option value="3">数学与自然科学类</option>
                                <option value="4">学科基础类</option>
                                <option value="5">专业类</option>
                                <option value="6">集中实践类</option>
                                <option value="7">创新与研修类</option>
                            </select>
                        </div>
                        <div class="space">
                            <label for="courseproperty" name="courseproperty">课程属性</label>
                            <select id="courseproperty">
                                <option value="1">思想政治理论</option>
                                <option value="2">外语</option>
                                <option value="3">文化素质教育</option>
                                <option value="4">体育</option>
                                <option value="5">军事</option>
                                <option value="6">健康教育</option>
                                <option value="7">数学</option>
                                <option value="8">物理</option>
                                <option value="9">计算机</option>
                                <option value="10">学科基础</option>
                                <option value="11">专业核心</option>
                                <option value="12">专业选修</option>
                                <option value="13">课程设计</option>
                                <option value="14">实习</option>
                                <option value="15">毕业设计(论文)</option>
                                <option value="16">研究与创新</option>
                                <option value="17">跨学科选修</option>
                                <option value="18">学生创新实践计划(PSIP)</option>
                            </select>
                        </div>

                    </div>
					<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="addcourseesure" data-dismiss="modal" class="btn btn-primary" onclick="courseadd()">确认</button>
      </div>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- /.modal -->
</body>
</html>
