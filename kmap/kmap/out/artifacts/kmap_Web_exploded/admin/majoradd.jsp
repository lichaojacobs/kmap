<%@ page import="org.andy.kmap.common.model.entity.LoginViewModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>专业添加</title>
    <link rel="stylesheet" href="/kmap/admin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/kmap/admin/css/bootstrap-spinner.css">
    <link rel="stylesheet" href="/kmap/admin/css/style-main.css">
    <link rel="stylesheet" href="/kmap/admin/css/bootstrap-treeview.css">
    <link rel="stylesheet" href="/kmap/admin/css/bootstrap-table.min.css">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/kmap/admin/css/style-main.css">
</head>
<body>
<div class="container-fluid" id="container">
  <div class="row">
    <div class="title"> 
	<span><img src="/kmap/admin/images/logo1.png" /></span>
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
        <div class="flagword">您现在所在的位置：学院信息 》专业信息添加</div>
          <div class="login_info">
              欢迎: <%=((LoginViewModel)request.getSession().getAttribute("userRole")).getUserName()%>
              <a href="/kmap/quit.do">注销</a>
          </div>
      </div>
      <div class="row">
        <div class="col-md-10 col-md-offset-1">
          <div class="search">
            <div class="querytip"><span class="glyphicon glyphicon-education" style="margin-right:10px"></span>专业信息</div>
            <div class="addform">
              <table id="majortable"
               data-toggle="table"
               data-height="460"
               data-detail-view="true"
               data-detail-formatter="detailFormatter"
               data-toolbar="#get"  data-url="/kmap/API/Major/GetMajorsPerGrade.do">
                <thead>
                  <tr>
                    <th data-field="id" data-align="center">代码</th>
                    <th data-field="academyName" data-align="center">名称</th>
                    <th data-field="majoraction" data-formatter="majoractionFormatter" data-events="majoractionEvents" data-align="center">操作</th>
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
<div class="modal fade" id="majordeletesure">
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
        <button type="button" id="deletemajorsure" data-dismiss="modal" class="btn btn-primary" onclick="majordelete()">确认</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--添加专业框-->
  <div class="modal fade" id="addmajorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">添加专业</h4>
                    </div>
                    <div class="modal-body">
                      <!--<form id="collegeadd"  method="get" action="">-->
                        <div class="space">
                          <label for="majoryear">专业年级</label>
                          <input type="text" id="majoryear" name="majoryear" class="form-control upline" />
                        </div>
                        <div class="space">
                          <label for="majorname">专业名称</label>
                          <input type="text" id="majorname" name="majorname" class="form-control upline" />
                        </div>
						<div class="space">
                          <label for="majorinfo">专业介绍</label>
                          <input type="text" id="majorinfo" name="majorinfo"  class="form-control upline" />
                        </div>
						<!--
						<div style="text-align:center">
                        <button type="submit" id="collegesubmit" class="btn btn-primary" >提交</button></div>-->
                      <!--</form>-->
                    </div>
					<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="addmajorsure" data-dismiss="modal" class="btn btn-primary" onclick="majoradd()">确认</button>
      </div>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- /.modal -->
<!--删除学院某一课程确认框-->
 <div class="modal fade" id="anymajordeletesure">
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
        <button type="button" id="anydeletemajorsure" data-dismiss="modal" class="btn btn-primary" onclick="anymajordelete()">确认</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--编辑课程框-->
  <div class="modal fade" id="anymajoredit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">修改专业信息</h4>
                    </div>
                    <div class="modal-body">
                      <!--<form id="collegeadd"  method="get" action="">-->
                        <div class="space">
                          <label for="majorid">专业代码</label>
                          <input type="text" id="majorid" name="majorid" class="form-control upline" />
                        </div>
                        <div class="space">
                          <label for="majorname">专业名称</label>
                          <input type="text" id="majorname" name="majorname" class="form-control upline" />
                        </div>
						<!--
						<div style="text-align:center">
                        <button type="submit" id="collegesubmit" class="btn btn-primary" >提交</button></div>-->
                      <!--</form>-->
                    </div>
					<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="editmajorsure" data-dismiss="modal" class="btn btn-primary" onclick="majoredit()">确认</button>
      </div>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- /.modal -->


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
    function majoractionFormatter(value, row, index) {
        return [
            '<span style="width:15%; display:inline-block"><a class="remove ml10" href="javascript:void(0)" title="Remove">',
            '<i class="glyphicon glyphicon-remove"></i>',
            '</a></span>',
            '<span style="width:15%; display:inline-block"><a class="add ml10" href="javascript:void(0)" title="Add">',
            '<i class="glyphicon glyphicon-plus"></i>',
            '</a></span>'
        ].join('');
    }
    var majoractionid;
    var majoractionname;
    var majoractionindex;

    window.majoractionEvents = {
        'click .add': function (e, value, row, index) {
            majoractionid=row.id;
            majoractionname=row.academyName;
            majoractionindex=index;
            // alert(row.id+" "+row.academyName);
            $('#addmajorModal').modal({

            });
            $("#addmajorModal .modal-body input:eq(2)").val(row.name);

        },
        'click .remove': function (e, value, row, index) {
            majoractionid=row.id;
            majoractionname=row.name;
            $('#majordeletesure').modal({

            })
            $("#majordeletesure .modal-body p").empty();
            $("#majordeletesure .modal-body p").append('确认要删除'+majoractionname+'全部专业吗?');
        }
    };
    //删除
    function majordelete(e)
    {
        //alert(collegeactionid);
        $("#majortable").bootstrapTable('remove', {
            field: 'id',
            values: [majoractionid]
        });
    }
    //添加新专业
    function majoradd()
    {
        var year=$("#addmajorModal .modal-body input:first").val();
        var name=$("#addmajorModal .modal-body input:eq(1)").val();
        var info=$("#addmajorModal .modal-body input:eq(2)").val();
        var academyId=majoractionid;
        var html;
        //ajax方法
        $.post("/kmap/API/Major/addMajor.do",{"majorname":name,"majoryear":year,"majorinfo":info,"academyId":majoractionid},function(data,status){

            if(status=="success"){

                if(data.status==1){

                    $.MsgBox.Alert("提示",data.detail);
                    //伪动态代码
                    html=detailadd(majoractionindex,name,year,info);
                    var istable=html.indexOf('<table');
                    if(istable==0)
                    {
                        $("#majortable tbody .detail-view td:first p").remove();
                        $("#majortable tbody .detail-view td:first").append(html);}
                    else
                    {
                        $("#majortable tbody .detail-view table").append(html);
                    }

                }else{

                    $.MsgBox.Alert("提示",data.detail);

                }


            }else {
                $.MsgBox.Alert("提示","网络故障");
            }
        })

    };
    var anymajoractionindex;
    var anymajoractionid;
    var anymajoractionname;
    var actiontr;
    var oldyear;
    var oldname;
    //移除专业
    function anymajorremove(obj)
    {
        actiontr=obj;
        anymajoractionname=actiontr.parent().parent().parent("tr").children("td:eq(2)").html();
        $('#anymajordeletesure').modal({

        })
        $("#anymajordeletesure .modal-body p").empty();
        $("#anymajordeletesure .modal-body p").append('确认要删除'+anymajoractionname+'吗?');
        /*var obj;
         obj = event.srcElement ? event.srcElement : event.target;*/

    };

    function anymajordelete()
    {

       var year=anymajoractionid=actiontr.parent().parent().parent("tr").children("td:eq(1)").html();
        var name=actiontr.parent().parent().parent("tr").children("td:eq(2)").html();
        $.post("/kmap/API/Major/deleteMajor.do",{"majoryear":year,"majorname":name},function(data,status){

            if(status=="success"){
                if(data.status==1){

                    $.MsgBox.Alert("提示",data.detail);
                    //伪动态操作
                    actiontr.parent().parent().parent("tr").remove();

                }
                else
                {
                    $.MsgBox.Alert("错误",data.detail);
                }


            }else
            {

                $.MsgBox.Alert("提示","网络故障");

            }
        });

    };

    //修改专业信息
    function anymajoredit(obj)
    {
        //启动模态框
        $('#anymajoredit').modal({

        });
        actiontr=obj;
         oldyear=actiontr.parent().parent().parent("tr").children("td:eq(1)").html();
         oldname=actiontr.parent().parent().parent("tr").children("td:eq(2)").html();
        $("#anymajoredit .modal-body input:first").val(oldyear);
        $("#anymajoredit .modal-body input:eq(1)").val(oldname);
    };
    function majoredit()
    {
        var year=$("#anymajoredit .modal-body input:first").val();
        var name=$("#anymajoredit .modal-body input:eq(1)").val();
        //调用ajax方法
        $.post("/kmap/API/Major/editMajor.do",{"majoryear":year,"majorname":name,"oldyear":oldyear,"oldname":oldname},function(data,status){

            if(status=="success"){
                if(data.status==1){

                    alert(data.detail);
                    actiontr.parent().parent().parent("tr").children("td:eq(1)").html(year);
                    actiontr.parent().parent().parent("tr").children("td:eq(2)").html(name);
                }
                else
                {
                    alert(data.detail);
                }


            }else
            {

             alert("网络故障，请稍后再试！")

            }
        });

    }
</script>
<script>
function detailadd(index,name,year,info)
{

        var detailwid=$("#majortable thead:first tr th:first").css("width");
		var idwid=$("#majortable thead tr th:eq(1)").css("width");
		var namewid=$("#majortable thead tr th:eq(2)").css("width");
		var action=$("#majortable thead tr th:eq(3)").css("width");
		var html=[];
		var l=false;
		if(!l)
		{
		html.push('<table data-toggle='+'table'+'><tr><td style='+'width:'+detailwid+'></td><td style='+'width:'+idwid+'>'+year+'</td><td style='+'width:'+namewid+';'+'padding-left:15px'+'>'+name+'</td><td style='+'padding-left:15px'+'>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="edit ml10" href="javascript:void(0)" title="Edit" onclick="anymajoredit($(this))">'+'<i class="glyphicon glyphicon-edit"></i>'+'</a></span>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="remove ml10" href="javascript:void(0)" title="Remove" onclick="anymajorremove($(this))">'+'<i class="glyphicon glyphicon-remove"></i>'+'</a><span>'+'</td></tr></table>');
		}
		else
		{
		html.push('<tr><td style='+'width:'+detailwid+'></td><td style='+'width:'+idwid+'>'+year+'</td><td style='+'width:'+namewid+';'+'padding-left:15px'+'><td>'+name+'</td><td style='+'padding-left:15px'+'>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="edit ml10" href="javascript:void(0)" title="Edit" onclick="anymajoredit($(this))">'+'<i class="glyphicon glyphicon-edit"></i>'+'</a></span>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="remove ml10" href="javascript:void(0)" title="Remove" onclick="anymajorremove($(this))">'+'<i class="glyphicon glyphicon-remove"></i>'+'</a></span>'+'</td></tr>');
		}
		return html.join('');
}


function detailFormatter(index,row)
{
        var html=[];
		var j=0;
		var data;
		var tempdata;
		var l;
		var detailwid=$("#majortable thead:first tr th:first").css("width");
		var idwid=$("#majortable thead tr th:eq(1)").css("width");
		var namewid=$("#majortable thead tr th:eq(2)").css("width");
		var action=$("#majortable thead tr th:eq(3)").css("width");
		$.each(row, function (key, value) {
        // key等于majors
		if(key=="majors"){
		l=value.length;
		if(l==0)
		{
		html.push('<p>还没有专业！</p>');
		}
		if(l>1){
        for(j=0; j<=l-1;j++)
		{
		
		if(j==0)
		{
		html.push('<table data-toggle='+'table'+'><tr><td style='+'width:'+detailwid+'>'+value[j].id+'</td><td style='+'width:'+idwid+'>'+value[j].year+'</td><td style='+'width:'+namewid+'>'+value[j].name+'</td><td style='+'padding-left:0px'+'>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="edit ml10" href="javascript:void(0)" onclick="anymajoredit($(this))" title="Edit">'+'<i class="glyphicon glyphicon-edit"></i>'+'</a></span>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="remove ml10" href="javascript:void(0)" title="Remove" onclick="anymajorremove($(this))">'+'<i class="glyphicon glyphicon-remove"></i>'+'</a><span>'+'</td></tr>');
		}
		else if(j==l-1)
		{
		html.push('<tr><td style='+'width:'+detailwid+'>'+value[j].id+'</td><td style='+'width:'+idwid+'>'+value[j].year+'</td><td style='+'width:'+namewid+'>'+value[j].name+'</td><td style='+'padding-left:0px'+'>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="edit ml10" href="javascript:void(0)" onclick="anymajoredit($(this))" title="Edit">'+'<i class="glyphicon glyphicon-edit"></i>'+'</a></span>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="remove ml10" href="javascript:void(0)" title="Remove" onclick="anymajorremove($(this))">'+'<i class="glyphicon glyphicon-remove"></i>'+'</a></span>'+'</td></tr></table>');
		}
		else 
		{
		html.push('<tr><td style='+'width:'+detailwid+'>'+value[j].id+'</td><td style='+'width:'+idwid+'>'+value[j].year+'</td><td style='+'width:'+namewid+'>'+value[j].name+'</td><td style='+'padding-left:0px'+'>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="edit ml10" href="javascript:void(0)" onclick="anymajoredit($(this))" title="Edit">'+'<i class="glyphicon glyphicon-edit"></i>'+'</a></span>'+'<span style='+'width:15%;'+'display:inline-block>'+'<a class="remove ml10" href="javascript:void(0)" title="Remove" onclick="anymajorremove($(this))">'+'<i class="glyphicon glyphicon-remove"></i>'+'</a></span>'+'</td></tr>');
		}
		}
		}//l==1
		else if(l==1)
		{
		html.push('<table data-toggle='+'table'+'><tr><td style='+'width:'+detailwid+'>'+value[j].id+'</td><td style='+'width:'+idwid+'>'+value[j].year+'</td><td style='+'width:'+namewid+'>'+value[j].name+'</td><td>'+'<span style='+'width:10%;'+'display:inline-block>'+'<a class="edit ml10" href="javascript:void(0)"  onclick="anymajoredit($(this))" title="Edit">'+'<i class="glyphicon glyphicon-edit"></i>'+'</a></span>'+'<span style='+'width:10%;'+'display:inline-block>'+'<a class="remove ml10" href="javascript:void(0)" onclick="anymajorremove($(this))" title="Remove">'+'<i class="glyphicon glyphicon-remove"></i>'+'</a><span>'+'</td></tr></table>');
		}//l==1
		}
        });
		
		return html.join('');

}
</script>
</body>
</html>
