<%--
  Created by IntelliJ IDEA.
  User: liaosheng
  Date: 2017/4/6
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="edu.jxufe.boy.entity.Board" %>
<%@ page import="edu.jxufe.boy.dao.Page" %>
<%@ page import="edu.jxufe.boy.entity.User" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel='stylesheet' href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <style type="text/css">
        body{
            padding-top: 70px;
        }
    </style>
    <%
        Page pagedUsers = (Page) request.getAttribute("pagedUsers");
        List<User> userList = pagedUsers.getResult();
    %>
</head>
<body>
<div class="btn-group">
    <button id="deleteBoards" class="btn btn-large btn-danger" type="button" onclick="deleteSelectedUsers(<%=pagedUsers.getCurrentPageNo()%>)">批量删除用户</button>
</div><p/>

<table class="table table-striped table-hover table-bordered">
    <thead>
    <tr>
        <th></th>
        <th>编号</th>
        <th>用户名</th>
        <th>用户类型</th>
        <th>用户密码</th>
        <th>积分</th>
        <th>限制操作</th>
        <th>最后登录IP</th>
        <th>最后登录时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%for (int i=0; i<userList.size();i++){%>

    <tr>
        <td><input type="checkbox" name="selectIds" id="selectIds" value="<%=userList.get(i).getUserId()%>"/></td>
        <td><%=i+1+(pagedUsers.getCurrentPageNo()-1)*pagedUsers.getPageSize()%></td>
        <td><%=userList.get(i).getUserName()%></td>
        <%if (userList.get(i).getUserType()==1){ %>
            <td>普通用户</td>
        <%}else if(userList.get(i).getUserType()==2){%>
            <td>管理员</td>
        <%}%>
        <td><%=userList.get(i).getPassword()%></td>
        <td><%=userList.get(i).getCredit()%></td>
        <td>
            <%if (userList.get(i).getLocked()==0){%>
            <a class="btn btn-success" onclick="lockUser(<%=userList.get(i).getUserId()%>,<%=pagedUsers.getCurrentPageNo()%>)"><i class="glyphicon glyphicon-ok-circle"></i>&nbsp;锁定</a>
            <%}else{%>
            <a class="btn btn-danger" onclick="unlockUser(<%=userList.get(i).getUserId()%>,<%=pagedUsers.getCurrentPageNo()%>)"><i class="glyphicon glyphicon-ban-circle"></i>&nbsp;解锁</a>
            <%}%>
        </td>
        <%if (userList.get(i).getLastIp()!=null){%>
            <td><%=userList.get(i).getLastIp()%></td>
        <%}else{%>
            <td>从未登录</td>
        <%}%>
        <%if (userList.get(i).getLastVisit()!=null){%>
            <td><%=userList.get(i).getLastVisit()%></td>
        <%}else{%>
            <td>从未登录</td>
        <%}%>
        <td>

            <button class="btn btn btn-warning" onclick="loadAddBoardPage(<%=userList.get(i).getUserId()%>)">修改</button>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>

<div align="center">
    <ul  class="pagination">
        <% if (!pagedUsers.isHasPreviousPage()){ %>
        <li class="disabled"><a href="#">&laquo;上一页</a></li>
        <%}else{%>
        <li><a onclick="showUserManage(<%=(pagedUsers.getCurrentPageNo()-1)%>)" href="#">&laquo;上一页</a></li>
        <%}%>

        <%for(long pageNumber = 1;pageNumber<=pagedUsers.getTotalPageCount();pageNumber++){%>
        <% if(pageNumber==pagedUsers.getCurrentPageNo()){ %>
        <li class="active"><a onclick="showUserManage(<%=pageNumber%>)" href="#" id="currentPage"><%=pageNumber%></a></li>
        <% }else{ %>
        <li ><a onclick="showUserManage(<%=pageNumber%>)" href="#"><%=pageNumber%></a></li>
        <%}%>
        <%}%>

        <% if(!pagedUsers.isHasNextPage()){%>
        <li class="disabled"><a href="#">下一页&raquo;</a></li>
        <% }else{ %>
        <li><a onclick="showUserManage(<%=(pagedUsers.getCurrentPageNo()+1)%>)" href="#">下一页&raquo;</a></li>
        <% } %>
    </ul>
</div>



</body>
</html>