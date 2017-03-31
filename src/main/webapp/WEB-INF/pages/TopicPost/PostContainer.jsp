<%@ page import="java.util.List" %>
<%@ page import="edu.jxufe.boy.dao.Page" %>
<%@ page import="edu.jxufe.boy.entity.Post" %>
<%@ page import="edu.jxufe.boy.entity.User" %>
<%--
  Created by IntelliJ IDEA.
  User: liaos
  Date: 2017/3/29
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    <link rel='stylesheet' type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <%
        Page pagedPost = (Page) request.getAttribute("pagedPost");
        List postList = pagedPost.getResult();
        Post post = null;
        if (postList!=null){
             post = (Post) postList.get(0);
        }
        User user = (User) session.getAttribute("USER_CONTEXT");
    %>
</head>
<body>

<tr>
    <h3 class="bg-success">${topic.topicTitle}</h3>
</tr>
<c:forEach var="post" items="${pagedPost.result}">
    <blockquote>
    ${post.postText}

        <p> 用户：${post.user.userName}</p>
        <p>积分：${post.user.credit}</p>
    </blockquote>
    <% if (postList.size()==1){%>
    <blockquote>
        <p>评论区是空滴~~</p>
    </blockquote>
    <%}%>
</c:forEach>

<div align="center">
    <ul  class="pagination">
        <% if (!pagedPost.isHasPreviousPage()){ %>
        <li class="disabled"><a href="#">&laquo;上一页</a></li>
        <%}else{%>
        <li><a onclick="showAllPost(<%=(pagedPost.getCurrentPageNo()-1)%>)" href="#">&laquo;上一页</a></li>
        <%}%>

        <%for(long pageNumber = 1;pageNumber<=pagedPost.getTotalPageCount();pageNumber++){%>
        <% if(pageNumber==pagedPost.getCurrentPageNo()){ %>
        <li class="active"><a onclick="showAllPost(<%=pageNumber%>)" href="#"><%=pageNumber%></a></li>
        <% }else{ %>
        <li ><a onclick="showAllPost(<%=pageNumber%>)" href="#"><%=pageNumber%></a></li>
        <%}%>
        <%}%>

        <% if(!pagedPost.isHasNextPage()){%>
        <li class="disabled"><a href="#">下一页&raquo;</a></li>
        <% }else{ %>
        <li><a onclick="showAllPost(<%=(pagedPost.getCurrentPageNo()+1)%>)" href="#">下一页&raquo;</a></li>
        <% } %>
    </ul>
</div>
<form class="form-group" id="addPostForm">
    <%if(user==null){%>
    <div class="form-group">
        <textarea style="height: 70px" class="form-control" rows="3" onclick="askForLogin();"></textarea>
    </div>
    <div class="form-group">
        <button type="button" id="addPostButton"  class="btn btn-lg btn-primary btn-block" onclick="askForLogin();">回复</button>
    </div>
    <%}else{%>
    <div class="form-group">
        <textarea class="form-control" rows="3"></textarea>
    </div>
    <div class="form-group">
        <button type="button" onclick="addPost();" class="btn btn-lg btn-primary btn-block">回复</button>
    </div>
    <%}%>
</form>
<script src='http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js'></script>
<script src='http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>

</body>
</html>
