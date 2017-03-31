<%--
  Created by IntelliJ IDEA.
  User: liaos
  Date: 2017/3/29
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${topic.topicTitle}</title>
    <link rel='stylesheet' type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
</head>
<body>
<input id="topicId" style="display:none;" value="${topic.topicId}"/>
<div id="topPage"></div>        <!-- 顶部导航栏-->
<div class="container" id="postContainer"></div>     <!--中部 主贴和回复贴列表-->
<div class="container" id="addPostContainer"></div>     <!--底部添加回复区-->

<script src='http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js'></script>
<script src='http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src="../../../js/pub/layer/layer.js"></script>
<script src="../../../js/pub/publicJS.js"></script>
<script src="../../../js/TopicPost/TopicPost.js"></script>
</body>
</html>
