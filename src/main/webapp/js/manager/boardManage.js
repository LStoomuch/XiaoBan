/**
 * Created by liaosheng on 2017/4/7.
 */
function addBoard(type) {debugger
    var formData = $("#addBoardForm").serializeArray();
    var url = "/ForumManage/forum/Board?type="+type;
    $.ajax({
        async:true,
        url:url,
        data:formData,
        type:"post",
        dataType:"json",
        beforeSend: function () {
            //3.让提交按钮失效，以实现防止按钮重复点击
            $("#addBoardButton").attr('disabled', 'disabled');
            $("#addBoardButton2").attr('disabled', 'disabled');
            //4.给用户提供友好状态提示
            $("#addBoardButton").text('已提交');
            $("#addBoardButton2").text('已提交');
        },
        success:function (data) {
            if(data.msg!=null){
                layer.alert(data.msg);
                if (data.msg=="新增失败"||data.msg=="修改失败"){
                    $("#addBoardButton").removeAttr('disabled');
                    $("#addBoardButton2").removeAttr('disabled');
                    $("#addBoardButton").text('修改');
                    $("#addBoardButton2").text('新增');
                }
            }
            window.parent.showBoardManage();
        }
    })
}