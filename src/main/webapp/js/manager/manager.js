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
 * 显示用户管理页面
 * @param pageNo
 */
function showUserManage(pageNo) {debugger
    if (pageNo!=null){
        var url_managerContainer = getContextPath()+"/ForumManage/userManagePage?pageNo="+pageNo;

    }else if (pageNo==null){
        var url_managerContainer = getContextPath()+"/ForumManage/userManagePage";
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
 * 加载增加板块页面
 */
function loadAddBoardPage(boardId) {
    if(boardId==null) {
        layer.open({
            type: 2,
            content: '/ForumManage/forum/BoardPage',
            area: ['600px', '360px'],
            shadeClose: true //点击遮罩关闭
        });
    }else{
        layer.open({
            type: 2,
            content: '/ForumManage/forum/BoardPage?boardId='+boardId,
            area: ['600px', '360px'],
            shadeClose: true //点击遮罩关闭
        });
    }
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
function deleteBoard(boardId,pageNo) {debugger
    layer.confirm('是否要删除此板块', {
        btn: ['是的','不删了'] //按钮
    }, function(){
        var url = getContextPath()+"/BoardManage/board/Boards/"+boardId;
        $.ajax({
            async:true,
            type:"delete",
            dataType:"json",
            url:url,
            success:function (data) {
                if(data.msg!=null){
                    layer.msg(data.msg, {
                        time: 2000, //2s后自动关闭
                    });
                }
                showBoardManage(pageNo);
            }
        });
    }, function(){
        layer.msg('取消删除', {
            time: 2000, //2s后自动关闭
        });
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
    layer.confirm('是否要删除此板块', {
        btn: ['是的','不删了'] //按钮
    }, function() {
        var url = getContextPath() + "/BoardManage/board/Boards/" + ids;
        $.ajax({
            async: true,
            type: "delete",
            dataType: "json",
            url: url,
            success: function (data) {
                if(data.msg!=null){
                    layer.msg(data.msg, {
                        time: 2000, //2s后自动关闭
                    });
                }
                showBoardManage(pageNo);
            }
        });
    }, function(){
        layer.msg('取消删除', {
            time: 2000, //2s后自动关闭
        });
    });
}
/**
 * 锁定用户
 * @param userId
 * @param pageNo
 */
function lockUser(userId, pageNo) {
    layer.confirm('是否要锁定该用户', {
        btn: ['是的','算了'] //按钮
    }, function() {
        var url = getContextPath() + "/ForumManage/forum/userLock/" + userId;
        $.ajax({
            async: true,
            type: "get",
            dataType: "json",
            url: url,
            success: function (data) {
                if(data.msg!=null){
                    layer.msg(data.msg, {
                        time: 2000, //2s后自动关闭
                    });
                }
                showUserManage(pageNo);
            }
        });
    }, function(){
        layer.msg('已取消', {
            time: 2000, //2s后自动关闭
        });
    });
}
/**
 * 解锁用户
 * @param userId
 * @param pageNo
 */
function unlockUser(userId, pageNo) {
    layer.confirm('是否要解锁', {
        btn: ['是的','算了'] //按钮
    }, function() {
        var url = getContextPath() + "/ForumManage/forum/userUnLock/" + userId;
        $.ajax({
            async: true,
            type: "get",
            dataType: "json",
            url: url,
            success: function (data) {debugger
                if(data.msg!=null){
                    layer.msg(data.msg, {
                        time: 2000, //2s后自动关闭
                    });
                }
                showUserManage(pageNo);
            }
        });
    }, function(){
        layer.msg('已取消', {
            time: 2000, //2s后自动关闭
        });
    });
}

function searchByUserName() {debugger
    var data = $("#userNameInput").val();
    if(data==null||data==""){
        layer.tips("搜索内容不能为空","#userNameInput",{tips:3});
        return;
    }
    var url = "/ForumManage/forum/users";
    $.ajax({
        async:true,
        url:url,
        type:"post",
        data:{"userName":data},
        success:function (html) {
            $("#managerContainer").html(html);
        },
        error:function () {
          layer.msg("服务出错");
        }
    });
}