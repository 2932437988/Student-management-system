<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的申请</title>
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

    <!-- 入校0 -->
    <div style="text-align:center;">
        <h2>入校申请记录</h2>
    </div>
    <div>

        <table id="table0" class="table table-striped"></table>
    </div>

    <div class="modal fade" id="cancelModal0" tabindex="-1" role="dialog" aria-labelledby="myModalLabel0"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel0">取消</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="userid0">学号</label>
                        <input id="userid0" name="userid0" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="subtime0">提交时间</label>
                        <input id="subtime0" name="subtime0" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group" hidden=true>
                        <label for="category0">类别</label>
                        <input id="category0" name="category0" type="text" class="form-control" readonly />
                    </div>
                    <div>
                        确认取消?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="cancelTripIn()">确定</button>
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

    <div class="modal fade" id="cancelModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel1">取消</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="userid1">学号</label>
                        <input id="userid1" name="userid1" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="subtime0">提交时间</label>
                        <input id="subtime1" name="subtime1" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group" hidden=true>
                        <label for="category1">类别</label>
                        <input id="category1" name="category1" type="text" class="form-control" readonly />
                    </div>
                    <div>
                        确认取消?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="cancelTripOut()">确定</button>
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

    <div class="modal fade" id="cancelModal0" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel2">取消</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="userid0">学号</label>
                        <input id="userid0" name="userid0" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="subtime0">提交时间</label>
                        <input id="subtime0" name="subtime0" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group" hidden=true>
                        <label for="category0">类别</label>
                        <input id="category0" name="category0" type="text" class="form-control" readonly />
                    </div>
                    <div>
                        确认取消?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="cancelTripIn()">确定</button>
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
                '<button id="cancel0" type="button" class="btn btn-xs btn-danger glyphicon glyphicon-cancel" style="margin:5px" title="删除"></button>';
            return result;
        }
        window.operateEvents0 = {


            'click #cancel0': function (e, value, row, index) {
                $("#userid0").val(row.userid);
                $("#subtime0").val(row.subtime);
                $("#category0").val(row.category);
                $("#cancelModal0").modal();
            },



        };

        function addFunctionAlty1(value, row, index) {
            var result = "";
            result +=
                '<button id="cancel1" type="button" class="btn btn-xs btn-danger glyphicon glyphicon-cancel" style="margin:5px" title="删除"></button>';
            return result;
        }
        window.operateEvents1 = {


            'click #cancel1': function (e, value, row, index) {
                $("#userid1").val(row.userid);
                $("#subtime1").val(row.subtime);
                $("#category1").val(row.category);
                $("#cancelModal1").modal();
            },



        };

        function addFunctionAlty2(value, row, index) {
            var result = "";
            result +=
                '<button id="cancel2" type="button" class="btn btn-xs btn-danger glyphicon glyphicon-cancel" style="margin:5px" title="删除"></button>';
            return result;
        }
        window.operateEvents2 = {


            'click #cancel2': function (e, value, row, index) {
                $("#userid2").val(row.userid);
                $("#subtime2").val(row.subtime);
                $("#category2").val(row.category);
                $("#cancelModal2").modal();
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
            $("#table0").bootstrapTable("hideLoading");
            $("#table1").bootstrapTable("hideLoading");
            $("#table2").bootstrapTable("hideLoading");
            oTable0.Init();
            oTable1.Init();
            oTable2.Init();
        });

        function TableInit0() {

            $('#table0').bootstrapTable({
                url: 'myTripInList?userid=${currentUserid}', // 表格数据来源
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
                url: 'myTripOutList?userid=${currentUserid}', // 表格数据来源
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
                url: 'myTripBackList?userid=${currentUserid}', // 表格数据来源
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


        //删除信息
        function cancelTripIn() {
            $.ajax({
                type: 'post',
                url: 'myTripCancel',
                dataType: 'json',
                data: {
                    userid: $('#userid0').val(),
                    subtime: $('#subtime0').val(),
                    category: $('#category0').val(),
                    approve: "-2"
                },
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
                        return;
                    } else {
                        $('#cancelModal0').modal('hide');
                        alert("取消成功");
                        $('#table0').bootstrapTable('refresh');
                    }
                }
            })

        }


        function cancelTripOut() {
            $.ajax({
                type: 'post',
                url: 'myTripCancel',
                dataType: 'json',
                data: {
                    userid: $('#userid1').val(),
                    subtime: $('#subtime1').val(),
                    category: $('#category1').val(),
                    approve: "-2"
                },
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
                        return;
                    } else {
                        $('#cancelModal1').modal('hide');
                        alert("取消成功");
                        $('#table1').bootstrapTable('refresh');
                    }
                }
            })

        }

        function cancelTripBack() {
            $.ajax({
                type: 'post',
                url: 'myTripCancel',
                dataType: 'json',
                data: {
                    userid: $('#userid2').val(),
                    subtime: $('#subtime2').val(),
                    category: $('#category2').val(),
                    approve: "-2"
                },
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
                        return;
                    } else {
                        $('#cancelModal2').modal('hide');
                        alert("取消成功");
                        $('#table2').bootstrapTable('refresh');
                    }
                }
            })

        }
    </script>

</body>

</html>