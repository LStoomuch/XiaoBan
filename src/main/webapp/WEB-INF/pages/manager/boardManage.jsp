<%@ page import="java.util.List" %>
<%@ page import="edu.jxufe.boy.entity.Board" %>
<%@ page import="edu.jxufe.boy.dao.Page" %><%--
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
        Page pagedBoards = (Page) request.getAttribute("pagedBoards");
        List<Board> boardList = pagedBoards.getResult();
    %>
</head>
<body>
<div class="btn-group">
    <button class="btn btn-large btn-primary" type="button" onclick="loadAddBoardPage()">新增论坛版块</button>
    <button id="deleteBoards" class="btn btn-large btn-danger" type="button" onclick="deleteSelectedBoards(<%=pagedBoards.getCurrentPageNo()%>)">批量删除论坛版块</button>
</div><p/>

<table class="table table-striped table-hover table-bordered">
    <thead>
    <tr>
        <th></th>
        <th>编号</th>
        <th>版块名称</th>
        <th>帖子数目</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%for (int i=0; i<boardList.size();i++){%>

    <tr>
        <td><input type="checkbox" name="selectIds" id="selectIds" value="<%=boardList.get(i).getBoardId()%>"/></td>
        <td><%=i+1+(pagedBoards.getCurrentPageNo()-1)*pagedBoards.getPageSize()%></td>
        <td><%=boardList.get(i).getBoardName()%></td>
        <td><%=boardList.get(i).getTopicNum()%></td>
        <td>
            <button class="btn btn-danger" onclick="deleteBoard(<%=boardList.get(i).getBoardId()%>,<%=pagedBoards.getCurrentPageNo()%>)">删除</button>
            <button class="btn btn btn-warning" onclick="loadAddBoardPage(<%=boardList.get(i).getBoardId()%>)">修改</button>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>

    <div align="center">
        <ul  class="pagination">
            <% if (!pagedBoards.isHasPreviousPage()){ %>
            <li class="disabled"><a href="#">&laquo;上一页</a></li>
            <%}else{%>
            <li><a onclick="showBoardManage(<%=(pagedBoards.getCurrentPageNo()-1)%>)" href="#">&laquo;上一页</a></li>
            <%}%>

            <%for(long pageNumber = 1;pageNumber<=pagedBoards.getTotalPageCount();pageNumber++){%>
            <% if(pageNumber==pagedBoards.getCurrentPageNo()){ %>
            <li class="active"><a onclick="showBoardManage(<%=pageNumber%>)" href="#" id="currentPage"><%=pageNumber%></a></li>
            <% }else{ %>
            <li ><a onclick="showBoardManage(<%=pageNumber%>)" href="#"><%=pageNumber%></a></li>
            <%}%>
            <%}%>

            <% if(!pagedBoards.isHasNextPage()){%>
            <li class="disabled"><a href="#">下一页&raquo;</a></li>
            <% }else{ %>
            <li><a onclick="showBoardManage(<%=(pagedBoards.getCurrentPageNo()+1)%>)" href="#">下一页&raquo;</a></li>
            <% } %>
        </ul>
    </div>



</body>
</html>
