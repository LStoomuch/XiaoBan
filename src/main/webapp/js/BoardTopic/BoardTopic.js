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
function addTopic() {debugger
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
        url : "/BoardManage//board/topic",
        dataType:"json",
        success:function (data) {

        },
        error:function (data) {

        }
    });
}