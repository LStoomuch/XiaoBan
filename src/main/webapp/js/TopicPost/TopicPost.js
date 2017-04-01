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
    $.ajax({
       async:true,
        url:"/BoardManage/board/Post?currentPage="+currentPage,
        type:"post",
        data:formData,
        dataType:"json",
        success:function (data) {debugger
            showAllPost(data.currentPage);
        },
        error:function () {debugger

        }
    });
}