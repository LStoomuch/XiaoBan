<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="edu.jxufe.boy.entity.User" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人博客</title>
    <style type="text/css">
        body{
            padding-top: 70px;
        }
    </style>
    <link rel='stylesheet' href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/react/15.4.2/react.min.js"></script>
    <script src="https://cdn.bootcss.com/react/15.4.2/react-dom.min.js"></script>
    <script src="https://cdn.bootcss.com/babel-standalone/6.22.1/babel.min.js"></script>
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
            <a class="navbar-brand" href="#">个人博客</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">功能<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="disabled"><a href="#">业务功能</a></li>
                        <li><a href="#">信息建立</a></li>
                        <li><a href="#">信息查询</a></li>
                        <li><a href="#">信息管理</a></li>
                        <li class="divider"></li>

                        <li class="disabled"><a href="#">系统设置</a></li>
                        <li><a href="#">设置</a></li>
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
<div class="container" id="container2"></div>
<div class="container">
    <blockquote>
        <p>
            这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。
        </p>
    </blockquote><blockquote>
    <p>
        这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。
    </p>
</blockquote><blockquote>
    <p>
        这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。
    </p>
</blockquote><blockquote>
    <p>
        这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。
    </p>
</blockquote><blockquote>
    <p>
        这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。
    </p>
</blockquote><blockquote>
    <p>
        这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。
    </p>
</blockquote><blockquote>
    <p>
        这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。
    </p>
</blockquote><blockquote>
    <p>
        这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。
    </p>
</blockquote><blockquote>
    <p>
        这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。
    </p>
</blockquote><blockquote>
    <p>
        这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。
    </p>
</blockquote><blockquote>
    <p>
        这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。
    </p>
</blockquote><blockquote>
    <p>
        这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。
    </p>
</blockquote><blockquote>
    <p>
        这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。
    </p>
</blockquote>
</div>
<div id="example">asdas</div>
<script type="text/babel">
    var Counter = React.createClass({
        getInitialState: function () {
            return { clickCount: 0 };
        },
        handleClick: function () {
            this.setState(function(state) {
                return {clickCount: state.clickCount + 1};
            });
        },
        render: function () {
            return (<p onClick={this.handleClick}>点我！点击次数为: {this.state.clickCount}</p>);
        }
    });
    ReactDOM.render(
            <Counter />,
        document.getElementById('example')
    );
</script>
<script src='http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js'></script>
<script src='http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src="../../../js/Homepage.js"></script>
</body>
</html>