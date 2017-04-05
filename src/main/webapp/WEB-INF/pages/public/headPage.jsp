<%@ page import="edu.jxufe.boy.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: liaosheng
  Date: 2017/3/28
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='stylesheet' href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <title>Title</title>
    <%
        User USER_CONTEXT = (User) request.getSession().getAttribute("USER_CONTEXT");
    %>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse " role="navigation" >
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/homepage">搞个大新闻</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/homepage">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">功能<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="disabled"><a href="#">业务功能</a></li>
                        <li><a href="#" onclick="layer.open({type: 1,
  skin: '开发中', //样式类名
  closeBtn: 0, //不显示关闭按钮
  anim: 2,
  shadeClose: true, //开启遮罩关闭
  content: '该功能正在开发中'
});">人员管理</a></li>
                        <li><a href="#" onclick="layer.open({
  type: 1,
  skin: '开发中', //样式类名
  closeBtn: 0, //不显示关闭按钮
  anim: 2,
  shadeClose: true, //开启遮罩关闭
  content: '该功能正在开发中'
});">信息查询</a></li>
                        <li><a href="#" onclick="layer.open({
  type: 1,
  skin: '开发中', //样式类名
  closeBtn: 0, //不显示关闭按钮
  anim: 2,
  shadeClose: true, //开启遮罩关闭
  content: '该功能正在开发中'
});">信息管理</a></li>
                        <li class="divider"></li>

                        <li class="disabled"><a href="#">系统设置</a></li>
                        <li><a href="#" onclick="layer.open({
  type: 1,
  skin: '开发中', //样式类名
  closeBtn: 0, //不显示关闭按钮
  anim: 2,
  shadeClose: true, //开启遮罩关闭
  content: '该功能正在开发中'
});">设置</a></li>
                    </ul>
                </li>
            </ul>
            <%if (USER_CONTEXT==null){%>
            <form class="navbar-form navbar-right" role="search">
                <button type="submit" class="btn btn-default" onclick="toLogin();return false;">登录</button>
                <button onclick="jumpToRegister();return false;" class="btn btn-default ">注册</button>
            </form>
            <%}else if (USER_CONTEXT!=null){%>
            <form class="navbar-form navbar-right" role="search">
                <a href="#" style="color: #c7ddef"><c:out value="<%=USER_CONTEXT.getUserName()%>"></c:out></a>&nbsp;&nbsp;
                <button onclick="doLogout();" class="btn btn-default">注销</button>
            </form>
            <%}%>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<script src='http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js'></script>
<script src='http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
</body>
</html>
