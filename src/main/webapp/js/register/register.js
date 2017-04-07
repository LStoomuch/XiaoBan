/**
 * Created by liaosheng on 2017/3/14.
 */
var path = getContextPath();
$(document).ready(function () {
   $("input#passwordConfirm").blur(function () {
       checkPassword();
   });
    $("input#userName").blur(function () {
        var flag = checkUserName();
    });
    $("#registerButton").click(function () {
        var flag2 = checkPassword();
        if(flag2==1){
            register();
        }
    });
    $('#registerForm').keydown(function(e){debugger
        if(e.keyCode==13){
            if(checkPassword()==1)
            register();
        }
    });
});
function register() {
    var formData = $("#registerForm").serializeArray();
    var path = getContextPath();
    $.ajax({
        async:true,
        type : "post",
        url : path+'/RegisterController/register',
        data:formData,
        dataType:"json",
        beforeSend: function () {
            //3.让提交按钮失效，以实现防止按钮重复点击
            $("#registerButton").attr('disabled', 'disabled');

            //4.给用户提供友好状态提示
            $("#registerButton").text('提交中...');
        },
        // complete: function () {
        //     //5.让登陆按钮重新有效
        //     $("#registerButton").removeAttr('disabled');
        // },
        success:function (data) {
            if (data.errorMsg==1){
                layer.tips('用户名已经存在，请选择其它的名字。', '#userName', {tips: 1});
                return;
            }
            if (data.errorMsg==2){
                layer.tips('用户名或密码非法', '#userName', {tips: 1});
                return;
            }
            layer.alert('注册成功！见到你真的很高兴', {icon: 6},function () {
                document.location.href="registerSuccess";
            });
        },
        error:function (data) {
            console.log(data.loginState);
            window.location="/homepage/registerError";
        }
    });
}
function checkPassword() {debugger
    var msg = null;
    var flag = 1;
    if($("input#passwordConfirm").val()!=$("input#password").val()){
        msg = '两次密码不相同，请确认一哈~';
        flag = 0;
    }
    if($("input#password").val()==''||$("input#password").val()==null){
        msg = '密码输入为空!!';
        flag = 0;
    }
    if(msg!=null) {
        layer.tips(msg, '#passwordConfirm', {tips: 1});
    }
    return flag;
}
function checkUserName() {
    var userName = $("#userName").val();
    var flag =  0;
    if(userName==null||userName==""){
        layer.tips("用户名不允许为空", '#userName',{tips:1});
    }else if(userName!=null&&userName!=""){
        $.ajax({
            async: true,
            type: "post",
            url: path + '/RegisterController/check_userName',
            data: {"userName":userName},
            dataType: "json",
            success: function (data) {debugger
                if (data.Msg == 1) {
                    layer.tips('该账号已存在~', '#userName', {tips: 1});
                    flag = 0;
                }else flag = 1;
            },
            error: function (data) {debugger
                if (data.Msg == 2){
                    layer.msg("服务异常");
                }
                flag = 0;
            }
        });
    }
    return flag;
}
function getContextPath() {
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPatht = curWwwPath.substring(0,pos);
    var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1)
    return (localhostPatht);
}