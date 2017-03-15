<%--
  Created by IntelliJ IDEA.
  User: liaosheng
  Date: 2017/3/14
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登陆</title>
    <link rel='stylesheet' type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Login</h2>
    <form role="form" action="/homepage/login" method="post">
        <div class="form-group">
            <label for="email">账号:</label>
            <input type="text" class="form-control" name="email" id="email" placeholder="账号">
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" class="form-control" name="password" id="password" placeholder="Enter password">
        </div>
        <button type="submit" class="btn btn-default">登陆</button>
    </form>
</div>
</body>
</html>
