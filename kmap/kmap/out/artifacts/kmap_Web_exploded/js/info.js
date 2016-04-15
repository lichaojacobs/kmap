/**
 * Created by lichao on 16/4/14.
 */
var username=$("#username")[0].value;
var major=$("#major")[0].value;
var eid=$("#eid").value;
var epassword=$("#epassword").value;
//通过ajax获得
var majorId="";

var completeInfo ={
    init: function(){},
    submit:function(){
        username=$("#username")[0].value;
        major=majorId
        eid=$("#eid")[0].value;
        epassword=$("#epassword")[0].value;
        if(epassword.length<=6)
        {
            $.MsgBox.Alert("提示","密码长度小于6");
            return;
        }
        //ajax
        $.ajax({
            url: "/kmap/addUserInfo.do",
            data:{"username":username,"eid":eid,"epassword":epassword,"majorid":majorId},
            type: "POST",
            success:function(data,status){
                if(data.status==1){
                    //登录成功
                    $.MsgBox.Alert("提示",data.detail+"正在跳转...");
                    setInterval(function (){
                        location.href=data.redirectUrl;
                    },3000);

                }else{
                    $.MsgBox.Alert("信息更新失败",data.detail);
                }
            },
            error:function(data,status){
                $.MsgBox.Alert("提示","网络不通");
            }
        });

    }
}
completeInfo.init();

$(document).ready(function () {
    $('#myModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('whatever') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        $.get("/kmap/API/Major/GetMajors.do",null,function (data,status) {
            var majorinfo=document.getElementById("majorinfo");
            majorinfo.options.length=0;
            if(data!=null){
                for(var i=0;i<data.length;i++)
                {
                    majorinfo.add(new Option(data[i].year+"-"+data[i].name,data[i].id));
                }
            }
        })
    })
    //选择完专业
    $("#selectMajor").click(function () {
        majorId=$("#majorinfo").val();
        $("#major").val($("#majorinfo option:selected").text());
        //关掉模态框
        $("#myModal")[0].style.display="none";
        $("div.modal-backdrop").remove();
    })
    
})

