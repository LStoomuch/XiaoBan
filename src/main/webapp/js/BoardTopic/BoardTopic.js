/**
 * Created by liaosheng on 2017/3/28.
 */
$(document).ready(function () {
    loadPage();
});
function loadPage() {
    showAllTopic();
    showTopPage();
}
function askForLogin() {
    layer.tips("请先登录", '#addTopicButton', {tips: 1});
}
function addTopic() {
    var formData = $("#addTopicForm").serializeArray();
    var currentPage = $("#currentPage").text();
    var topicTitle = $("#topicTitle").val();
    var postText = $("#postText").val();
    if(topicTitle==null||topicTitle=="") {
        layer.tips("帖子标题不能为空","#topicTitle",{tips:1});
        return;
    }
    if(topicTitle.length>30){
        layer.tips("帖子字数不能大于30字","#topicTitle",{tips:1});
        return;
    }
    if(postText==null||postText==""){
        layer.tips("帖子内容不能为空","#topicTitle",{tips:1});
        return;
    }
    if(postText.length>300){
        layer.tips("帖子内容长度不能大于300","#topicTitle",{tips:1});
        return;
    }
    $.ajax({
        async:true,
        data : formData,
        type : "post",
        url : "/BoardManage/board/topic",
        dataType:"json",
        beforeSend: function () {
            //3.让提交按钮失效，以实现防止按钮重复点击
            $("#addTopicButton").attr('disabled', 'disabled');

            //4.给用户提供友好状态提示
            $("#addTopicButton").text('提交中...');
        },
        complete: function () {
            //5.让登陆按钮重新有效
            $("#addTopicButton").removeAttr('disabled');
        },
        success:function (data) {
            showAllTopic(currentPage);
        },
        error:function (data) {

        }
    });
}