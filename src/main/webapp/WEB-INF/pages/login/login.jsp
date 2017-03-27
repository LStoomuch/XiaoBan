<%--
  Created by IntelliJ IDEA.
  User: liaosheng
  Date: 2017/3/14
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登陆</title>
    <link rel='stylesheet' type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../../css/messenger.css">
    <link rel="stylesheet" type="text/css" href="../../../css/messenger-theme-future.css">
    <script src="https://cdn.bootcss.com/react/15.4.2/react.min.js"></script>
    <script src="https://cdn.bootcss.com/react/15.4.2/react-dom.min.js"></script>
    <script src="https://cdn.bootcss.com/babel-standalone/6.22.1/babel.min.js"></script>
    <style>
        .col-center-block {
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>

<div class="container" id="allContainer">
    <div class="row myCenter">
        <div class="col-xs-6 col-md-4 col-center-block">
        <form class="form-signin" role="form" id="loginForm">
    <h2 class="form-signin-heading">Login</h2>
        <div class="form-group">
            <input type="text" class="form-control" name="userName" id="userName" placeholder="账号">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="password" id="password" placeholder="Enter password">
        </div>
        <button type="button" id="loginButton" class="btn btn-lg btn-primary btn-block">登陆</button>
    </form>
        </div>
    </div>
</div>
<script src='http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js'></script>
<script src='http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src="../../../js/pub/layer/layer.js"></script>
<script src="../../../js/pub/messenger.min.js"></script>
<script src="../../../js/login/login.js"></script>
</body>
</html>
