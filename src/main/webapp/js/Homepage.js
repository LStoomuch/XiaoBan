/**
 * Created by liaos on 2016/11/6.
 */

// $(document).ready(function() {debugger
//      $("#idInput").blur(function () {debugger
//           checkId($("#idInput").val());
//      });
// });

function getContextPath() {
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPatht = curWwwPath.substring(0,pos);
    var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1)
    return (localhostPatht);
}
function toLogin() {
    window.location.href="homepage/toLogin";
}
function jumpToRegister(){
     // document.location.href="homepage/toRegister";
    window.location.href="homepage/toRegister";
}
function doLogout() {
    var url = getContextPath()+"/login/doLogout";
    $.ajax({
        async:true,
        url:url,
        type:"get",
    });
}
$(document).ready(function () {debugger
    var url = getContextPath()+"/BoardManage/showAllBoard"
    $.ajax({
        async:true,
        url:url,
        type:"get",
        success:function (html) {
            $("#container2").html(html);
        }
    })
})

