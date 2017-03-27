/**
 * Created by liaosheng on 2017/3/14.
 */
var path = getContextPath();
$(document).ready(function () {
   $("input#passwordConfirm").blur(function () {
      if($("input#passwordConfirm").val()!=$("input#password").val()){
          // layer.msg('请确认密码', function(){
          //       $("input#passwordConfirm").focus();
          // });
          layer.tips('两次密码不相同，请确认一哈~', '#passwordConfirm',{tips:1});
      }
   });
    $("#registerButton").click(function () {
        if($("input#passwordConfirm").val()!=$("input#password").val()){
            layer.tips('两次密码不相同，请确认一哈~', '#passwordConfirm',{tips:1});
            return;
        }
        var formData = $("#registerForm").serializeArray();
        var path = getContextPath();
        $.ajax({
            async:true,
            type : "post",
            url : path+'/RegisterController/register',
            data:formData,
            dataType:"json",
            success:function (data) {debugger
                    if (data.errorMsg==1){
                        layer.tips('用户名已经存在，请选择其它的名字。', '#userName', {tips: 1});
                        return;
                    }
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
    $("#userName").blur(function () {
        var userName = $("#userName").val();
        if(userName!=null&&userName!="") {
            $.ajax({
                async: true,
                type: "post",
                url: path + '/RegisterController/check_userName',
                data: {"userName":userName},
                dataType: "json",
                success: function (data) {
                    if (data.Msg == 1) {
                        layer.tips('该账号已存在~', '#userName', {tips: 1});
                    }
                },
                error: function (data) {
                    if (data.Msg == 2){
                        layer.msg("服务异常");
                    }
                }
            });
        }
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