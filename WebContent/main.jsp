<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>学生主页</title>
    <% if(session.getAttribute("currentUserid")==null){ response.sendRedirect("login.jsp"); return; } %>
    <!-- 新 Bootstrap5 核心 CSS 文件 -->
    <link rel="stylesheet" href="/bootstrap-3.4.1-dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="/bootstrap-table-master/dist/bootstrap-table.min.css">

    <!-- 时间选择器样式表 -->
    <link href="https://cdn.staticfile.org/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
        rel="stylesheet">


    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

    <!-- 时间选择器前置脚本 -->
    <script src="https://cdn.staticfile.org/moment.js/2.22.1/moment-with-locales.min.js"></script>

    <!-- 时间选择器核心脚本 -->
    <script src="https://cdn.staticfile.org/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js">
    </script>


    <script src="/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
    <!-- bootstrap-table export -->
    <script src="/bootstrap-table-master/dist/extensions/export/bootstrap-table-export.min.js"></script>
    <script src="/tableExport.jquery.plugin-master/tableExport.min.js"></script>
    <script src="/bootstrap-table-master/dist/locale/bootstrap-table-zh-CN.js"></script>
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            background-color: #f4f4f4;
        }
    </style>
</head>

<body>
    <script type="text/javascript" src="/js/canvas-nest.min.js" opacity=0.6></script>
    <!-- 顶部栏 -->
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="main.jsp">首页</a>
            </div>
            <div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown">
                            申请
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="mytrip.jsp">我的申请</a></li>
                            <li class="divider"></li>
                            <li><a href="out.jsp">出校申请</a></li>
                            <li class="divider"></li>
                            <li><a href="in.jsp">入校申请</a></li>
                            <li class="divider"></li>
                            <li><a href="back.jsp">寒暑假返校申请</a></li>
                        </ul>
                    </li>
                    <li><a href="index0.jsp">疫情地图</a></li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown">
                            个人中心
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="Sinfo.jsp">个人信息</a></li>
                            <li class="divider"></li>
                            <li><a href="modifyPassword.jsp">修改密码</a></li>
                            <li class="divider"></li>
                            <li><a href="logout.jsp">登出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div align="center" style="padding-top: 200px;">
        <font color="#871F78" size="10">欢迎进入学生行程管理系统</font>
    </div>
</body>

</html>