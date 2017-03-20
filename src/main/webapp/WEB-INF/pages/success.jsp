<%--
  Created by IntelliJ IDEA.
  User: liaos
  Date: 2016/10/12
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册成功</title>
    <link rel='stylesheet' type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <script src='http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js'></script>
    <script src='http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
    <script>
        function getContextPath() {debugger
            var curWwwPath = window.document.location.href;
            var pathName = window.document.location.pathname;
            var pos = curWwwPath.indexOf(pathName);
            var localhostPatht = curWwwPath.substring(0,pos);
            var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1)
            return (localhostPatht);
        }
        var time = 0 ;
        $(document).ready(function () {debugger
            setInterval(function () {
                if(time<10000) {
                    $("p#msg").html("将在" + ((10000-time) / 1000) + "秒后回到首页");
                }else{
                    var path = getContextPath();
                    document.location.href=path+"/homepage";
                    return;
                }
                time = time+1000;
            },1000)
        });
    </script>
</head>
<body>
<div class="container">
    <h4>注册成功！</h4>
    <p id="msg"></p>
</div>

</body>
</html>
