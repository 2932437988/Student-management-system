<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>未审批申请</title>
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


    <!-- 入校0 -->
    <div style="text-align:center;">
        <h2>入校申请记录</h2>
    </div>
    <div>

        <table id="table0" class="table table-striped"></table>
    </div>

    <div class="modal fade" id="ModalY0" tabindex="-1" role="dialog" aria-labelledby="myModalLabelY0"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabelY0">审批</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="useridY0">学号</label>
                        <input id="useridY0" name="useridY0" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="subtimeY0">提交时间</label>
                        <input id="subtimeY0" name="subtimeY0" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group" hidden=true>
                        <label for="categoryY0">类别</label>
                        <input id="categoryY0" name="categoryY0" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="opinionY0">审批意见</label>
                        <input id="opinionY0" name="opinionY0" type="text" class="form-control" />
                    </div>
                    <div>
                        确认通过?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="TripY0()">确认</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalN0" tabindex="-1" role="dialog" aria-labelledby="myModalLabelN0"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabelN0">审批</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="useridN0">学号</label>
                        <input id="useridN0" name="useridN0" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="subtimeN0">提交时间</label>
                        <input id="subtimeN0" name="subtimeN0" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group" hidden=true>
                        <label for="categoryN0">类别</label>
                        <input id="categoryN0" name="categoryN0" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="opinionN0">审批意见</label>
                        <input id="opinionN0" name="opinionN0" type="text" class="form-control" />
                    </div>
                    <div>
                        确认不通过?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="TripN0()">确认</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- 离校1 -->
    <div style="text-align:center;">
        <h2>离校申请记录</h2>
    </div>
    <div>

        <table id="table1" class="table table-striped"></table>
    </div>

    <div class="modal fade" id="ModalY1" tabindex="-1" role="dialog" aria-labelledby="myModalLabelY1"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabelY1">审批</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="useridY1">学号</label>
                        <input id="useridY1" name="useridY1" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="subtimeY1">提交时间</label>
                        <input id="subtimeY1" name="subtimeY1" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group" hidden=true>
                        <label for="categoryY1">类别</label>
                        <input id="categoryY1" name="categoryY1" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="opinionY1">审批意见</label>
                        <input id="opinionY1" name="opinionY1" type="text" class="form-control" />
                    </div>
                    <div>
                        确认通过?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="TripY1()">确认</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalN1" tabindex="-1" role="dialog" aria-labelledby="myModalLabelN1"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabelN1">审批</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="useridN1">学号</label>
                        <input id="useridN1" name="useridN1" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="subtimeN1">提交时间</label>
                        <input id="subtimeN1" name="subtimeN1" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group" hidden=true>
                        <label for="categoryN1">类别</label>
                        <input id="categoryN1" name="categoryN1" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="opinionN1">审批意见</label>
                        <input id="opinionN1" name="opinionN1" type="text" class="form-control" />
                    </div>
                    <div>
                        确认不通过?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="TripN1()">确认</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- 返校2 -->
    <div style="text-align:center;">
        <h2>返校申请记录</h2>
    </div>
    <div>

        <table id="table2" class="table table-striped"></table>
    </div>

    <div class="modal fade" id="ModalY2" tabindex="-1" role="dialog" aria-labelledby="myModalLabelY2"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabelY2">审批</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="useridY2">学号</label>
                        <input id="useridY2" name="useridY2" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="subtimeY2">提交时间</label>
                        <input id="subtimeY2" name="subtimeY2" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group" hidden=true>
                        <label for="categoryY2">类别</label>
                        <input id="categoryY2" name="categoryY2" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="opinionY2">审批意见</label>
                        <input id="opinionY2" name="opinionY2" type="text" class="form-control" />
                    </div>
                    <div>
                        确认通过?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="TripY2()">确认</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalN2" tabindex="-1" role="dialog" aria-labelledby="myModalLabelN2"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabelN2">审批</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="useridN2">学号</label>
                        <input id="useridN2" name="useridN2" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="subtimeN2">提交时间</label>
                        <input id="subtimeN2" name="subtimeN2" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group" hidden=true>
                        <label for="categoryN2">类别</label>
                        <input id="categoryN2" name="categoryN2" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="opinionN2">审批意见</label>
                        <input id="opinionN2" name="opinionN2" type="text" class="form-control" />
                    </div>
                    <div>
                        确认不通过?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="TripN2()">确认</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript">
        //表格中按钮
        //入校0
        function addFunctionAlty0(value, row, index) {
            var result = "";
            result +=
                '<button id="Y0" type="button" class="btn btn-xs btn-success glyphicon glyphicon-ok" style="margin:5px" title="通过"></button>';
            result +=
                '<button id="N0" type="button" class="btn btn-xs btn-danger glyphicon glyphicon-remove" style="margin:5px" title="不通过"></button>';
            return result;
        }
        window.operateEvents0 = {


            'click #Y0': function (e, value, row, index) {
                $("#useridY0").val(row.userid);
                $("#subtimeY0").val(row.subtime);
                $("#categoryY0").val(row.category);
                $("#ModalY0").modal();
            },
            'click #N0': function (e, value, row, index) {
                $("#useridN0").val(row.userid);
                $("#subtimeN0").val(row.subtime);
                $("#categoryN0").val(row.category);
                $("#ModalN0").modal();
            },



        };

        function addFunctionAlty1(value, row, index) {
            var result = "";
            result +=
                '<button id="Y1" type="button" class="btn btn-xs btn-success glyphicon glyphicon-ok" style="margin:5px" title="通过"></button>';
            result +=
                '<button id="N1" type="button" class="btn btn-xs btn-danger glyphicon glyphicon-remove" style="margin:5px" title="不通过"></button>';

            return result;
        }
        window.operateEvents1 = {


            'click #Y1': function (e, value, row, index) {
                $("#useridY1").val(row.userid);
                $("#subtimeY1").val(row.subtime);
                $("#categoryY1").val(row.category);
                $("#ModalY1").modal();
            },
            'click #N1': function (e, value, row, index) {
                $("#useridN1").val(row.userid);
                $("#subtimeN1").val(row.subtime);
                $("#categoryN1").val(row.category);
                $("#ModalN1").modal();
            },



        };

        function addFunctionAlty2(value, row, index) {
            var result = "";
            result +=
                '<button id="Y2" type="button" class="btn btn-xs btn-success glyphicon glyphicon-ok" style="margin:5px" title="通过"></button>';
            result +=
                '<button id="N2" type="button" class="btn btn-xs btn-danger glyphicon glyphicon-remove" style="margin:5px" title="不通过"></button>';
            return result;
        }
        window.operateEvents2 = {


            'click #Y2': function (e, value, row, index) {
                $("#useridY2").val(row.userid);
                $("#subtimeY2").val(row.subtime);
                $("#categoryY2").val(row.category);
                $("#ModalY2").modal();
            },
            'click #N2': function (e, value, row, index) {
                $("#useridN2").val(row.userid);
                $("#subtimeN2").val(row.subtime);
                $("#categoryN2").val(row.category);
                $("#ModalN2").modal();
            },



        };
        $(function () {
            $("#table0").bootstrapTable('destroy');
            $("#table1").bootstrapTable('destroy');
            $("#table2").bootstrapTable('destroy');
            //1.初始化表格
            var oTable0 = new TableInit0();

            var oTable1 = new TableInit1();

            var oTable2 = new TableInit2();
            oTable0.Init();
            oTable1.Init();
            oTable2.Init();
        });

        function TableInit0() {

            $('#table0').bootstrapTable({
                url: 'userTripInNo', // 表格数据来源
                method: 'post',
                async: true,
                //toolbar: '#toolbar0', //工具按钮用哪个容器
                //height:500,//行高
                striped: true, //是否显示行间隔色
                cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true, //是否显示分页（*）
                sortable: false, //是否启用排序
                sortOrder: "asc", //排序方式
                pageNumber: 1, //初始化加载第一页，默认第一页
                pageSize: 5, //每页的记录行数（*）
                pageList: [5, 10, 25, 50, 100, 'All'], //可供选择的每页的行数（*）
                queryParamsType: '', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
                // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
                //queryParams: queryParams,//前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
                sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                paginationPreText: '<', //上一页按钮样式

                paginationNextText: '>', //下一页按钮样式
                search: false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: true, //是否显示所有的列
                minimumCountColumns: 2, //最少允许的列数
                clickToSelect: true, //是否启用点击选中行
                searchOnEnterKey: true,
                showToggle: true, //是否显示详细视图和列表视图的切换按钮
                showRefresh: true, //是否显示刷新按钮
                cardView: false, //是否显示详细视图
                singleSelect: true, //禁止多选
                clickToSelect: true, //是否启用点击选中行
                detailView: false, //是否显示父子表
                showExport: true, //导出
                uniqueId: "userid", //每一行的唯一标识，一般为主键列

                columns: [{
                    checkbox: true
                }, {
                    field: 'userid',
                    title: '学号'
                }, {
                    field: 'username',
                    title: '姓名'
                }, {
                    field: 'userphone',
                    title: '联系方式'
                }, {
                    field: 'usergender',
                    title: '性别'
                }, {
                    field: 'userroom',
                    title: '房间号'
                }, {
                    field: 'userstatus',
                    title: '身份'
                }, {
                    field: 'subtime',
                    title: '提交时间'
                }, {
                    field: 'category',
                    title: '类别',
                    visible: false
                }, {
                    field: 'admissiontime',
                    title: '入校时间'

                }, {
                    field: 'admissionreason',
                    title: '入校事由'
                }, {
                    field: 'residentialaddress',
                    title: '现居住地'
                }, {
                    field: 'tutorapprovalvoucher',
                    title: '导师审批凭证',
                    formatter: function (value, row, index) {
                        var s = '<a class="view" href="javascript:viod(0)">' +
                            '<img style="width:300;height:40px;" src="' + value + '"/>' +
                            '</a>';
                        return s;
                    }
                }, {
                    field: 'travelcard',
                    title: '行程卡',
                    formatter: function (value, row, index) {
                        var s = '<a class="view" href="javascript:viod(0)">' +
                            '<img style="width:300;height:40px;" src="' + value + '"/>' +
                            '</a>';
                        return s;
                    }
                }, {
                    field: 'healthcodegreencode',
                    title: '健康码绿码',
                    formatter: function (value, row, index) {
                        var s = '<a class="view" href="javascript:viod(0)">' +
                            '<img style="width:300;height:40px;" src="' + value + '"/>' +
                            '</a>';
                        return s;
                    }
                }, {
                    field: 'nucleicacidproof',
                    title: '核酸检测阴性证明',
                    formatter: function (value, row, index) {
                        var s = '<a class="view" href="javascript:viod(0)">' +
                            '<img style="width:300;height:40px;" src="' + value + '"/>' +
                            '</a>';
                        return s;
                    }
                }, {
                    field: 'approve',
                    title: '审批',
                    visible: false
                }, {
                    field: 'a',
                    title: '审批状态'
                }, {
                    field: 'opinion',
                    title: '审批意见'
                }, {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    events: operateEvents0,
                    formatter: addFunctionAlty0 //表格中增加按钮
                }],

            });





        };



        function TableInit1() {

            $('#table1').bootstrapTable({
                url: 'userTripOutNo', // 表格数据来源
                method: 'post',
                async: true,
                //toolbar: '#toolbar1', //工具按钮用哪个容器
                //height:500,//行高
                striped: true, //是否显示行间隔色
                cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true, //是否显示分页（*）
                sortable: false, //是否启用排序
                sortOrder: "asc", //排序方式
                pageNumber: 1, //初始化加载第一页，默认第一页
                pageSize: 5, //每页的记录行数（*）
                pageList: [5, 10, 25, 50, 100, 'All'], //可供选择的每页的行数（*）
                queryParamsType: '', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
                // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
                //queryParams: queryParams,//前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
                sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                paginationPreText: '<', //上一页按钮样式

                paginationNextText: '>', //下一页按钮样式
                search: false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: true, //是否显示所有的列
                minimumCountColumns: 2, //最少允许的列数
                clickToSelect: true, //是否启用点击选中行
                searchOnEnterKey: true,
                showToggle: true, //是否显示详细视图和列表视图的切换按钮
                showRefresh: true, //是否显示刷新按钮
                cardView: false, //是否显示详细视图
                singleSelect: true, //禁止多选
                clickToSelect: true, //是否启用点击选中行
                detailView: false, //是否显示父子表
                showExport: true, //导出
                uniqueId: "userid", //每一行的唯一标识，一般为主键列

                columns: [{
                    checkbox: true
                }, {
                    field: 'userid',
                    title: '学号'
                }, {
                    field: 'username',
                    title: '姓名'
                }, {
                    field: 'userphone',
                    title: '联系方式'
                }, {
                    field: 'usergender',
                    title: '性别'
                }, {
                    field: 'userroom',
                    title: '房间号'
                }, {
                    field: 'userstatus',
                    title: '身份'
                }, {
                    field: 'subtime',
                    title: '提交时间'
                }, {
                    field: 'category',
                    title: '类别',
                    visible: false
                }, {
                    field: 'starttime',
                    title: '开始时间'

                }, {
                    field: 'endtime',
                    title: '结束时间'
                }, {
                    field: 'destination',
                    title: '目的地'
                }, {
                    field: 'outreason',
                    title: '外出事由'
                }, {
                    field: 'letterofcommitment',
                    title: '离园承诺书',
                    formatter: function (value, row, index) {
                        var s = '<a class="view" href="javascript:viod(0)">' +
                            '<img style="width:300;height:40px;" src="' + value + '"/>' +
                            '</a>';
                        return s;
                    }
                }, {
                    field: 'tutorapprovalvoucher',
                    title: '导师审批凭证',
                    formatter: function (value, row, index) {
                        var s = '<a class="view" href="javascript:viod(0)">' +
                            '<img style="width:300;height:40px;" src="' + value + '"/>' +
                            '</a>';
                        return s;
                    }
                }, {
                    field: 'approve',
                    title: '审批',
                    visible: false
                }, {
                    field: 'a',
                    title: '审批状态'
                }, {
                    field: 'opinion',
                    title: '审批意见'
                }, {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    events: operateEvents1,
                    formatter: addFunctionAlty1 //表格中增加按钮
                }],

            });





        };





        function TableInit2() {

            $('#table2').bootstrapTable({
                url: 'userTripBackNo', // 表格数据来源
                method: 'post',
                async: true,
                //toolbar: '#toolbar2', //工具按钮用哪个容器
                //height:500,//行高
                striped: true, //是否显示行间隔色
                cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true, //是否显示分页（*）
                sortable: false, //是否启用排序
                sortOrder: "asc", //排序方式
                pageNumber: 1, //初始化加载第一页，默认第一页
                pageSize: 5, //每页的记录行数（*）
                pageList: [5, 10, 25, 50, 100, 'All'], //可供选择的每页的行数（*）
                queryParamsType: '', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
                // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
                //queryParams: queryParams,//前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
                sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                paginationPreText: '<', //上一页按钮样式

                paginationNextText: '>', //下一页按钮样式
                search: false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: true, //是否显示所有的列
                minimumCountColumns: 2, //最少允许的列数
                clickToSelect: true, //是否启用点击选中行
                searchOnEnterKey: true,
                showToggle: true, //是否显示详细视图和列表视图的切换按钮
                showRefresh: true, //是否显示刷新按钮
                cardView: false, //是否显示详细视图
                singleSelect: true, //禁止多选
                clickToSelect: true, //是否启用点击选中行
                detailView: false, //是否显示父子表
                showExport: true, //导出
                uniqueId: "userid", //每一行的唯一标识，一般为主键列

                columns: [{
                    checkbox: true
                }, {
                    field: 'userid',
                    title: '学号'
                }, {
                    field: 'username',
                    title: '姓名'
                }, {
                    field: 'userphone',
                    title: '联系方式'
                }, {
                    field: 'usergender',
                    title: '性别'
                }, {
                    field: 'userroom',
                    title: '房间号'
                }, {
                    field: 'userstatus',
                    title: '身份'
                }, {
                    field: 'subtime',
                    title: '提交时间'
                }, {
                    field: 'category',
                    title: '类别',
                    visible: false
                }, {
                    field: 'backtime',
                    title: '返校时间'

                }, {
                    field: 'residentialaddress',
                    title: '现居住地'
                }, {
                    field: 'tutorapprovalvoucher',
                    title: '导师审批凭证',
                    formatter: function (value, row, index) {
                        var s = '<a class="view" href="javascript:viod(0)">' +
                            '<img style="width:300;height:40px;" src="' + value + '"/>' +
                            '</a>';
                        return s;
                    }
                }, {
                    field: 'travelcard',
                    title: '行程卡',
                    formatter: function (value, row, index) {
                        var s = '<a class="view" href="javascript:viod(0)">' +
                            '<img style="width:300;height:40px;" src="' + value + '"/>' +
                            '</a>';
                        return s;
                    }
                }, {
                    field: 'healthcodegreencode',
                    title: '健康码绿码',
                    formatter: function (value, row, index) {
                        var s = '<a class="view" href="javascript:viod(0)">' +
                            '<img style="width:300;height:40px;" src="' + value + '"/>' +
                            '</a>';
                        return s;
                    }
                }, {
                    field: 'nucleicacidproof',
                    title: '核酸检测阴性证明',
                    formatter: function (value, row, index) {
                        var s = '<a class="view" href="javascript:viod(0)">' +
                            '<img style="width:300;height:40px;" src="' + value + '"/>' +
                            '</a>';
                        return s;
                    }
                }, {
                    field: 'approve',
                    title: '审批',
                    visible: false
                }, {
                    field: 'a',
                    title: '审批状态'
                }, {
                    field: 'opinion',
                    title: '审批意见'
                }, {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    events: operateEvents2,
                    formatter: addFunctionAlty2 //表格中增加按钮
                }],

            });





        };


        //审批

        function TripY0() {
            var data = {
                userid: $('#useridY0').val(),
                subtime: $('#subtimeY0').val(),
                category: $('#categoryY0').val(),
                approve: "1",
                opinion: $('#opinionY0').val()
            }
            if (data.approve == "") {
                alert("NO1");
                return;
            }
            if (data.opinion == "") {
                alert("NO2");
                return;
            }
            $.ajax({
                type: 'post',
                url: 'tripAllSave',
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
                        return;
                    } else {
                        $('#ModalY0').modal('hide');
                        alert("审批成功");
                        $('#table0').bootstrapTable('refresh');
                    }
                }
            })

        }

        function TripY1() {
            var data = {
                userid: $('#useridY1').val(),
                subtime: $('#subtimeY1').val(),
                category: $('#categoryY1').val(),
                approve: "1",
                opinion: $('#opinionY1').val()
            }
            if (data.approve == "") {
                alert("NO1");
                return;
            }
            if (data.opinion == "") {
                alert("NO2");
                return;
            }
            $.ajax({
                type: 'post',
                url: 'tripAllSave',
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
                        return;
                    } else {
                        $('#ModalY1').modal('hide');
                        alert("审批成功");
                        $('#table1').bootstrapTable('refresh');
                    }
                }
            })

        }

        function TripY2() {
            var data = {
                userid: $('#useridY2').val(),
                subtime: $('#subtimeY2').val(),
                category: $('#categoryY2').val(),
                approve: "1",
                opinion: $('#opinionY2').val()
            }
            if (data.approve == "") {
                alert("NO1");
                return;
            }
            if (data.opinion == "") {
                alert("NO2");
                return;
            }
            $.ajax({
                type: 'post',
                url: 'tripAllSave',
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
                        return;
                    } else {
                        $('#ModalY2').modal('hide');
                        alert("审批成功");
                        $('#table2').bootstrapTable('refresh');
                    }
                }
            })

        }

        function TripN0() {
            var data = {
                userid: $('#useridN0').val(),
                subtime: $('#subtimeN0').val(),
                category: $('#categoryN0').val(),
                approve: "0",
                opinion: $('#opinionN0').val()
            }
            if (data.opinion == "") {
                alert("请输入审批意见");
                return;
            }
            $.ajax({
                type: 'post',
                url: 'tripAllSave',
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
                        return;
                    } else {
                        $('#ModalN0').modal('hide');
                        alert("审批成功");
                        $('#table0').bootstrapTable('refresh');
                    }
                }
            })

        }

        function TripN1() {
            var data = {
                userid: $('#useridN1').val(),
                subtime: $('#subtimeN1').val(),
                category: $('#categoryN1').val(),
                approve: "0",
                opinion: $('#opinionN1').val()
            }
            if (data.opinion == "") {
                alert("请输入审批意见");
                return;
            }
            $.ajax({
                type: 'post',
                url: 'tripAllSave',
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
                        return;
                    } else {
                        $('#ModalN1').modal('hide');
                        alert("审批成功");
                        $('#table1').bootstrapTable('refresh');
                    }
                }
            })

        }

        function TripN2() {
            var data = {
                userid: $('#useridN2').val(),
                subtime: $('#subtimeN2').val(),
                category: $('#categoryN2').val(),
                approve: "0",
                opinion: $('#opinionN2').val()
            }
            if (data.opinion == "") {
                alert("请输入审批意见");
                return;
            }
            $.ajax({
                type: 'post',
                url: 'tripAllSave',
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
                        return;
                    } else {
                        $('#ModalN2').modal('hide');
                        alert("审批成功");
                        $('#table2').bootstrapTable('refresh');
                    }
                }
            })

        }
    </script>

</body>

</html>