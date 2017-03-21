/**
 * Created by liaosheng on 2017/3/21.
 */

$(document).ready(function () {
    $("#loginButton").click(function () {
        var url = getContextPath()+'/login/doLogin'
        var formData = $("#loginForm").serializeArray();
        $.ajax({
           async:false,
            url:url,
            type:"post",
            data:formData,
            dataType:"json",
            success:function () {
                alert("login success");
            },
            error:function () {
                alert("login error");
            }
        });
    });
});
function getContextPath() {
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPatht = curWwwPath.substring(0,pos);
    var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1)
    return (localhostPatht);
}

