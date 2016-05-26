<%@ page import="org.andy.kmap.model.entity.LoginViewModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
        $(document).ready(function () {
            $(".div2").click(function () {
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
        var selectcourse;
        var selectcourseid;
        var previewdata;
        var pointdropdown;
        var winwidh = document.documentElement.clientWidth - 100;
        $(document).ready(function () {

            $("#firstnext").click(function () {
                if ($('#select').length) {
                    $("#firststep").addClass("change");
                    $("#thirdstep").removeClass("vis");
                    $("#progressbar .progress-bar:eq(1)").removeClass("change");
                    samelevel = $('#select').attr('samelevel');
                    belongcollege = $('#select').attr('data-1');
                    belongmajor = $('#select').attr('data-2');
                    selectyear = $('#select').attr('data-3');
                    selectcourse = $('#select').text();
                    samelevel = samelevel.split("/");
                    $('ul.dropdown-menu').children().remove();
                    $('#secondstep .point span:eq(1)').empty();
                    $('#thirdstep .point span:eq(1)').empty();
                    for (var i = 0; i <= samelevel.length - 2; i++) {
                        $('ul.dropdown-menu')
                                .append('<li role="presentation"><a role="menuitem" tabindex="-1" href="#">'
                                        + samelevel[i] + '</a></li>');
                    }
                    ;
                    $('#secondstep .point span:eq(1)')
                            .append(belongcollege + ' · ' + selectyear + ' · ' + selectcourse);
                    $('#thirdstep .point span:eq(1)')
                            .append(belongcollege + ' · ' + selectyear + ' · ' + selectcourse);

                    //加载知识点下拉列表
                    loadpointDropDown();
                }
                else {
                    alert("请先选择课程！");
                }
            });

            $("#secondnext").click(function () {
                $("#progressbar .progress-bar:eq(2)").removeClass("change");
                $("#relationtable").css("margin-top", "-41px");
                data1 = $('#pointname').val().length && $('#pointdescription').val().length;
                var length = data1;
                if (length) {
                    //alert(length);
                    //$("#secondstep").addClass("change");
                    //$("#thirdstep").removeClass("vis");
                    $("#pointnameun").val($("#pointname").val());
//    var pointforward =document.getElementById("pointforward");
//    //第一层知识点,冻结前序节点
//    $("#pointforward").attr("disabled","disabled");
                    var pointbehind = document.getElementById("pointbehind");
                    //加载下拉框数据
                    //初始化前序与后序知识点
                    $.ajax({
                               url: "/kmap/API/Point/GetPointSelectionsByLevel.do",
                               data: {"level": 1, "course": selectcourse, "academy": belongcollege},
                               contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                               dataType: "json",
                               type: "POST",
                               success: function (data, status) {
                                   if (data.pointForward != null || data.pointBehind != null) {
                                       //清空
                                       pointforward.options.length = 0;
                                       pointbehind.options.length = 0;
                                       pointbehind.add(new Option("无", 0));
                                       pointforward.add(new Option("无", 0));
                                       if (data.pointForward != null) {
                                           for (var i = 0; i < data.pointForward.length; i++) {
                                               pointforward.add(
                                                       new Option(data.pointForward[i].name, datapointForward[i].id));
                                           }
                                       }
                                       if (data.pointBehind != null) {
                                           for (var i = 0; i < data.pointBehind.length; i++) {
                                               pointbehind.add(
                                                       new Option(data.pointBehind[i].name, data.pointBehind[i].id));
                                           }
                                       }

                                   } else {
                                       pointforward.options.length = 0;
                                       pointbehind.options.length = 0;
                                       $.MsgBox.Alert("提示", "暂无该级别的知识点");
                                   }
                               }
                           });

                    /**
                     *可以考虑加载priviewdata
                     */
                    loadPreviewData();

                }
                else {
                    alert("请填写知识点信息!");
                }
            });

            $("#thirdforward").click(function () {
                $("#progressbar .progress-bar:eq(2)").addClass("change");
                $("#progressbar .progress-bar:eq(1)").addClass("change");
                $('#thirdstep .bootstrap-table thead tr th').remove();
                $("#thirdstep .bootstrap-table tbody tr:not('.no-records-found')").remove();
                $("#thirdstep").addClass("vis");
                $("#firststep").removeClass("change");
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
            <span><img src="/kmap/admin/images/logo1.png"/></span>
            <span>天津大学知识地图信息管理系统</span></div>
    </div>
    <div class="row" id="maincontent" style="height:80%">
        <!--start of nav-->
        <div class="col-md-2" style=" background-color: rgba(194, 190, 190, 0.3); height:100%">
            <div class="content">
                <div class="div1">
                    <div class="div2">
                        <div class="college"><span class="glyphicon glyphicon-user"></span></div>
                        学院信息
                    </div>
                    <div class="div3" id="collegeinfo">
                        <ul>
                            <li>
                                <div class="college"><span class="glyphicon glyphicon-plus"></span>
                                </div>
                                <a href="/kmap/API/Academy/Index.do"
                                   style="color:#337ab7">学院信息添加</a></li>
                            <li>
                                <div class="college"><span class="glyphicon glyphicon-plus"></span>
                                </div>
                                <a href="/kmap/API/Academy/addGradePage.do">年级信息添加</a></li>
                            <li>
                                <div class="college"><span class="glyphicon glyphicon-plus"></span>
                                </div>
                                <a href="/kmap/API/Major/Index.do">专业信息添加</a></li>
                        </ul>
                    </div>
                    <div class="div2">
                        <div class="college"><span class="glyphicon glyphicon-book"></span></div>
                        课程信息
                    </div>
                    <div class="div3">
                        <ul>
                            <li>
                                <div class="college"><span class="glyphicon glyphicon-plus"></span>
                                </div>
                                <a href="/kmap/API/Course/Index.do">专业课程添加</a></li>
                            <li>
                                <div class="college"><span
                                        class="glyphicon glyphicon-search"></span></div>
                                <a href="/kmap/API/Course/CoursePlanSearch.do">课程计划查看</a></li>
                            <li>
                                <div class="college"><span class="glyphicon glyphicon-plus"></span>
                                </div>
                                <a href="/kmap/API/Course/CoursePlanAdd.do">课程计划添加</a></li>
                            <li>
                                <div class="college"><span class="glyphicon glyphicon-plus"></span>
                                </div>
                                <a href="/kmap/API/Course/CourseKnowledgeAdd.do">课程知识添加</a></li>
                        </ul>
                    </div>

                </div>
                <div class="div1">
                    <div class="div2">
                        <div class="college"><span class="glyphicon glyphicon-book"></span></div>
                        知识点结构
                    </div>
                    <div id="point_tree_view" style="text-align: left"></div>
                </div>
            </div>

        </div>
        <!--end of nav-->
        <div class="col-md-10" style="height:100%">
            <div class="row navigation">
                <!--<div class="three"></div>-->
                <div class="flagword">您现在所在的位置：课程信息 》课程计划查看</div>
                <div class="login_info">
                    欢迎: <%=((LoginViewModel) request.getSession().getAttribute("userRole"))
                        .getUserName()%>
                    <a href="/kmap/quit.do">注销</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-10 col-md-offset-1" id="progressbar" style="margin-top:10px">
                    <div class="progress">
                        <div class="progress-bar progress-bar-success" style="width: 33%"><span
                                class="sr-only">①选择所属课程</span></div>
                        <div class="progress-bar progress-bar-warning change" style="width: 33%">
                            <span class="sr-only">②添加知识点信息</span></div>
                        <div class="progress-bar progress-bar-danger change" style="width: 34%">
                            <span class="sr-only">③添加知识点关系</span></div>
                    </div>
                </div>
                <div class="col-md-10 col-md-offset-1">
                    <div class="newsearch">
                        <div id="firststep">
                            <div class="querytip stepfirst"
                                 style="background-color:rgb(51, 153, 204)">①课程信息
                            </div>
                            <div class="queryform" style="margin-left: 80px; margin-top:-5px">
                                <div id="treeview1" class=""></div>
                            </div>
                            <div class="right" style="margin-right:63px">
                                <div class="btn-primary btn" id="firstnext">下一步</div>
                            </div>
                            <!--right-->
                        </div>
                        <!--third-->
                        <div id="thirdstep" class="vis">
                            <div class="querytip stepfirst"
                                 style="background-color:rgb(51, 153, 204)">③知识点关系
                            </div>
                            <div class="quickaddplan">
                                <div class="point" style="margin-bottom:0px; margin-left:10px"><span
                                        class="glyphicon glyphicon-map-marker"
                                        style="color:red; font-size:16px; margin-right:3px"></span><span></span>
                                </div>

                            </div>

                            <!--quickaddplan-->
                            <div class="queryform" style="margin-left: 80px; height:460px">

                                <!--start of relation-->
                                <div class="row" style="margin-right:0px">
                                    <!--start of point-->
                                    <div class="col-md-offset-1 col-md-10">
                                        <div class="pointspace">
                                            <label for="pointname">知识点名称</label>
                                            <input type="text" id="pointname" name="pointname"
                                                   class="form-control"
                                                   style="display:inline-block; width:60%"/></div>
                                        <div class="pointspace">
                                            <label for="pointdescription">知识点描述</label>
                                            <textarea class="form-control" id="pointdescription"
                                                      name="pointdescription"
                                                      style="display:inline-block; width:60%; height:50px; resize: none;"></textarea>
                                        </div><!--pointspace-->
                                    </div><!--col-->
                                    <div class="right" style="margin-right:63px">
                                        <div class="btn-primary btn" id="thirdforward">上一步</div>
                                        <div class="btn-primary btn" id="secondnext">确认</div>
                                    </div>
                                    <!--end of point-->
                                    <div class="col-md-offset-1 col-md-10">
                                        <div class="pointspace">
                                            <label for="pointnameun">知识点名称</label>
                                            <input type="text" id="pointnameun" name="pointnameun"
                                                   class="form-control" disabled="disabled"
                                                   style="display:inline-block; width:60%; margin-left:16px"/>
                                        </div>

                                        <div class="pointspace">
                                            <label for="pointlevel">知识点级别</label>
                                            <select id="pointlevel" style="width: 60%"
                                                    name="pointlevel" class="drop"
                                                    onchange="loadByLevel(this)">
                                                <option value="1">第一层</option>
                                                <option value="2">第二层</option>
                                                <option value="3">第三层</option>
                                                <option value="4">第四层</option>
                                            </select>
                                        </div>
                                        <div class="pointspace">
                                            <label for="pointforward">前序知识点</label>
                                            <select id="pointforward" style="width:60%"
                                                    name="pointforward" class="drop">
                                                <option value="0">无</option>
                                            </select>
                                        </div>
                                        <div class="pointspace">
                                            <label for="pointbehind">后序知识点</label>
                                            <select id="pointbehind" style="width:60%"
                                                    name="pointbehind" class="drop">
                                                <option value="0">无</option>
                                            </select>
                                        </div><!--pointspace-->
                                    </div><!--col-->
                                </div>
                                <!--end of relation-->
                                <div class="right" style="margin-right:63px">
                                    <button class="btn-primary btn" onclick="GenerateDetailView()">
                                        预览
                                    </button>
                                </div>
                                <!--right-->
                            </div>
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

<!--引入arobor绘图-->
<script src="/kmap/lib/arbor/arbor.js"></script>
<script src="/kmap/lib/arbor/arbor-tween.js"></script>
<script src="/kmap/lib/arbor/arbor-graphics.js"></script>
<script src="/kmap/admin/js/detailPreview.js"></script>

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
            GenerateView: function (title, callback, reloadCallback) {
                GenerateOverview(title);
                btnOk(callback);
                btnNo(reloadCallback);
            }
        }
        //生成Html
        var GenerateHtml = function (type, title, msg) {

            var _html = "";
            _html +=
                    '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + title
                    + '</span>';
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
            $("body").append(_html);
            GenerateCss();
        }
        //生成预览图
        var GenerateOverview = function (title) {
            var _html = "";
            _html +=
                    '<div id="mb_box"></div><div id="mb_overview"><span id="mb_tit">' + title
                    + '</span>';
            _html +=
                    '<a id="mb_ico">x</a><div><canvas id="sitemap" width="100%" height="500"></canvas></div><div id="mb_btnbox">';
            _html += '<input id="mb_btn_ok" type="button" value="加入图库" />';
            _html += '<input id="mb_btn_no" type="button" value="重新设定" />';
            _html += '</div></div>';
            //必须先将_html添加到body，再设置Css样式
            $("body").append(_html);
            GenerateOverviewCss();
        }
        var GenerateOverviewCss = function () {
            $("#mb_box").css({
                                 width: '100%',
                                 height: '100%',
                                 zIndex: '99999',
                                 position: 'fixed',
                                 filter: 'Alpha(opacity=60)',
                                 backgroundColor: 'black',
                                 top: '0',
                                 left: '0',
                                 opacity: '0.6'
                             });

            $("#mb_overview").css({
                                      width: winwidh,
                                      height: '700px',
                                      position: 'fixed',
                                      zIndex: '999999',
                                      backgroundColor: 'White',
                                      borderRadius: '15px'
                                  });
            $("#mb_tit").css({
                                 display: 'block',
                                 fontSize: '14px',
                                 color: '#444',
                                 padding: '10px 15px',
                                 backgroundColor: '#DDD',
                                 borderRadius: '15px 15px 0 0',
                                 borderBottom: '3px solid #009BFE',
                                 fontWeight: 'bold'
                             });
            $("#mb_msg").css({
                                 padding: '20px', lineHeight: '20px',
                                 borderBottom: '1px dashed #DDD', fontSize: '13px'
                             });

            $("#mb_ico").css({
                                 display: 'block',
                                 position: 'absolute',
                                 right: '10px',
                                 top: '9px',
                                 border: '1px solid Gray',
                                 width: '18px',
                                 height: '18px',
                                 textAlign: 'center',
                                 lineHeight: '16px',
                                 cursor: 'pointer',
                                 borderRadius: '12px',
                                 fontFamily: '微软雅黑'
                             });

            $("#mb_btnbox").css({margin: '15px 0 10px 0', textAlign: 'center'});
            $("#mb_btn_ok,#mb_btn_no")
                    .css({width: '85px', height: '30px', color: 'white', border: 'none'});
            $("#mb_btn_ok").css({backgroundColor: '#168bbb'});
            $("#mb_btn_no").css({backgroundColor: 'gray', marginLeft: '20px'});

            //右上角关闭按钮hover样式
            $("#mb_ico").hover(function () {
                $(this).css({backgroundColor: 'Red', color: 'White'});
            }, function () {
                $(this).css({backgroundColor: '#DDD', color: 'black'});
            });

            var _width = document.documentElement.clientWidth;  //屏幕宽
            var _height = document.documentElement.clientHeight; //屏幕高

            var overviewWidth = $("#mb_overview").width();
            var overviewHeight = $("#mb_overview").height();

            //让提示框居中
            $("#mb_overview").css({
                                      top: (_height - overviewHeight) / 2 + "px",
                                      left: (_width - overviewWidth) / 2 + "px"
                                  });
        }
        //生成Css
        var GenerateCss = function () {

            $("#mb_box").css({
                                 width: '100%',
                                 height: '100%',
                                 zIndex: '99999',
                                 position: 'fixed',
                                 filter: 'Alpha(opacity=60)',
                                 backgroundColor: 'black',
                                 top: '0',
                                 left: '0',
                                 opacity: '0.6'
                             });

            $("#mb_overview").css({
                                      width: '800px',
                                      height: '600px',
                                      position: 'fixed',
                                      zIndex: '999999',
                                      backgroundColor: 'White',
                                      borderRadius: '15px'
                                  });
            $("#mb_con").css({
                                 zIndex: '999999', width: '400px', position: 'fixed',
                                 backgroundColor: 'White', borderRadius: '15px'
                             });

            $("#mb_tit").css({
                                 display: 'block',
                                 fontSize: '14px',
                                 color: '#444',
                                 padding: '10px 15px',
                                 backgroundColor: '#DDD',
                                 borderRadius: '15px 15px 0 0',
                                 borderBottom: '3px solid #009BFE',
                                 fontWeight: 'bold'
                             });

            $("#mb_msg").css({
                                 padding: '20px', lineHeight: '20px',
                                 borderBottom: '1px dashed #DDD', fontSize: '13px'
                             });

            $("#mb_ico").css({
                                 display: 'block',
                                 position: 'absolute',
                                 right: '10px',
                                 top: '9px',
                                 border: '1px solid Gray',
                                 width: '18px',
                                 height: '18px',
                                 textAlign: 'center',
                                 lineHeight: '16px',
                                 cursor: 'pointer',
                                 borderRadius: '12px',
                                 fontFamily: '微软雅黑'
                             });

            $("#mb_btnbox").css({margin: '15px 0 10px 0', textAlign: 'center'});
            $("#mb_btn_ok,#mb_btn_no")
                    .css({width: '85px', height: '30px', color: 'white', border: 'none'});
            $("#mb_btn_ok").css({backgroundColor: '#168bbb'});
            $("#mb_btn_no").css({backgroundColor: 'gray', marginLeft: '20px'});

            //右上角关闭按钮hover样式
            $("#mb_ico").hover(function () {
                $(this).css({backgroundColor: 'Red', color: 'White'});
            }, function () {
                $(this).css({backgroundColor: '#DDD', color: 'black'});
            });

            var _widht = document.documentElement.clientWidth;  //屏幕宽
            var _height = document.documentElement.clientHeight; //屏幕高

            var boxWidth = $("#mb_con").width();
            var boxHeight = $("#mb_con").height();

            //让提示框居中
            $("#mb_con").css({
                                 top: (_height - boxHeight) / 2 + "px",
                                 left: (_widht - boxWidth) / 2 + "px"
                             });
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
        var btnNo = function (reloadCallback) {
            $("#mb_btn_no,#mb_ico").click(function () {
                $("#mb_box,#mb_con,#mb_overview").remove();
                if (typeof (reloadCallback) == 'function') {
                    reloadCallback();
                }
            });
        }
    })();
</script>

<!--添加知识点信息-->
<script type="text/javascript">
    var sys = arbor.ParticleSystem();
    sys.parameters({stiffness: 900, repulsion: 2000, gravity: true, dt: 0.015, precision: 0.8});
    function GenerateDetailView() {
        sys.parameters({stiffness: 900, repulsion: 2000, gravity: true, dt: 0.015, precision: 0.8});
        //初始化视图界面
        $.MsgBox.GenerateView("预览图", function () {
            AddToDatabase();
        }, function () {
            loadPreviewData();
        });
        //获得新知识点信息对预览数据进行修改
        var pointlevel = $("#pointlevel").val();
        var pointname = $('#pointname').val();
        var pointforward = $("#pointforward").find("option:selected").text();
        var pointbehind = $("#pointbehind").find("option:selected").text();
        //调用函数
        AddPreviewPoint(pointlevel, pointname, pointforward, pointbehind);
        sys.renderer = Renderer_out("#sitemap");
        var nodes = previewdata.nodes;
        $.each(nodes, function (name, info) {
            info.label = name;
        });
        sys.merge({nodes: nodes, edges: previewdata.edges});
    }
    function AddToDatabase() {
        var pointforward = $("#pointforward").val();
        var pointbehind = $("#pointbehind").val();
        var pointname = $('#pointname').val();
        var pointdescription = $('#pointdescription').val();
        //调用ajax函数
        $.ajax({
                   url: "/kmap/API/Point/AddPoint.do",
                   data: {
                       "course": selectcourse,
                       "pointname": pointname,
                       "pointdescription": pointdescription,
                       "pointforward": pointforward,
                       "pointbehind": pointbehind,
                       "academy": belongcollege
                   },
                   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                   dataType: "json",
                   type: "POST",
                   success: function (data, status) {
                       if (status == "success") {
                           if (data.status == 1) {

                               $.MsgBox.Alert("提示", data.detail);
                               //成功之后再次刷新
                               loadpointDropDown()
                           }
                           else {
                               $.MsgBox.Alert("提示", data.detail);
                           }
                       }
                       else {
                           $.MsgBox.Alert("提示", "网络不通");
                       }
                   }
               });
    }

    /**
     * 动态修改数据
     * @param pointlevel
     * @param pointname
     * @param pointforward
     * @param pointbehind
     * @constructor
     */
    function AddPreviewPoint(pointlevel, pointname, pointforward, pointbehind) {
        var temp;
        var tempbehind;
        //一些前置判断
        if (pointlevel == "1") {
            if (pointforward != "无")
                $.MsgBox.Alert("错误提示", "知识点层数选择有误!");
        }
        if (pointlevel != "1") {
            if (pointbehind == "无" && pointforward == "无")
                $.MsgBox.Alert("错误提示", "第一层以上知识点必有前后序!");
        }
        if (pointforward == "无" && pointbehind == "无") {
            temp = {id: 0, name: pointname}
            previewdata.nodes[pointname] = temp;
            previewdata.edges[selectcourse][pointname] = temp;
        }
        //中间层数的知识点
        if (pointforward != "无" && pointbehind != "无") {
            temp = {id: 0, name: pointname};
            tempbehind = {id: 0, name: pointbehind};
            previewdata.nodes[pointname] = temp;
            //前序
            previewdata.edges[pointforward] = {};
            previewdata.edges[pointforward][pointname] = temp;
            //删除原来的连接
            delete previewdata.edges[pointforward][pointbehind];
            //后序
            previewdata.edges[pointname] = {};
            previewdata.edges[pointname][pointbehind] = tempbehind;
        }
        //最后一层知识点
        if (pointforward != "无") {
            temp = {id: 0, name: pointname};
            tempbehind = {id: 0, name: pointbehind};
            previewdata.nodes[pointname] = temp;
            //前序
            previewdata.edges[pointforward] = {};
            previewdata.edges[pointforward][pointname] = temp;
        }
        if (pointbehind != "无") {
            temp = {id: 0, name: pointname};
            tempbehind = {id: 0, name: pointbehind};
            previewdata.nodes[pointname] = temp;
            //后序
            if (pointlevel == "1") {
                //删除原来的连接
                delete  previewdata.edges[selectcourse][pointbehind]
                //添加新的连接
                previewdata.edges[selectcourse][pointname] = temp;
            }
            previewdata.edges[pointname] = {};
            previewdata.edges[pointname][pointbehind] = tempbehind;
        }
    }
</script>

<!--初始化最初的课程下拉框-->
<script type="text/javascript">

    function loadPreviewData() {
        $.ajax({
                   url: "/kmap/detailData.do",
                   data: {"course": selectcourse, "academy": belongcollege},
                   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                   dataType: "json",
                   type: "POST",
                   success: function (data, status) {
                       if (status == "success") {
                           if (data != null) {
                               //赋值
                               previewdata = data;
                           }
                       }
                       else {
                           $.MsgBox.Alert("提示", "网络不通");
                       }
                   }
               });
    }
    <!--根据待知识点级别加载知识点-->
    function loadByLevel(obj) {
        var pointforward = document.getElementById("pointforward");
        var pointbehind = document.getElementById("pointbehind");
        var level = obj.value;
//        if(level==1)
//        {
//            $("#pointforward").attr("disabled","disabled");
//        }
//        else
//        {
//            $("#pointforward").removeAttr("disabled");
//        }
        //调用ajax函数
        $.ajax({
                   url: "/kmap/API/Point/GetPointSelectionsByLevel.do",
                   data: {"level": level, "course": selectcourse, "academy": belongcollege},
                   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                   dataType: "json",
                   type: "POST",
                   success: function (data, status) {
                       if (status == "success") {
                           if (data.pointForward != null || data.pointBehind != null) {
                               //清空
                               pointforward.options.length = 0;
                               pointbehind.options.length = 0;
                               pointbehind.add(new Option("无", 0));
                               pointforward.add(new Option("无", 0));
                               if (data.pointForward != null) {
                                   for (var i = 0; i < data.pointForward.length; i++) {
                                       pointforward.add(
                                               new Option(data.pointForward[i].name, data.pointForward[i].id));
                                   }
                               }
                               if (data.pointBehind != null) {
                                   for (var i = 0; i < data.pointBehind.length; i++) {
                                       pointbehind.add(
                                               new Option(data.pointBehind[i].name, data.pointBehind[i].id));
                                   }
                               }

                           } else {
                               pointforward.options.length = 0;
                               pointbehind.options.length = 0;
                               $.MsgBox.Alert("提示", "暂无该级别的知识点");
                           }
                       }
                       else {
                           $.MsgBox.Alert("提示", "网络不通");
                       }
                   }
               });
    }
    $(function () {
        //初始化下拉表
        //获取数据
        $.get("/kmap/API/CoursePlan/GetDropDownModel.do?type=0", null, function (data, status) {

            $('#treeview1').treeview({
                                         levels: 1,
                                         data: data
                                     });
        });

    });
    function loadpointDropDown() {
        /**
         * 加载知识点层级列表
         */
        $.ajax({
                   url: "/kmap/API/Point/GetPointDropDown.do",
                   data: {"course": selectcourse, "academy": belongcollege},
                   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                   dataType: "json",
                   type: "POST",
                   success: function (data, status) {
                       pointdropdown=data;
                       $('#point_tree_view').treeview({
                                                          levels: 1,
                                                          data: data
                                                      });
                   }
               });
    }

</script>
</body>
</html>
