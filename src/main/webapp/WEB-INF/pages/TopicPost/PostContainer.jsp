<%@ page import="java.util.List" %>
<%@ page import="edu.jxufe.boy.dao.Page" %>
<%@ page import="edu.jxufe.boy.entity.Post" %>
<%@ page import="edu.jxufe.boy.entity.User" %>
<%@ page import="edu.jxufe.boy.entity.MainPost" %>
<%@ page import="edu.jxufe.boy.cons.CommonConstant" %>
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
        blockquote p {

        }
        .userInfo{
            font-size: 8px;
        }
    </style>
    <link rel='stylesheet' type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <%
        Page pagedPost = (Page) request.getAttribute("pagedPost");
        List<Post> postList = pagedPost.getResult();
        User user = (User) session.getAttribute("USER_CONTEXT");
    %>
</head>
<body>

<tr>
    <h4 class="bg-success">${topic.topicTitle}</h4>
</tr>

<%for (int i = 0;i<postList.size();i++){%>
    <blockquote>
        <p class="postText"><%=postList.get(i).getPostText()%></p>
        <p class="userInfo">
            <%if (postList.get(i) instanceof MainPost){%>
                楼主：
            <%}else{%>
                <%=(pagedPost.getCurrentPageNo()-1)* pagedPost.getPageSize()+i%>楼:
            <%}%>
            <a href="#" onclick="alert('功能开发中')"><%=postList.get(i).getUser().getUserName()%></a>
        &nbsp;积分：<%=postList.get(i).getUser().getCredit()%>
        <p class="userInfo">&nbsp;时间：<%=postList.get(i).getCreateTime()%></p>
        </p>
    </blockquote>
    <% if (postList.size()==1&&postList.get(i) instanceof MainPost){%>
    <blockquote>
        <p>评论区是空滴~~</p>
    </blockquote>
    <%}%>

    <%}%>


<div align="center">
    <ul  class="pagination">
        <% if (!pagedPost.isHasPreviousPage()){ %>
        <li class="disabled"><a href="#">&laquo;上一页</a></li>
        <%}else{%>
        <li><a onclick="showAllPost(<%=(pagedPost.getCurrentPageNo()-1)%>)" href="#">&laquo;上一页</a></li>
        <%}%>

        <%for(long pageNumber = 1;pageNumber<=pagedPost.getTotalPageCount();pageNumber++){%>
        <% if(pageNumber==pagedPost.getCurrentPageNo()){ %>
        <li class="active"><a onclick="showAllPost(<%=pageNumber%>)" href="#" id="currentPage"><%=pageNumber%></a></li>
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
    <input type="hidden" ID="topic.topicId" name="topic.topicId" value="${topic.topicId}">
    <input type="hidden" ID="boardId" name="boardId" value="${topic.boardId}">
    <%if(user==null){%>
    <div class="form-group">
        <textarea style="height: 70px" class="form-control" rows="3" placeholder="回复帖子" onclick="askForLogin();"></textarea>
    </div>
    <div class="form-group">
        <button type="button" id="addPostButton"  class="btn btn-lg btn-primary btn-block" onclick="askForLogin();">回复</button>
    </div>
    <%}else{%>
    <div class="form-group">
        <textarea class="form-control" rows="3" id="postText" name="postText"></textarea>
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
