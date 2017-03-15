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
    <title>注册</title>
    <link rel='stylesheet' type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
</head>

<body>
<div class="container">
    <h2>Register</h2>
    <form role="form" id="registerForm">
        <div class="form-group">
            <label for="userName">账号:</label>
            <input type="text" class="form-control" name="userName" id="userName" placeholder="用户名">
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" class="form-control" name="password" id="password" placeholder="密码">
        </div>
        <div class="form-group">
            <label for="passwordConfirm">确认密码:</label>
            <input type="password" class="form-control" name="passwordConfirm" id="passwordConfirm" placeholder="确认密码">
        </div>
        <button type="button" class="btn btn-default" id="registerButton">注册</button>
    </form>
</div>
<script src='http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js'></script>
<script src='http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src="../../../js/pub/layer/layer.js"></script>
<script src="../../../js/register/register.js"></script>
</body>
</html>
