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

    <script type="text/javascript">
        function check() {
            var residentialaddress = $("#residentialaddress").val();
            var tutorapprovalvoucher = $("#tutorapprovalvoucher").val();
            var travelcard = $("#travelcard").val();
            var healthcodegreencode = $("#healthcodegreencode").val();
            var nucleicacidproof = $("#nucleicacidproof").val();

            if (residentialaddress == '' || residentialaddress == null) {
                alert("请填写现居住地!");
                return false;
            }
            if (tutorapprovalvoucher == '' || tutorapprovalvoucher == null) {
                alert("请提交导师审批凭证!");
                return false;
            }
            if (travelcard == '' || travelcard == null) {
                alert("请提交行程卡!");
                return false;
            }
            if (healthcodegreencode == '' || healthcodegreencode == null) {
                alert("请提交健康码绿码!");
                return false;
            }
            if (nucleicacidproof == '' || nucleicacidproof == null) {
                alert("请提交核酸检测证明!");
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

    <div align="center" style="padding-top: 10px;">
        <font color="#871F78" size="10">寒暑假返校申请表</font>
    </div>
    <form class="form-horizontal" action="TripbackSave" method="post" role="form" enctype="multipart/form-data">
        <div class="form-group">
            <label for="userid" class="col-sm-4 control-label">学号</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="" name="userid" value="${ currentUserid }" readonly>
            </div>
        </div>
        <div class="form-group">
            <label for="text" class="col-sm-4 control-label">提交时间</label>
            <div class="col-sm-4">
                <input type="datetime" class="form-control" id="subtime" name="subtime" value="" readonly>
            </div>
        </div>
        <div class="form-group">
            <label for="backtime" class="col-sm-4 control-label">返校时间</label>

            <div class="col-sm-4">
                <div class='input-group date' id='backtime'>
                    <input type='text' class="form-control" name="backtime" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="residentialaddress" class="col-sm-4 control-label">现居住地</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="residentialaddress" name="residentialaddress"
                    placeholder="请输入现居住地">
            </div>
        </div>
        <div class="form-group">
            <label for="tutorapprovalvoucher" class="col-sm-4 control-label">导师审批凭证</label>
            <div class="col-sm-4">
                <input type="file" id="tutorapprovalvoucher" name="tutorapprovalvoucher">
            </div>
        </div>
        <div class="form-group">
            <label for="travelcard" class="col-sm-4 control-label">行程卡</label>
            <div class="col-sm-4">
                <input type="file" id="travelcard" name="travelcard">
            </div>
        </div>
        <div class="form-group">
            <label for="healthcodegreencode" class="col-sm-4 control-label">健康码绿码</label>
            <div class="col-sm-4">
                <input type="file" id="healthcodegreencode" name="healthcodegreencode">
            </div>
        </div>
        <div class="form-group">
            <label for="nucleicacidproof" class="col-sm-4 control-label">核酸检测阴性证明</label>
            <div class="col-sm-4">
                <input type="file" id="nucleicacidproof" name="nucleicacidproof">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <button type="submit" onclick="return check();" class="btn btn-primary form-control">提交</button>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        $('#backtime').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            locale: moment.locale('zh-cn')
        });


        $(function () {
            var t = null;
            t = setTimeout(time, 1000); //開始运行
            function time() {
                clearTimeout(t); //清除定时器
                dt = new Date();
                var year = dt.getFullYear();
                var month = dt.getMonth() + 1; //(0-11,0代表1月)
                var date = dt.getDate(); //获取天
                var num = dt.getDay(); //获取星期
                var hour = dt.getHours(); //获取时
                var minute = dt.getMinutes(); //获取分
                var second = dt.getSeconds(); //获取秒
                //分秒时间是一位数字，在数字前补0。
                date = extra(date);
                month = extra(month);
                minute = extra(minute);
                second = extra(second);
                document.getElementById("subtime").value = year + "-" + month + "-" + date + " " + hour + ":" +
                    minute + ":" + second;
                t = setTimeout(time, 1000); //设定定时器，循环运行
            }

        });
        //补位函数。
        function extra(x) {
            //如果传入数字小于10，数字前补一位0。
            if (x < 10) {
                return "0" + x;
            } else {
                return x;
            }
        }
    </script>

</body>

</html>