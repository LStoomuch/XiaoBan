<%@ page import="java.util.List" %>
<%@ page import="edu.jxufe.boy.entity.Board" %><%--
  Created by IntelliJ IDEA.
  User: liaosheng
  Date: 2017/4/6
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <style type="text/css">
        body{
            padding-top: 70px;
        }
    </style>
    <%
        List<Board> boards = (List<Board>) request.getAttribute("boards");
    %>
</head>
<body>
<table class="table table-striped table-hover table-bordered">
    <thead>
    <tr>
        <th>编号</th>
        <th>版块名称</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>1</td>
        <td>Anna</td>
    </tr>
    <tr>
        <td>2</td>
        <td>Debbie</td>
    </tr>
    <tr>
        <td>3</td>
        <td>John</td>
    </tr>
    </tbody>
</table>

</body>
</html>
