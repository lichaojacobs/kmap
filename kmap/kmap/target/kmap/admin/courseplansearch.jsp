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
</div>
<div class="row">
<div class="col-md-4 horizen">
<div class="search">
<div class="querytip" style="padding-left:40px; text-align:center">查询信息</div>
<div class="gosearch"><button type="button" class="btn btn-primary" style="padding-top:3px; padding-bottom:3px">检索</button></div>
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
<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="500">
    <thead>
        <tr>
            <th data-field="courseid">课程编号</th>
            <th data-field="coursename">课程名称</th>
            <th data-field="credit">学分</th>
			<th data-field="related">相关课程</th>
			<th data-field="institute">学院</th>
			<th data-field="major">专业</th>
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
	          {
	            text: '管理与经济学部',
	            href: '#parent1',
	            tags: ['4'],
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
				selectable:false,
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
