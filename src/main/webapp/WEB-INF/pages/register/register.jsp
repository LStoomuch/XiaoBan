<%--
  Created by IntelliJ IDEA.
  User: liaos
  Date: 2016/11/4
  Time: 2:30
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>regist</title>
    <link rel='stylesheet' type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
</head>

<body>
<div class="container">
    <h2>注册页面</h2>
    <form role="form" action="success" method="post">
        <div class="form-group">
            <label for="email">邮箱:</label>
            <input type="text" class="form-control" name="email" id="email" placeholder="Enter email">
        </div>
        <div class="form-group">
        <label for="password">密码:</label>
        <input type="password" class="form-control" name="password" id="password" placeholder="Enter password">
    </div>
        <div class="form-group">
            <label for="passwordConfirm">确认密码:</label>
            <input type="password" class="form-control" name="passwordConfirm" id="passwordConfirm" placeholder="Enter password again">
        </div>
        <div class="radio">
            <label><input type="radio" name="optradio" value="1" checked>汉纸</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="optradio" value="0">妹纸</label>
        </div>
        <div class="radio disabled">
            <label><input type="radio" name="optradio" disabled>哲♂学家</label>
        </div>
        <button type="submit" class="btn btn-default">注册</button>
    </form>
</div>
<script src='http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js'></script>
<script src='http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
</body>
</html>
