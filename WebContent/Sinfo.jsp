<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人信息</title>
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

    <form class="form-horizontal" method="post" onsubmit="check()" role="from">
        <div class="form-group">
            <label class="col-sm-4 control-label">学号</label>
            <div class="col-sm-4">
                <input class="form-control" id="userid" name="userid" type="text" value="${currentUserid }" readonly>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">姓名</label>
            <div class="col-sm-4">
                <input class="form-control" id="username" name="username" type="text" value="${rows[0].username }">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">联系方式</label>
            <div class="col-sm-4">
                <input class="form-control" id="userphone" name="userphone" type="text" value="${rows.userphone }">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">性别</label>
            <div class="col-sm-4">
                <input class="form-control" id="usergender" name="usergender" type="text" value="${rows.usergender }">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">房间号</label>
            <div class="col-sm-4">
                <input class="form-control" id="userroom" name="userroom" type="text" value="${rows.userroom }">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">身份</label>
            <div class="col-sm-4">
                <input class="form-control" id="userstatus" name="userstatus" type="text" value="${rows.userstatus }">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <button type="submit" class="btn btn-primary form-control">提交</button>
            </div>
        </div>
    </form>

    <script>
        window.onload = function () {
            $.ajax({
                type: "post",
                async: false,
                url: "infoSave?userid=${currentUserid }",
                dataType: "json",
                success: function (data) {
                    var rows = data.rows;
                    $("#username").attr("value", rows[0].username);
                    $("#userphone").attr("value", rows[0].userphone);
                    $("#usergender").attr("value", rows[0].usergender);
                    $("#userroom").attr("value", rows[0].userroom);
                    $("#userstatus").attr("value", rows[0].userstatus);
                }
            })
        }

        function check() {
            var Inputs = document.getElementsByTagName("input");
            if (Inputs[1].value == "" || Inputs[1].value == null) {
                alert("请输入姓名");
                return false;
            }
            if (Inputs[2].value == "" || Inputs[2].value == null) {
                alert("请输入电话号码");
                return false;
            }


            var phoneReg = /^[1][3,4,5,7,8][0-9]{9}$/

            if (!phoneReg.test(Inputs[2].value)) {
                alert("电话号码格式有误");
                return;
            }

            if (Inputs[3].value == "" || Inputs[3].value == null) {
                alert("请输入性别");
                return false;
            }
            if (Inputs[4].value == "" || Inputs[4].value == null) {
                alert("请输入房间");
                return false;
            }
            if (Inputs[5].value == "" || Inputs[5].value == null) {
                alert("请输入身份");
                return false;
            }
            console.log(Inputs);

            $.ajax({
                type: "post",
                async: false,
                url: "infoSave",
                data: {
                    userid: Inputs[0].value,
                    username: Inputs[1].value,
                    userphone: Inputs[2].value,
                    usergender: Inputs[3].value,
                    userroom: Inputs[4].value,
                    userstatus: Inputs[5].value
                },
                dataType: "json",
                success: function (result) {
                    if (result.errorMsg) {
                        alert("保存失败");
                        return;
                    } else {
                        alert("保存成功");
                        resetValue();
                    }
                }
            })
        }
    </script>

</body>

</html>