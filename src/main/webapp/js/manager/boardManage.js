/**
 * Created by liaosheng on 2017/4/7.
 */
function addBoard() {
    var formData = $("#addBoardForm").serializeArray();
    var url = "/ForumManage/forum/Board";
    $.ajax({
        async:true,
        url:url,
        data:formData,
        type:"post",
        dataType:"json",
        beforeSend: function () {
            //3.让提交按钮失效，以实现防止按钮重复点击
            $("#addBoardButton").attr('disabled', 'disabled');

            //4.给用户提供友好状态提示
            $("#addBoardButton").text('已提交');
        },
        success:function (data) {
            if(data.msg!=null){
                layer.alert(data.msg);
            }
            window.parent.showBoardManage();
        }
    })
}