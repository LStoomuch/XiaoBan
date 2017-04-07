<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="edu.jxufe.boy.entity.User" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>搞个大新闻</title>
    <link rel='stylesheet' href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="icon" href="../../../images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="../../../images/favicon.ico" type="image/x-icon" />
    <script src="https://cdn.bootcss.com/react/15.4.2/react.min.js"></script>
    <script src="https://cdn.bootcss.com/react/15.4.2/react-dom.min.js"></script>
    <script src="https://cdn.bootcss.com/babel-standalone/6.22.1/babel.min.js"></script>
</head>
<body>
<div id="topPage"></div>    <!--顶部 导航栏 -->

<div class="container" id="boardsContainer"></div>   <!--中部 显示所有版块 -->

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
<script src="../../../js/pub/layer/layer.js"></script>
<script src="../../../js/pub/publicJS.js"></script>
<script src="../../../js/Homepage.js"></script>
</body>
</html>