<%@ page import="edu.jxufe.boy.entity.Board" %><%--
  Created by IntelliJ IDEA.
  User: liaosheng
  Date: 2017/4/7
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新增版块</title>
    <link rel='stylesheet' type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <%
        Board board = (Board) request.getAttribute("board");
    %>
</head>
<body>
    <div class="container">
        <form class="form-group" id="addBoardForm">
            <%if (board==null){%>
            <div class="form-group">
                <input type="text" class="form-control" rows="3" placeholder="版块名称" id="boardName2" name="boardName">
            </div>
            <div class="form-group">
                <textarea class="form-control" rows="3" id="boardDesc2" name="boardDesc" placeholder="版块描述"></textarea>
            </div>
            <div class="form-group">
                <button type="button" onclick="addBoard('add')" class="btn btn-lg btn-primary btn-block" id="addBoardButton2">新增</button>
            </div>
            <%}else{%>
            <div class="form-group">
                <input type="hidden"  name="boardId" value="<%=board.getBoardId()%>">
                <input type="hidden"  name="topicNum" value="<%=board.getTopicNum()%>">
                <input type="hidden"  name="deleteFlag" value="<%=board.getDeleteFlag()%>">
                板块名称<input type="text" class="form-control" rows="3" value="<%=board.getBoardName()%>" id="boardName" name="boardName">
            </div>
            <div class="form-group">
                版块描述<textarea class="form-control" rows="3" id="boardDesc" name="boardDesc" ><%=board.getBoardDesc()%></textarea>
            </div>
            <div class="form-group">
                <button type="button" onclick="addBoard('update')" class="btn btn-lg btn-primary btn-block" id="addBoardButton">修改</button>
            </div>
            <%}%>
        </form>
    </div>
<script src='http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js'></script>
<script src='http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
    <script src="../../../js/pub/layer/layer.js"></script>
<script src="../../../js/manager/boardManage.js"></script>
</body>
</html>
