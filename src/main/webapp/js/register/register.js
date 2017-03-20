/**
 * Created by liaosheng on 2017/3/14.
 */

$(document).ready(function () {
   $("input#passwordConfirm").blur(function () {
      if($("input#passwordConfirm").val()!=$("input#password").val()){
          layer.msg('请确认密码', function(){
                $("input#passwordConfirm").focus();
          });
      }
   });
    $("#registerButton").click(function () {
        var formData = $("#registerForm").serializeArray();
        var path = getContextPath();
        $.ajax({
            async:true,
            type : "post",
            url : path+'/RegisterController/register',
            data:formData,
            dataType:"json",
            success:function (data) {debugger

                    layer.alert('注册成功！见到你真的很高兴', {icon: 6},function () {
                        document.location.href="registerSuccess";
                    });
            },
            error:function (data) {debugger
                console.log(data.loginState);
                window.location="/homepage/registerError";
            }
        });
    });
});

function getContextPath() {debugger
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPatht = curWwwPath.substring(0,pos);
    var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1)
    return (localhostPatht);
}