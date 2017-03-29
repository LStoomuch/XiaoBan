<%--
  Created by IntelliJ IDEA.
  User: liaosheng
  Date: 2017/3/27
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <style type="text/css">
        body{
            padding-top: 70px;
        }
    </style>
    <link rel='stylesheet' href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
</head>
<body>
<c:forEach items="${boards}" var="board">
    <blockquote>
        <h3>
            <a href="BoardManage/board/loadBoardTopicsPage-${board.boardId}">${board.boardName}</a>
        </h3>
        <p>${board.boardDesc}</p>
        <p>帖子数目：${board.topicNum}</p>
    </blockquote>
</c:forEach>

<script src='http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js'></script>
<script src='http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
</body>
</html>
