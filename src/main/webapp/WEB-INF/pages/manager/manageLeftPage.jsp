<%--
  Created by IntelliJ IDEA.
  User: liaosheng
  Date: 2017/4/6
  Time: 14:31
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
</head>
<body>
            <ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
                <li class="active" onclick="manageDefaultPage();">
                    <a href="#">
                        <i class="glyphicon glyphicon-th-large"></i>
                        管理员功能
                    </a>
                </li>
                <li>
                    <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        论坛管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="systemSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li id="boardManage" onclick="showBoardManage();"><a href="#"><i class="glyphicon glyphicon-user"></i>版块管理</a></li>
                        <li id="topicManage"><a href="#"><i class="glyphicon glyphicon-th-list"></i>帖子管理</a></li>
                        <li id="postManage"><a href="#"><i class="glyphicon glyphicon-asterisk"></i>回复管理</a></li>
                        <li id="userManage" onclick="showUserManage();"><a href="#"><i class="glyphicon glyphicon-edit"></i>用户管理</a></li>
                        <%--<li><a href="#"><i class="glyphicon glyphicon-eye-open"></i>日志查看</a></li>--%>
                    </ul>
                </li>
                <li>
                    <a href="./plans.html">
                        <i class="glyphicon glyphicon-credit-card"></i>
                        保留功能一
                    </a>
                </li>

                <li>
                    <a href="./grid.html">
                        <i class="glyphicon glyphicon-globe"></i>
                        保留功能二
                        <span class="label label-warning pull-right"></span>
                    </a>
                </li>

                <li>
                    <a href="./charts.html">
                        <i class="glyphicon glyphicon-calendar"></i>
                        保留功能三
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="glyphicon glyphicon-fire"></i>
                        保留功能四
                    </a>
                </li>

            </ul>


</body>
</html>
