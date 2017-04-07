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
/**
 * 显示管理员默认页面
 */
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
/**
 * 显示左侧菜单树
 */
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
/**
 * 显示版块管理页面
 * @param pageNo
 */
function showBoardManage(pageNo) {
    if (pageNo!=null){
        var url_managerContainer = getContextPath()+"/ForumManage/boardManage?pageNo="+pageNo;

    }else if (pageNo==null){
        var url_managerContainer = getContextPath()+"/ForumManage/boardManage";
    }
    $.ajax({
        async:true,
        url:url_managerContainer,
        type:"get",
        success:function (html) {
            $("#managerContainer").html(html);
        }
    });
}
/**
 * 获取多选框选中的IDs
 * @returns {*}
 */
function getSelectedIds(){
    var selectBoxs = document.all("selectIds");
    if(!selectBoxs) {
        return null;
    }
    if(typeof(selectBoxs.length) == "undefined" && selectBoxs.checked){
        return selectBoxs.value;
    }else{//many checkbox ,so is a array
        var ids = "";
        var split = ""
        for(var i = 0 ; i < selectBoxs.length ; i++){
            if(selectBoxs[i].checked){
                ids += split+selectBoxs[i].value;
                split = ",";
            }
        }
        return ids;
    }
}
/**
 * 单个删除版块
 * @param boardId
 * @param pageNo
 */
function deleteBoard(boardId,pageNo) {
    var url = getContextPath()+"/BoardManage/board/Boards/"+boardId;
    $.ajax({
        async:true,
        type:"delete",
        dataType:"json",
        url:url,
        success:function (data) {
            if(data.msg!=null){
                layer.alert(data.msg);
            }
            showBoardManage(pageNo);
        }
    });
}
/**
 * 批量删除版块
 */
function deleteSelectedBoards(pageNo){debugger
    var ids = getSelectedIds();
    if(ids == ""||ids==null){
        layer.tips("至少选中一个版块","#deleteBoards",{tips:2});
        return;
    }
    var url = getContextPath()+"/BoardManage/board/Boards/"+ids;
    $.ajax({
        async:true,
        type:"delete",
        dataType:"json",
        url:url,
        success:function (data) {
            if(data.msg!=null){
                layer.alert(data.msg);
            }
            showBoardManage(pageNo);
        }
    });
}
/**
 * 修改选中版块
 * @param boardId
 * @param pageNo
 */
function updateBoard(boardId,pageNo) {

}
/**
 * 新增版块
 */
function loadAddBoardPage() {
    layer.open({
        type:2,
        content:'/ForumManage/forum/addBoardPage',
        area: ['600px', '360px'],
        shadeClose: true //点击遮罩关闭
    });
}