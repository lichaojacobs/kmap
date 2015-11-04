<%@ page import="org.andy.kmap.model.entity.LoginViewModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程计划添加</title>
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
var data1;
var samelevel;
var belongcollege;
var belongmajor;
var selectyear;
$(document).ready(function(){

$("#firstnext").click(function(){
if($('#select').length){
$("#firststep").addClass("change");
$("#secondstep").removeClass("vis");
$("#progressbar .progress-bar:eq(1)").removeClass("change");
samelevel=$('#select').attr('samelevel');
belongcollege=$('#select').attr('data-1');
belongmajor=$('#select').attr('data-2');
selectyear=$('#select').text();
samelevel=samelevel.split("/");
$('ul.dropdown-menu').children().remove();
$('#secondstep .point span:eq(1)').empty();
$('#thirdstep .point span:eq(1)').empty();
for(var i=0;i<=samelevel.length-2;i++){
$('ul.dropdown-menu').append('<li role="presentation"><a role="menuitem" tabindex="-1" href="#">'+samelevel[i]+'</a></li>');
};
$('#secondstep .point span:eq(1)').append(belongcollege+' · '+belongmajor+' · '+selectyear);
$('#thirdstep .point span:eq(1)').append(belongcollege+' · '+belongmajor+' · '+selectyear);
}
else
{
alert("请先选择年级");
}
});

$("#secondforward").click(function(){
$("#secondstep").addClass("vis");
$("#firststep").removeClass("change");
$("#progressbar .progress-bar:eq(1)").addClass("change");
$("#progressbar .progress-bar:eq(2)").addClass("change");
});

$("#secondnext").click(function(){
$("#progressbar .progress-bar:eq(2)").removeClass("change");
$("#relationtable").css("margin-top","-41px");
data1=$('#coursetable').bootstrapTable('getSelections');
var length=data1.length;
if(length>0)
{
//alert(length);
$("#secondstep").addClass("change");
$("#thirdstep").removeClass("vis");
$("#thirdstep .bootstrap-table .no-records-found").addClass("change");
var i=0;
var j=0;
for(i=0;i<=length-1;i++)
{
$("#thirdstep .bootstrap-table thead tr").append("<th data-text="+data1[i].coursename+" data-x="+i+" data-field="+i+"><div class="+"th-inner"+">"+data1[i].coursename+"</div><div class="+"fht-cell"+">"+"</div><div class="+"filterControl"+" style="+"margin:0px"+"2px"+"2px;"+"display:none;"+"><div style="+"height:34px;"+"></div></div></th>");

$("#thirdstep .bootstrap-table tbody").append("<tr><td data-text="+data1[i].coursename+" data-y="+i+" data-field="+"course"+" style="+"position:absolute;"+"background-color:rgb(245,"+"245,"+"245);"+">"+data1[i].coursename+"</td></tr>");

};

var len=$("#thirdstep .bootstrap-table tbody tr:eq(1) td:eq(0)").css("width");
//var len=$("#thirdstep .bootstrap-table thead tr:eq(1) th:eq(0)").css("width");
$("#thirdstep .bootstrap-table thead tr").prepend("<th data-field="+"course"+"><div class="+"th-inner"+">"+"课程"+"</div><div class="+"fht-cell"+"    style="+"width:"+len+">"+"</div><div class="+"filterControl"+" style="+"margin:0px"+"2px"+"2px;"+"display:none;"+"><div style="+"height:34px;"+"></div></div></th>");
//start
var coursewidth=$("#thirdstep .bootstrap-table .fixed-table-header thead tr:first th:first").css('width');
//alert(coursewidth);
var le=$("#thirdstep .bootstrap-table .fixed-table-body table tbody tr:not(.no-records-found)").length;
		var t=0;
		for(t=0;t<=le;t++){
		$('#thirdstep .bootstrap-table .fixed-table-body table tbody tr:eq('+t+') td:first-child').css('width',coursewidth);
		$('#thirdstep .bootstrap-table .fixed-table-body table tbody tr:eq('+t+') td:first-child').css('left','0px');
		$('#thirdstep .bootstrap-table .fixed-table-body table tbody tr:eq('+t+') td:first-child').css('overflow','auto');
		if(t==le)
		{
		$('#thirdstep .bootstrap-table .fixed-table-body table tbody tr:eq('+t+') td:first-child').css('padding-bottom','0px');}
		else
		{
		$('#thirdstep .bootstrap-table .fixed-table-body table tbody tr:eq('+t+') td:first-child').css('padding-bottom','1px');
		};
		}
//end


for(j=0;j<=length-1;j++)
{

var s=$("#thirdstep .bootstrap-table tbody tr").length;
//$('#thirdstep .bootstrap-table tbody tr').append("<td><input type="+"checkbox"+"></td>");
s=s/2;
for(var a=1;a<=s;a++)
{
$('#thirdstep .bootstrap-table tbody tr:eq('+a+')').append("<td data-y="+(a-1)+" data-x="+j+"><input type="+"checkbox"+"></td>");

};
};
$("#thirdstep .queryform").scroll(function(){
$("#thirdstep .fixed-table-header").css('top',$("#thirdstep .queryform").scrollTop()+'px');
$("#thirdstep .fixed-table-header").css('position','relative');
});
//checkbox点击事件
$('#thirdstep .bootstrap-table tbody tr input:checkbox').click(function(){
var init=$(this).prop('checked');
var initx=$(this).parent().attr('data-x');
var inity=$(this).parent().attr('data-y');
//alert($('#thirdstep .bootstrap-table tbody tr :checkbox[data-x='+inity+'][data-y='+initx+']').length);
$('#thirdstep .bootstrap-table tbody tr td[data-x='+inity+'][data-y='+initx+']').children(':checkbox').prop('checked',init);

});//点击事件
//定位行列事件
$('#thirdstep .bootstrap-table tbody tr td[data-x][data-y]').mouseover(function(){
//alert();
var x=$(this).attr('data-x');
var y=$(this).attr('data-y');
//alert(x);
$('#thirdstep .bootstrap-table thead th[data-x='+x+']').css('color','red');
$('#thirdstep .bootstrap-table tbody td[data-y='+y+']').css('color','red');
});
$('#thirdstep .bootstrap-table tbody tr td[data-x][data-y]').mouseout(function(){
//alert();
var x=$(this).attr('data-x');
var y=$(this).attr('data-y');
//alert(x);
$('#thirdstep .bootstrap-table thead th[data-x='+x+']').css('color','rgb(51, 51, 51)');
$('#thirdstep .bootstrap-table tbody td[data-y='+y+']').css('color','rgb(51, 51, 51)');
});
}
else
{
alert("请勾选课程");
}
});


$("#thirdforward").click(function(){
$("#progressbar .progress-bar:eq(2)").addClass("change");
$('#thirdstep .bootstrap-table thead tr th').remove();
$("#thirdstep .bootstrap-table tbody tr:not('.no-records-found')").remove();
$("#thirdstep").addClass("vis");
$("#secondstep").removeClass("change");
});

	});
</script>
<style>

</style>
</head>
<body>
<div class="container-fluid" id="container">
  <div class="row">
    <div class="title"><span><img src="images/logo1.png" /></span> <span>天津大学知识地图信息管理系统</span> </div>
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
      </div>
      <div class="row">
        <div class="col-md-10 col-md-offset-1" id="progressbar" style="margin-top:10px">
          <div class="progress">
            <div class="progress-bar progress-bar-success" style="width: 33%"> <span class="sr-only">①基本信息</span> </div>
            <div class="progress-bar progress-bar-warning change" style="width: 33%"> <span class="sr-only">②添加课程</span> </div>
            <div class="progress-bar progress-bar-danger change" style="width: 34%"> <span class="sr-only">③课程关系</span> </div>
          </div>
        </div>
        <div class="col-md-10 col-md-offset-1">
          <div class="newsearch">
            <form id="queryform" method="get" action="">
              <div id="firststep">
                <div class="querytip stepfirst" style="background-color:rgb(51, 153, 204)">①查询信息</div>
                <div class="queryform" style="margin-left: 80px; margin-top:-5px">
                  <div id="treeview1" class=""></div>
                </div>
                <div class="right" style="margin-right:63px">
                  <div class="btn-primary btn" id="firstnext">下一步</div>
                </div>
                <!--right-->
              </div>
              <!--first-->
              <div id="secondstep" class="vis">
                <div class="querytip stepfirst" style="background-color:rgb(51, 153, 204)">②添加课程</div>
                <div class="quickaddplan">
				<div class="point">
				<span class="glyphicon glyphicon-map-marker" style="color:red; font-size:16px; margin-right:3px"></span><span></span></div>
				<div style="margin-left:86%; display:inline-block">
                  <div class="dropdown">
                    <button type="button" class="btn btn-primary dropdown-toggle"  id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false" aria-haspopup="true">快捷添加课程计划 <span class="caret"></span> </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
					<!--
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
					  -->
                    </ul>
                  </div><!--dropdown-->
				  </div>
                </div><!--quickaddplan-->
                <div class="queryform" style="margin-left: 80px">
                  <!--start of table-->
                  <table data-toggle="table" id="coursetable" data-url="/kmap/admin/data2.json" data-cache="false" data-height="450" data-click-to-select="true">
                    <thead>
                      <tr>
                        <th data-field="courseid">课程编号</th>
                        <th data-field="coursename">课程名称</th>
                        <th data-field="credit">学分</th>
                        <th data-field="category">类别</th>
                        <th data-field="choose" data-checkbox="true" data-title="是否选择"><span>是否选择</span></th>
                      </tr>
                    </thead>
                  </table>
                  <!--end of table-->
                  <div class="right">
                    <div class="btn-primary btn" id="secondforward">上一步</div>
                    <div class="btn-primary btn" id="secondnext">下一步</div>
                  </div>
                  <!--right-->
                </div>
              </div>
              <!--second-->
              <div id="thirdstep" class="vis">
                <div class="querytip stepfirst" style="background-color:rgb(51, 153, 204)">③课程关系</div>
				<div class="quickaddplan">
				<div class="point">
				<span class="glyphicon glyphicon-map-marker" style="color:red; font-size:16px; margin-right:3px"></span><span></span></div>
				<div style="margin-left:86%; display:inline-block">
                  <div class="dropdown">
                    <button type="button" class="btn btn-primary dropdown-toggle"  id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false" aria-haspopup="true">快捷添加课程计划 <span class="caret"></span> </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
					<!--
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
					  -->
                    </ul>
                  </div><!--dropdown-->
				  </div>
                </div><!--quickaddplan-->
                <div class="queryform" style="margin-left: 80px; height:460px">
                  <!--start of table-->
                  <table data-toggle="table" id="relationtable"  data-cache="false"  data-height="auto" data-click-to-select="true">
                    <thead>
                      <!--
                        <th data-field="course">课程</th>
						-->
                      <!--
                        <th data-field="courseone">数据结构</th>
                        <th data-field="coursetwo">数据库原理</th>
						-->
                    </thead>
                    <tbody>
                      <!--
                      <tr>
                        <td>数据结构</td>
                        <td><input type="checkbox" checked="checked" disabled="disabled" /></td>
                        <td><input type="checkbox" /></td>
                      </tr>
                      <tr>
                        <td>数据库原理</td>
                        <td><input type="checkbox"/></td>
                        <td><input type="checkbox" checked="checked" disabled="disabled" /></td>
                      </tr>
					  -->
                    </tbody>
                  </table>
                  <!--end of table-->
                </div>
                <div class="right" style="margin-right:63px">
                  <div class="btn-primary btn" id="thirdforward">上一步</div>
                  <button class="btn-primary btn" type="submit">提交</button>
                </div>
                <!--right-->
              </div>
            </form>
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
<script type="text/javascript">
$(function(){

    var data1=[
    {
        "id": 0,
        "name": "Item 0",
        "price": "$0"
    },
    {
        "id": 1,
        "name": "Item 1",
        "price": "$1"
    },
    {
        "id": 2,
        "name": "Item 2",
        "price": "$2"
    },
    {
        "id": 3,
        "name": "Item 3",
        "price": "$3"
    },
    {
        "id": 4,
        "name": "Item 4",
        "price": "$4"
    },
    {
        "id": 5,
        "name": "Item 5",
        "price": "$5"
    },
    {
        "id": 6,
        "name": "Item 6",
        "price": "$6"
    },
    {
        "id": 7,
        "name": "Item 7",
        "price": "$7"
    },
    {
        "id": 8,
        "name": "Item 8",
        "price": "$8"
    },
    {
        "id": 9,
        "name": "Item 9",
        "price": "$9"
    },
    {
        "id": 10,
        "name": "Item 10",
        "price": "$10"
    },
    {
        "id": 11,
        "name": "Item 11",
        "price": "$11"
    },
    {
        "id": 12,
        "name": "Item 12",
        "price": "$12"
    },
    {
        "id": 13,
        "name": "Item 13",
        "price": "$13"
    },
    {
        "id": 14,
        "name": "Item 14",
        "price": "$14"
    },
    {
        "id": 15,
        "name": "Item 15",
        "price": "$15"
    },
    {
        "id": 16,
        "name": "Item 16",
        "price": "$16"
    },
    {
        "id": 17,
        "name": "Item 17",
        "price": "$17"
    },
    {
        "id": 18,
        "name": "Item 18",
        "price": "$18"
    },
    {
        "id": 19,
        "name": "Item 19",
        "price": "$19"
    },
    {
        "id": 20,
        "name": "Item 20",
        "price": "$20"
    }
];
    var defaultData = [
	          {id:'1001',
	            text: '管理与经济学部',
	            href: '#parent1',
	            tags: ['4'],
				selectable:false,
	            nodes: [
	              { id:'20001',
	                text: '工商管理',
	                href: '#child1',
	                tags: ['2'],
					selectable:false,
	                nodes: [
	                  {
	                    text: '2014',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
	                  {
	                    text: '2013',
	                    href: '#grandchild2',
	                    tags: ['0']
	                  },
					  {
	                    text: '2012',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
					  {
	                    text: '2011',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  }
	                ]
	              },
				  <!--major-->
				   {
	                text: '财务管理',
	                href: '#child2',
	                tags: ['2'],
					selectable:false,
	                nodes: [
	                  {
	                    text: '2014',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
	                  {
	                    text: '2013',
	                    href: '#grandchild2',
	                    tags: ['0']
	                  },
					  {
	                    text: '2012',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
					  {
	                    text: '2011',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  }
	                ]
	              },
				  <!--major-->
				   {
	                text: '物流工程',
	                href: '#child3',
	                tags: ['2'],
					selectable:false,
	                nodes: [
	                  {
	                    text: '2014',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
	                  {
	                    text: '2013',
	                    href: '#grandchild2',
	                    tags: ['0']
	                  },
					  {
	                    text: '2012',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
					  {
	                    text: '2011',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  }
	                ]
	              },
				  <!--major-->
	              {
	                text: '信息管理与信息系统',
	                href: '#child4',
	                tags: ['0'],
					selectable:false,
					nodes: [
	                  {
	                    text: '2014',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
	                  {
	                    text: '2013',
	                    href: '#grandchild2',
	                    tags: ['0']
	                  },
					  {
	                    text: '2012',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
					  {
	                    text: '2011',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  }
	                ]
					
	              }
	            ]
	          },
	          {
	            text: '材料学院',
	            href: '#parent2',
	            tags: ['0'],
				selectable:false,
				 nodes: [
	              {
	                text: '工商管理',
	                href: '#child1',
	                tags: ['2'],
					selectable:false,
	                nodes: [
	                  {
	                    text: '2014',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
	                  {
	                    text: '2013',
	                    href: '#grandchild2',
	                    tags: ['0']
	                  },
					  {
	                    text: '2012',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
					  {
	                    text: '2011',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  }
	                ]
	              },
				  <!--major-->
				   {
	                text: '财务管理',
	                href: '#child2',
	                tags: ['2'],
					selectable:false,
	                nodes: [
	                  {
	                    text: '2014',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
	                  {
	                    text: '2013',
	                    href: '#grandchild2',
	                    tags: ['0']
	                  },
					  {
	                    text: '2012',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
					  {
	                    text: '2011',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  }
	                ]
	              },
				  <!--major-->
				   {
	                text: '物流工程',
	                href: '#child3',
	                tags: ['2'],
					selectable:false,
	                nodes: [
	                  {
	                    text: '2014',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
	                  {
	                    text: '2013',
	                    href: '#grandchild2',
	                    tags: ['0']
	                  },
					  {
	                    text: '2012',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
					  {
	                    text: '2011',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  }
	                ]
	              },
				  <!--major-->
	              {
	                text: '信息管理与信息系统',
	                href: '#child4',
	                tags: ['0'],
					selectable:false,
					nodes: [
	                  {
	                    text: '2014',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
	                  {
	                    text: '2013',
	                    href: '#grandchild2',
	                    tags: ['0']
	                  },
					  {
	                    text: '2012',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  },
					  {
	                    text: '2011',
	                    href: '#grandchild1',
	                    tags: ['0']
	                  }
	                ]
					
	              }
	            ]
				
	          },
	          {
	            text: '建工学院',
	            href: '#parent3',
	             tags: ['0'],
				 selectable:false
	          },
	          {
	            text: '建筑学院',
	            href: '#parent4',
	            tags: ['0'],
				selectable:false
	          },
	          {
	            text: '精仪学院',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '马克思主义学院',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '自动化学院',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '文法学院',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '机械学院',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '信息学院',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '化工学院',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '求是学部',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '理学院',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '教育学部',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '药学院',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '环境学院',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '计算机学院',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '软件学院',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          },
			  {
	            text: '生命科学学院',
	            href: '#parent5'  ,
	            tags: ['0'],
				selectable:false
	          }
	        ];
    $('#treeview1').treeview({
			  levels:1,
	          data: defaultData

	        });
});
</script>
</body>
</html>
