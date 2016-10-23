<%@ page language="java" contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ page isELIgnored="false" %>
</head>
<body>
<h2>首页</h2>
<c:forEach var="user" items="${userList}">
    ${user.account}
</c:forEach>
</body>
</html>
