<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
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

    <script type="text/javascript">
        function check() {
            var userid = $("#userid0").val();
            var userpasswd = $("#userpasswd0").val();
            var userpasswd1 = $("#userpasswd1").val();
            var username = $("#username").val();
            var userphone = $("#userphone").val();
            var usergender = $("#usergender").val();
            var userroom = $("#userroom").val();
            var userstatus = $("#userstatus").val();

            if (userid == "" || userid == null) {
                alert("请输入学号/工号");
                return false;
            }
            var reg = /^(?![\d]+$)(?![a-z]+$)(?![A-Z]+$)(?![!#$%^&*]+$)[\da-zA-z!#$%^&*]{8,16}$/;
            var result = reg.test(userpasswd);
            if (!result) {
                alert("密码中允许出现数字、大写字母、小写字母、特殊字符（!#$%^&*），但至少包含其中2种且长度在8-16之间");
                return false;
            }
            if (userpasswd1 != userpasswd) {
                alert("两次输入的密码不一致");
                return false;
            }
            if (username == "" || username == null) {
                alert("请输入姓名");
                return false;
            }
            var phoneReg = /^[1][3,4,5,7,8][0-9]{9}$/
            if (userphone == "" || userphone == null) {
                alert("号码不能为空");
                return false;
            }
            if (!phoneReg.test(userphone)) {
                alert("电话号码格式有误");
                return false;
            }
            if (userroom == "" || userroom == null) {
                alert("请输入房间号");
                return false;
            }
            if (userstatus == "" || userstatus == null) {
                alert("请输入身份");
                return false;
            }
            return true;
        }


        function check1() {
            var userid = $("#userid").val();
            var userpasswd = $("#userpasswd").val();
            if (userid == "" || userid == null) {
                alert("请输入学号/工号");
                return false;
            }
            if (userpasswd == "" || userpasswd == null) {
                alert("请输入密码");
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
    <script type="text/javascript" src="/js/canvas-nest.min.js" opacity=0.6></script>
    <!-- 顶部栏 -->
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="container-fluid">

            <h1 align="center" style="color:white;">学生行程管理系统登录页面</h1>

        </div>
    </nav>
    <div class="container mainbox" style="margin-top:150px">
        <div class="container">
            <!--代码部分-->
            <ul class="nav nav-tabs nav-justified">
                <li class="active" role="presentation"><a href="#first" data-toggle="tab">登录</a></li>
                <li role="presentation"><a href="#second" data-toggle="tab">注册</a></li>
            </ul>
            <!--标签页内容部分-->
            <div class="tab-content">
                <div class="tab-pane active" id="first" role="tabpanel">
                    <div class="row">
                        <div class="col-lg-4 col-md-3 col-sm-1"></div>
                        <div class="col-lg-4 col-md-6 col-sm-10">
                            <form class="form-horizontal" action="Login" method="post" role="from" id="form-test">
                                <div class="form-group" align=center>
                                    <img src="images/siaty.png" style="height:200px">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="userid" name="userid" placeholder="账号">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="userpasswd" name="userpasswd"
                                        placeholder="密码">
                                </div>
                                <div class="form-group">
                                    <button onclick="return check1();" type="submit"
                                        class="btn btn-primary form-control">登录</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-4 col-md-3 col-sm-1"></div>
                    </div>
                </div>
                <div class="tab-pane fade" id="second" role="tabpanel">
                    <div class="row">
                        <div class="col-lg-4 col-md-3 col-sm-1"></div>
                        <div class="col-lg-4 col-md-6 col-sm-10">
                            <form class="form-horizontal" action="Register" method="post" role="from" id="form-test">
                                <div class="form-group" align=center>
                                    <img src="images/siaty.png" style="height:200px">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="userid0" name="userid0"
                                        placeholder="账号">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="userpasswd0" name="userpasswd0"
                                        placeholder="密码">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="userpasswd1" name="userpasswd1"
                                        placeholder="确认密码">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="username" name="username"
                                        placeholder="姓名">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="userphone" name="userphone"
                                        placeholder="联系方式">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="usergender" name="usergender"
                                        placeholder="性别">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="userroom" name="userroom"
                                        placeholder="房间号">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="userstatus" name="userstatus"
                                        placeholder="身份">
                                </div>
                                <div class="form-group">
                                    <button onclick="return check();" type="submit"
                                        class="btn btn-primary form-control">注册</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-4 col-md-3 col-sm-1"></div>
                    </div>
                </div>
            </div>

        </div>



    </div>
    <div>
        <script>
            var error = '<%=request.getAttribute("error")%>'
            if (error != "null") {
                alert(error);
            }
        </script>
        <script>
            var error1 = '<%=request.getAttribute("error1")%>'
            if (error1 != "null") {
                alert(error1);
            }
        </script>
    </div>
</body>

</html>