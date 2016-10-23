<%--
  Created by IntelliJ IDEA.
  User: liaos
  Date: 2016/10/14
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>uploadPage</title>
</head>
<body>
<h1>
    请选择上传的头像文件
</h1>
<form method="post" action="/test/upload" enctype="multipart/form-data">
    <input type="text" name="name" />
    <input type="file" name="file" />
    <input type="submit" />
</form>
</body>
</html>