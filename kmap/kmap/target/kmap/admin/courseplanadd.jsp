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
    <script src="/kmap/admin/js/hashmap.js"></script>

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
        var winwidh=document.documentElement.clientWidth-100;
        //创建第三步预览结果集
        var map = [];
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


//给data1赋值获取第二阶段选中的课程
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

//获取勾选的关系课程
                        //$('#thirdstep .bootstrap-table thead th[data-x='+initx+']').attr("data-text")	"高等数学2A"
                        //$('#thirdstep .bootstrap-table tbody tr td[data-y='+inity+']').attr("data-text") "高等数学2A"

//实现无向链接
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
                <div class="col-md-10 col-md-offset-1" id="progressbar" style="margin-top:10px">
                    <div class="progress">
                        <div class="progress-bar progress-bar-success" style="width: 33%"> <span class="sr-only">①基本信息</span> </div>
                        <div class="progress-bar progress-bar-warning change" style="width: 33%"> <span class="sr-only">②添加课程</span> </div>
                        <div class="progress-bar progress-bar-danger change" style="width: 34%"> <span class="sr-only">③课程关系</span> </div>
                    </div>
                </div>
                <div class="col-md-10 col-md-offset-1">
                    <div class="newsearch">


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
                                <table data-toggle="table"  data-toolbar="#get" id="coursetable" data-url="/kmap/API/CoursePlan/GetCoursesByAcademy.do" data-query-params="queryParams"  data-height="450" data-click-to-select="true">
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

                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>
                                <!--end of table-->
                            </div>
                            <div class="right" style="margin-right:63px">
                                <div class="btn-primary btn" id="thirdforward">上一步</div>
                                <button class="btn-primary btn" onclick="review()">预览</button>
                            </div>
                            <!--right-->
                        </div>
                        <!--third step-->
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

<%--<div>--%>
    <%--<canvas id="sitemap" width="800" height="400"></canvas>--%>
<%--</div>--%>

<!--引入arobor绘图-->
<script src="/kmap/lib/arbor/arbor.js"></script>
<script src="/kmap/lib/arbor/arbor-tween.js"></script>
<script src="/kmap/lib/arbor/arbor-graphics.js"></script>
<script src="/kmap/admin/js/coursePreview.js"></script>

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
            },
            GenerateView:function(title,callback){
                GenerateOverview(title);
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
        //生成预览图
        var GenerateOverview = function (title) {
            var _html = "";
            _html += '<div id="mb_box"></div><div id="mb_overview"><span id="mb_tit">' + title + '</span>';
            _html += '<a id="mb_ico">x</a><div><canvas id="sitemap" width="850" height="500"></canvas></div><div id="mb_btnbox">';
            _html+='<input id="mb_btn_ok" type="button" value="加入图库" />';
            _html+='<input id="mb_btn_no" type="button" value="重新设定" />';
            _html += '</div></div>';
            //必须先将_html添加到body，再设置Css样式
            $("body").append(_html); GenerateOverviewCss();
        }
        var GenerateOverviewCss=function(){
            $("#mb_box").css({
                width: '100%', height: '100%', zIndex: '99999', position: 'fixed',
                filter: 'Alpha(opacity=60)', backgroundColor: 'black', top: '0', left: '0', opacity: '0.6'
            });

            $("#mb_overview").css({
                width:winwidh,height:'700px',position: 'fixed',zIndex: '999999',
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

            var _width = document.documentElement.clientWidth;  //屏幕宽
            var _height = document.documentElement.clientHeight; //屏幕高

            var overviewWidth = $("#mb_overview").width();
            var overviewHeight = $("#mb_overview").height();

            //让提示框居中
            $("#mb_overview").css({ top: (_height - overviewHeight) / 2 + "px", left: (_width - overviewWidth) / 2 + "px" });
        }
        //生成Css
        var GenerateCss = function () {

            $("#mb_box").css({
                width: '100%', height: '100%', zIndex: '99999', position: 'fixed',
                filter: 'Alpha(opacity=60)', backgroundColor: 'black', top: '0', left: '0', opacity: '0.6'
            });

            $("#mb_overview").css({
                width:'800px',height:'600px',position: 'fixed',zIndex: '999999',
                backgroundColor: 'White', borderRadius: '15px'
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
                $("#mb_box,#mb_con,#mb_overview").remove();
                if (typeof (callback) == 'function') {
                    callback();
                }
            });
        }

        //取消按钮事件
        var btnNo = function () {
            $("#mb_btn_no,#mb_ico").click(function () {
                $("#mb_box,#mb_con,#mb_overview").remove();
            });
        }
    })();
</script>

<!--第三阶段-->
<script type="text/javascript">
    var nodes=[];
    var sys = arbor.ParticleSystem();
    sys.d.nodes={};
    sys.d.edges={};
    sys.parameters({stiffness:900, repulsion:20000, gravity:true, dt:0.015,precision:0.8});
    function review(){
        var len=data1.length;
        var i;
        var j;
        var k;
        var key;
        var value;
        var jsostr1;
        //初始化视图界面
        $.MsgBox.GenerateView("预览图",function(){
            GenerateData();
        });
        //构造预览视图
        for(i=0;i<=len-1;i++){
            for(j=0;j<=len-1;j++){
                key=$('#thirdstep .bootstrap-table thead th[data-x='+i+']').attr("data-text");
                value=$('#thirdstep .bootstrap-table tbody tr td[data-y='+j+']').attr("data-text");
                var isChecked=$('#thirdstep .bootstrap-table tbody tr td[data-x='+i+'][data-y='+j+']').children(':checkbox').prop('checked');
                //判断是否选中
                if(isChecked){
                    //添加入结果
                    map.push({head:key,tail:value});
                }
            }
            var m= sys.addNode(key,{label:key,color:'#b2b19d', shape:"dot", alpha:1,expanded:true});

            nodes.push(m);
        }
        //添加进edges
        for(i=0;i<nodes.length;i++) {
            for(j=0;j<map.length;j++)
            {
                if(nodes[i].data.label==map[j].head) {
                    for(k=0;k<nodes.length;k++)
                    {
                        if(map[j].tail==nodes[k].data.label)
                        {
                            sys.addEdge(nodes[i],nodes[k],{label:"demo"});
                        }
                    }
                }
            }
        }
        //alert(JSON.stringify(theUI));
        sys.renderer = Renderer_out("#sitemap");
        //sys.graft();

    }
    //生成选择关系图后要预览的数据
    function GenerateData(){
        map.push({"college":belongcollege,"major":belongmajor,"year":selectyear});
        //ajax函数
        $.ajax({
            url: "/kmap/API/CoursePlan/AddCoursePlan.do",
            data:{"CoursePlanMap":JSON.stringify(map)},
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType:"json",
            type: "POST",
            success:function(data,status){
                if(status=="success")
                {
                    if(data.status==1){
                        $.MsgBox.Alert("提示",data.detail);
                    }
                    else
                    {
                        $.MsgBox.Alert("提示",data.detail);
                    }
                }
                else
                {
                    $.MsgBox.Alert("提示","网络不通");
                }
            }
        });
    }
</script>

<script type="text/javascript">
    //get请求参数设置
    function queryParams(params) {
        params.academyname =belongcollege ; // add param1
        // console.log(JSON.stringify(params));
        // {"limit":10,"offset":0,"order":"asc","your_param1":1,"your_param2":2}
        return params;
    }
    //定义触发课程加载按钮
    var $table = $('#coursetable'),
            $button = $('#firstnext');

    $(function () {
        $button.click(function () {
            $table.bootstrapTable('refresh');
        });
    });
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
