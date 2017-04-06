<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: liaosheng
  Date: 2017/3/28
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.jxufe.boy.dao.Page" %>
<%@ page import="edu.jxufe.boy.entity.User" %>
<%@ page import="edu.jxufe.boy.entity.Topic" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <style type="text/css">
        body{
            padding-top: 70px;
        }
        .userInfo{
            font-size: 8px;
        }
    </style>
    <%--<link rel='stylesheet' type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">--%>
    <%
        Page pageTopic = (Page) request.getAttribute("pagedTopic");
        List<Topic> topicList = pageTopic.getResult();
        User user = (User) session.getAttribute("USER_CONTEXT");

    %>
</head>
<body>
<% if (topicList.size()==0){%>
<blockquote>
    <p>该版块是空滴~~</p>
</blockquote>
<%}else{%>
<c:forEach var="topic" items="${pagedTopic.result}">
    <blockquote>

        <c:if test="${USER_CONTEXT.userType == 2 || isboardManager}">
            <input type="checkbox" name="topicIds" value="${topic.topicId}"/>
        </c:if>
        <h4 >
        <a  href="<c:url value="/BoardManage/board/loadTopicPostPage-${topic.topicId}"/>">
                ${topic.topicTitle}
                    <c:if test="${topic.digest > 0}">
                        <font color=red>(★精品)</font>
                    </c:if>
        </a>
        </h4>
            <p class="userInfo">发起人：${topic.user.userName}</p>
            <p class="userInfo">评论数：${topic.replies}&nbsp;&nbsp;最新评论时间：${topic.lastPost}</p>
            <%--<td>--%>
            <%--<fmt:formatDate pattern="yyyy-MM-dd HH:mm"--%>
            <%--value="${topic.createTime}" />--%>
            <%--</td>--%>
            <%--<td>--%>
            <%--<fmt:formatDate pattern="yyyy-MM-dd HH:mm"--%>
            <%--value="${topic.lastPost}" />--%>
            <%--</td>--%>
    </blockquote>
</c:forEach>
<%}%>
<div align="center">
<ul  class="pagination">
    <% if (!pageTopic.isHasPreviousPage()){ %>
        <li class="disabled"><a href="#">&laquo;上一页</a></li>
    <%}else{%>
        <li><a onclick="showAllTopic(<%=(pageTopic.getCurrentPageNo()-1)%>)" href="#">&laquo;上一页</a></li>
    <%}%>

    <%for(long pageNumber = 1;pageNumber<=pageTopic.getTotalPageCount();pageNumber++){%>
        <% if(pageNumber==pageTopic.getCurrentPageNo()){ %>
            <li class="active"><a onclick="showAllTopic(<%=pageNumber%>)" href="#" id="currentPage"><%=pageNumber%></a></li>
        <% }else{ %>
            <li ><a onclick="showAllTopic(<%=pageNumber%>)" href="#"><%=pageNumber%></a></li>
        <%}%>
    <%}%>

    <% if(!pageTopic.isHasNextPage()){%>
        <li class="disabled"><a href="#">下一页&raquo;</a></li>
    <% }else{ %>
        <li><a onclick="showAllTopic(<%=(pageTopic.getCurrentPageNo()+1)%>)" href="#">下一页&raquo;</a></li>
    <% } %>
</ul>
</div>

<form class="form-group" id="addTopicForm">
    <input type="hidden" ID="board.boardId" name="boardId" value="${board.boardId}">
    <%if(user==null){%>
    <div class="form-group">
        <input type="text" class="form-control" rows="3" placeholder="发表帖子标题"  onclick="askForLogin();">
    </div>
    <div class="form-group">
        <textarea style="height: 70px" class="form-control" rows="3" placeholder="发表帖子内容" onclick="askForLogin();"></textarea>
    </div>
    <div class="form-group">
        <button type="button" id="addTopicButton"  class="btn btn-lg btn-primary btn-block" onclick="askForLogin();">发表帖子</button>
    </div>
    <%}else{%>
    <div class="form-group">
        <input type="text" class="form-control" rows="3" placeholder="发表帖子标题" id="topicTitle" name="topicTitle">
    </div>
    <div class="form-group">
        <textarea class="form-control" rows="3" id="postText" name="mainPost.postText" placeholder="发表帖子内容"></textarea>
    </div>
    <div class="form-group">
        <button type="button" onclick="addTopic();" class="btn btn-lg btn-primary btn-block">发表帖子</button>
    </div>
    <%}%>
</form>

<%--<script src='http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js'></script>--%>
<%--<script src='http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>--%>
</body>
</html>
