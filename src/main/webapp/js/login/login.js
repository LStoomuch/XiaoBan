/**
 * Created by liaosheng on 2017/3/21.
 */

$(document).ready(function () {
    $("#loginButton").click(function () {
        login();
    });
    $('#loginForm').keydown(function(e){
        if(e.keyCode==13){
            login();
        }
    });

    $("#password").click(function (e) {
        $("#allContainer").css({
                "background-image": "url(../../images/inputPassword.jpg)"
                // "background-size":"cover"
            }
        );
        // $("#allContainer").css(
        //     "background","#fff"
        // )
        $(document).one("click",function () {
            if($(this).id!="allContainer") {
                $("#allContainer").css(
                    "background", "#fff"
                );
            }
        });
        e.stopPropagation();
    });


});
function login(){

    var url = getContextPath()+'/login/doLogin';
    var formData = $("#loginForm").serializeArray();
    var loginFlag = 1;
    $.ajax({
        async:false,
        url:url,
        type:"post",
        data:formData,
        dataType:"json",
        success:function (data) {
            if (data.stat==0){
                Messenger().post({
                    message: data.errorMsg,
                    type: "error"
                });
            }else if(data.stat==1) {
                Messenger().post({
                    message: "登陆成功！",
                    type: "success"
                });
                layer.msg('登陆成功!', {time: 3000, icon:6},function () {debugger
                    if (data.toURL != null) {
                        document.location.href = data.toURL;
                    }else{
                        document.location.href = getContextPath() + "/homepage";
                    }

                });
            }
        },
        error:function () {
            Messenger().post({
                message: "服务器异常！",
                type: "error"
            });
        }
    });
}
function getContextPath() {
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPatht = curWwwPath.substring(0,pos);
    var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1)
    return (localhostPatht);
}

