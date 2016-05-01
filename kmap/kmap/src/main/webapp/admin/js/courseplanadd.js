/**
 * Created by lichao on 16/4/30.
 */
$(document).ready(function(){
    $(".div2").click(function(){
        $(this).next("div").slideToggle("slow")
            .siblings(".div3:visible").slideUp("slow");
    });
});
var data1;
var samelevel;
var belongcollege;
var belongmajor;
var selectyear;
var winwidh=document.documentElement.clientWidth-100;
//创建第三步预览结果集
var map = [];
//预加载
$(document).ready(function(){
    //初始化下拉列表
    $.get("/kmap/API/CoursePlan/GetDropDownModel.do?type=1",null,function(data,status){
        $('#treeview1').treeview({
            levels:1,
            data: data
        });
    })
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

    // $button.click(function () {
    //     $table.bootstrapTable('refresh');
    // });

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

//第三阶段
var nodes=[];
var sys = arbor.ParticleSystem();
sys.d.nodes={};
sys.d.edges={};
sys.parameters({stiffness:900, repulsion:20000, gravity:true, dt:0.015,precision:0.8});
//预览生成的关系图
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
