<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>返校申请</title>
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
                <a class="navbar-brand" href="Teacher.jsp">首页</a>
            </div>
            <div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown">
                            申请审批
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="trip_all.jsp">未审批申请</a></li>
                            <li class="divider"></li>
                            <li><a href="out_all.jsp">出校申请</a></li>
                            <li class="divider"></li>
                            <li><a href="in_all.jsp">入校申请</a></li>
                            <li class="divider"></li>
                            <li><a href="back_all.jsp">寒暑假返校申请</a></li>
                        </ul>
                    </li>
                    <li><a href="index1.jsp">疫情地图</a></li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown">
                            个人中心
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="Tinfo.jsp">个人信息</a></li>
                            <li class="divider"></li>
                            <li><a href="modifyPasswordT.jsp">修改密码</a></li>
                            <li class="divider"></li>
                            <li><a href="logout.jsp">登出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <form class="form-horizontal" method="post" onsubmit="check()" role="from" enctype="multipart/form-data">
        <div class="form-group">
            <label class="col-sm-4 control-label">旧密码</label>
            <div class="col-sm-4">
                <input class="form-control" id="userpassword_old" name="userpassword_old" type="password" value=""
                    autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">新密码</label>
            <div class="col-sm-4">
                <input class="form-control" id="userpassword_new" name="userpassword_new" type="password" value=""
                    autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">确认密码</label>
            <div class="col-sm-4">
                <input class="form-control" id="userpassword_confirm" name="userpassword_confirm" type="password"
                    value="" autocomplete="off">
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
        function check() {
            var Inputs = document.getElementsByTagName("input");
            if (Inputs[0].value == "" || Inputs[0].value == null) {
                alert("请输入旧密码");
                return false;
            }
            var reg = /^(?![\d]+$)(?![a-z]+$)(?![A-Z]+$)(?![!#$%^&*]+$)[\da-zA-z!#$%^&*]{8,16}$/;
            var result = reg.test(Inputs[1].value);
            if (!result) {
                alert("密码中允许出现数字、大写字母、小写字母、特殊字符（!#$%^&*），但至少包含其中2种且长度在8-16之间");
                return;
            }
            if (Inputs[1].value != Inputs[2].value) {
                alert("新密码和确认密码不一致");
                return false;
            }
            console.log(Inputs);
            console.log(Inputs);
            $.ajax({
                type: "post",
                async: false,
                url: "passwordModify?userid=${currentUserid }",
                data: {
                    userpassword_old: Inputs[0].value,
                    userpassword_new: Inputs[1].value,
                    userpassword_confirm: Inputs[2].value
                },
                dataType: "json",
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
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