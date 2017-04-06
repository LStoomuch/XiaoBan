/**
 * Created by liaosheng on 2017/4/6.
 */
$(document).ready(function () {
    showManagePage();
});
function showManagePage() {debugger
    showTopPage();
    showleftPage();
    manageDefaultPage();
}
function manageDefaultPage() {
    var url_showDefulPage = getContextPath()+"/ForumManage/manageDefaultPage";
    $.ajax({
        async:true,
        url:url_showDefulPage,
        type:"get",
        success:function (html) {
            $("#managerContainer").html(html);
        }
    });
}
function showleftPage() {
    var url_showleftPage = getContextPath()+"/ForumManage/manageLeftPage";
    $.ajax({
        async:true,
        url:url_showleftPage,
        type:"get",
        success:function (html) {
            $("#leftContainer").html(html);
        }
    });
}
function showBoardManage() {
    var url_managerContainer = getContextPath()+"/ForumManage/boardManage";
    $.ajax({
        async:true,
        url:url_managerContainer,
        type:"get",
        success:function (html) {
            $("#managerContainer").html(html);
        }
    });
}