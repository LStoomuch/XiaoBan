/**
 * Created by liaos on 2017/3/29.
 */
$(document).ready(function () {
    loadPage();
});

function loadPage() {
    showAllPost();
    showTopPage();
}

function askForLogin() {
    layer.tips("请先登录", '#addPostButton', {tips: 1});
}

function addPost() {debugger
    var formData = $("#addPostForm").serializeArray();
    var currentPage = $("#currentPage").text();
    var postText = $("#postText").val();
    if(postText==null||postText==""){
        layer.tips("回复内容不能为空","#postText",{tips:1});
        return;
    }
    if(postText.length>300){
        layer.tips("回复字数不能大于300","#postText",{tips:1});
        return;
    }
    $.ajax({
       async:true,
        url:"/BoardManage/board/Post",
        type:"post",
        data:formData,
        dataType:"json",
        success:function (data) {debugger
            if(data.msg!=null){
                layer.tips(data.msg,"#postText",{tips:1});
            }else {
                showAllPost(currentPage);
            }
        },
        error:function (data) {debugger

        }
    });
}
// function addPost2() {
//     var currentPage = $("#currentPage").text();
//     document.location.href="/BoardManage/board/Post?currentPage="+currentPage;
// }