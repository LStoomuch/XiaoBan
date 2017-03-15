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
            <label for="email">账号:</label>
            <input type="text" class="form-control" name="email" id="email" placeholder="建议用邮箱账号">
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" class="form-control" name="password" id="password" placeholder="密码">
        </div>
        <div class="form-group">
            <label for="passwordConfirm">确认密码:</label>
            <input type="password" class="form-control" name="passwordConfirm" id="passwordConfirm" placeholder="确认密码">
        </div>
        <div class="form-group">
            <label for="nickname">昵称:</label>
            <input type="text" class="form-control" name="nickname" id="nickname" placeholder="用户昵称">
        </div>
        <div class="radio">
            <label><input type="radio" name="sex" value="1" checked>汉纸</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="sex" value="0">妹纸</label>
        </div>
        <div class="form-group">
            <label for="phone">手机:</label>
            <input type="text" class="form-control" name="phone" id="phone" placeholder="手机号码">
        </div>
        <div class="form-group">
            <label for="city">城市:</label>
            <input type="text" class="form-control" name="city" id="city" placeholder="所在城市">
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
