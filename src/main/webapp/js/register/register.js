/**
 * Created by liaosheng on 2017/3/14.
 */
$(document).ready(function () {
   $("input#passwordConfirm").blur(function () {debugger
      if($("input#passwordConfirm").val()!=$("input#password").val()){
          layer.msg('请确认密码', function(){
                $("input#passwordConfirm").focus();
          });
      }
   });
    $("#registerButton").click(function () {
        var formData = $("#registerForm").serializeArray();
        $.ajax({
            async:true,
            type : "post",
            url : "/homepage/register",
            data:formData,
            dataType:"json",
            success:function (data) {debugger
                if(data.loginState==="1"){
                    layer.alert('见到你真的很高兴', {icon: 6},function () {
                        document.location.href="registerSuccess";
                    });
                }

            },
            error:function (data) {debugger
                console.log(data.loginState);
                window.location="/homepage/registerSuccess";
            }
        });
    });
});