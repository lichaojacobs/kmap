<%@ page import="org.andy.kmap.model.entity.LoginViewModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>知识点添加</title>
    <link rel="stylesheet" href="/kmap/admin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/kmap/admin/css/bootstrap-spinner.css">
    <link rel="stylesheet" href="/kmap/admin/css/style-main.css">
    <link rel="stylesheet" href="/kmap/admin/css/bootstrap-treeview.css">
    <link rel="stylesheet" href="/kmap/admin/css/bootstrap-table.min.css">
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
//belongmajor=$('#select').attr('data-2');
selectyear=$('#select').text();
samelevel=samelevel.split("/");
$('ul.dropdown-menu').children().remove();
$('#secondstep .point span:eq(1)').empty();
$('#thirdstep .point span:eq(1)').empty();
for(var i=0;i<=samelevel.length-2;i++){
$('ul.dropdown-menu').append('<li role="presentation"><a role="menuitem" tabindex="-1" href="#">'+samelevel[i]+'</a></li>');
};
$('#secondstep .point span:eq(1)').append(belongcollege+' · '+selectyear);
$('#thirdstep .point span:eq(1)').append(belongcollege+' · '+selectyear);
}
else
{
alert("请先选择课程！");
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
data1=$('#pointname').val().length&&$('#pointdescription').val().length;
var length=data1;
if(length)
{
//alert(length);
$("#secondstep").addClass("change");
$("#thirdstep").removeClass("vis");
$("#pointnameun").val($("#pointname").val());

}
else
{
alert("请填写知识点信息！");
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
        <div class="flagword">您现在所在的位置：课程信息 》课程计划查看</div>
      </div>
      <div class="row">
        <div class="col-md-10 col-md-offset-1" id="progressbar" style="margin-top:10px">
          <div class="progress">
            <div class="progress-bar progress-bar-success" style="width: 33%"> <span class="sr-only">①选择所属课程</span> </div>
            <div class="progress-bar progress-bar-warning change" style="width: 33%"> <span class="sr-only">②添加知识点信息</span> </div>
            <div class="progress-bar progress-bar-danger change" style="width: 34%"> <span class="sr-only">③添加知识点关系</span> </div>
          </div>
        </div>
        <div class="col-md-10 col-md-offset-1">
          <div class="newsearch">
            <form id="queryform" method="get" action="">
              <div id="firststep">
                <div class="querytip stepfirst" style="background-color:rgb(51, 153, 204)">①课程信息</div>
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
                <div class="querytip stepfirst" style="background-color:rgb(51, 153, 204)">②知识点信息</div>
                <div class="quickaddplan">
                  <div class="point" style="margin-bottom:0px; margin-left:10px"> <span class="glyphicon glyphicon-map-marker" style="color:red; font-size:16px; margin-right:3px"></span><span></span></div>
                  
                </div>
                <!--quickaddplan-->
                <div class="queryform" style="margin-left: 80px">
                  <!--start of point-->
				  <div class="row" style="margin-right:0px">
				  <div class="col-md-offset-1 col-md-10">
				  <div class="pointspace">
                  <label for="pointname">知识点名称</label>
				  <input type="text" id="pointname" name="pointname" class="form-control" style="display:inline-block; width:85%" /></div>
				  <div class="pointspace">
				  <label for="pointdescription" style="position:relative; top:-120px;">知识点描述</label>
				  <textarea class="form-control" id="pointdescription" name="pointdescription" style="display:inline-block; width:85%; height:250px; resize: none;"></textarea>
				  </div><!--pointspace-->
				  </div><!--col-->
				  </div>
                  <!--end of point-->
                  <div class="right">
                    <div class="btn-primary btn" id="secondforward">上一步</div>
                    <div class="btn-primary btn" id="secondnext">下一步</div>
                  </div>
                  <!--right-->
                </div>
              </div>
              <!--second-->
              <div id="thirdstep" class="vis">
                <div class="querytip stepfirst" style="background-color:rgb(51, 153, 204)">③知识点关系</div>
                <div class="quickaddplan">
                  <div class="point" style="margin-bottom:0px; margin-left:10px"> <span class="glyphicon glyphicon-map-marker" style="color:red; font-size:16px; margin-right:3px"></span><span></span></div>       
                  
				  
                </div>
                <!--quickaddplan-->
                <div class="queryform" style="margin-left: 80px; height:460px">
                  <!--start of relation-->
                  <div class="row" style="margin-right:0px">
				  <div class="col-md-offset-1 col-md-10">
				  <div class="pointspace">
                  <label for="pointnameun">知识点名称</label>
				  <input type="text" id="pointnameun" name="pointnameun" class="form-control" disabled="disabled" style="display:inline-block; width:60%; margin-left:16px" /></div>
				  <div class="pointspace">
				  <label for="pointforward">前序知识点</label>
				  <select id="pointforward" style="width:60%" name="pointforward" class="drop">
				  <option value="2010">2010</option>
				  <option value="2011">2011</option>
				  <option value="2012">2012</option>
				  <option value="2013">2013</option>
				  <option value="2014">2014</option>
				  <option value="2015">2015</option>
				  <option value="2016">2016</option>
				  <option value="2017">2017</option>
				  <option value="2018">2018</option>
				</select>
				  </div><!--pointspace-->
				  <div class="pointspace">
				  <label for="pointbehind">后序知识点</label>
				  <select id="pointbehind" style="width:60%" name="pointbehind" class="drop">
				  <option value="2010">2010</option>
				  <option value="2011">2011</option>
				  <option value="2012">2012</option>
				  <option value="2013">2013</option>
				  <option value="2014">2014</option>
				  <option value="2015">2015</option>
				  <option value="2016">2016</option>
				  <option value="2017">2017</option>
				  <option value="2018">2018</option>
				</select>
				  </div><!--pointspace-->
				  </div><!--col-->
				  </div>
                  <!--end of relation-->
				  <div class="right" style="margin-right:63px">
                  <div class="btn-primary btn" id="thirdforward">上一步</div>
                  <button class="btn-primary btn" type="submit">提交</button>
                </div>
                <!--right-->
                </div>
                
				
				
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
	                text: '数据结构',
	                href: '#child1',
	                tags: ['2'],
					selectable:true
	              },
				  <!--major-->
				   {
	                text: '管理学',
	                href: '#child2',
	                tags: ['2'],
					selectable:true
	              },
				  <!--major-->
				   {
	                text: '应用统计学',
	                href: '#child3',
	                tags: ['2'],
					selectable:true
	              },
				  <!--major-->
	              {
	                text: '运筹学',
	                href: '#child4',
	                tags: ['0'],
					selectable:true
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
	                text: '数据结构',
	                href: '#child1',
	                tags: ['2'],
					selectable:true
	              },
				  <!--major-->
				   {
	                text: '运筹学',
	                href: '#child2',
	                tags: ['2'],
					selectable:true
	              },
				  <!--major-->
				   {
	                text: '电子商务概论',
	                href: '#child3',
	                tags: ['2'],
					selectable:true
	              },
				  <!--major-->
	              {
	                text: '工程经济学',
	                href: '#child4',
	                tags: ['0'],
					selectable:true
					
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
