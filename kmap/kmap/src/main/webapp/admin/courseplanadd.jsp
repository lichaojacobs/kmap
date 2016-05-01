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
    <script src="/kmap/lib/arbor/arbor.js"></script>
    <script src="/kmap/lib/arbor/arbor-tween.js"></script>
    <script src="/kmap/lib/arbor/arbor-graphics.js"></script>
    <script src="/kmap/admin/js/coursePreview.js"></script>
    <script type="text/javascript" src="/kmap/admin/js/courseplanadd.js"></script>
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
</script>

</body>
</html>
