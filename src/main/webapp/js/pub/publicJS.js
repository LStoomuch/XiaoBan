/**
 * Created by liaosheng on 2017/3/28.
 */
function getContextPath() {
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPatht = curWwwPath.substring(0,pos);
    var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1)
    return (localhostPatht);
}
function toLogin() {debugger
    window.location.href=getContextPath()+"/homepage/toLogin";
}
function jumpToRegister(){
    // document.location.href="homepage/toRegister";
    window.location.href=getContextPath()+"/homepage/toRegister";
}
function doLogout() {
    var url = getContextPath()+"/login/doLogout";
    $.ajax({
        async:true,
        url:url,
        type:"get",
    });
}
function showTopPage() {
    var url_showTopPage = getContextPath()+"/homepage/showTopPage";
    $.ajax({
        async:true,
        url:url_showTopPage,
        type:"get",
        success:function (html) {
            $("#topPage").html(html);
        }
    });
}
function showAllBoard() {
    var url_showAllBoard = getContextPath()+"/BoardManage/showAllBoard";
    $.ajax({
        async:true,
        url:url_showAllBoard,
        type:"get",
        success:function (html) {
            $("#boardsContainer").html(html);
        }
    });
}
function showAllTopic() {
    var boardId = $("#boardId").val();
    var url_showAllTopic = getContextPath()+"/BoardManage/board/listBoardTopics-"+boardId;
    $.ajax({
        async:true,
        url:url_showAllTopic,
        type:"get",
        success:function (html) {
            $("#topicContainer").html(html);
        }
    });
}

