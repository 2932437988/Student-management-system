<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户信息</title>
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
                <a class="navbar-brand" href="Admin.jsp">首页</a>
            </div>
            <div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="user.jsp">用户</a></li>
                    <li><a href="trip.jsp">申请</a></li>
                    <li><a href="index2.jsp">疫情地图</a></li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown">
                            个人中心
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="Ainfo.jsp">个人信息</a></li>
                            <li class="divider"></li>
                            <li><a href="modifyPasswordA.jsp">修改密码</a></li>
                            <li class="divider"></li>
                            <li><a href="logout.jsp">登出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 按钮 -->
    <div>
        <div id="toolbar" class="btn-group">
            <button id="btn_add" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button id="btn_edit" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
        </div>
        <table id="table" class="table table-striped" data-toolbar="#toolbar"></table>
    </div>

    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">增加用户</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="userid0">学号</label>
                        <input id="userid0" name="userid0" type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="userlevel0">用户等级</label>
                        <select id="userlevel0" class="form-control">
                            <option value="">请选择...</option>
                            <option value="0">普通用户</option>
                            <option value="1">管理员</option>
                            <option value="2">高级管理员</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="username0">姓名</label>
                        <input id="username0" type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="userphone0">联系方式</label>
                        <input id="userphone0" type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="usergender0">性别</label>
                        <select id="usergender0" class="form-control">
                            <option value="">请选择...</option>
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="userroom0">房间号</label>
                        <input id="userroom0" type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="userstatus0">身份</label>
                        <input id="userstatus0" type="text" class="form-control" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="addUser()">添加</button>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="showModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">展示</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="userid">学号</label>
                        <input id="userid" name="userid" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="level">用户等级</label>
                        <input id="level" name="level" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="username">姓名</label>
                        <input id="username" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="userphone">联系方式</label>
                        <input id="userphone" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="usergender">性别</label>
                        <input id="usergender" name="usergender" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="userroom">房间号</label>
                        <input id="userroom" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="userstatus">身份</label>
                        <input id="userstatus" type="text" class="form-control" readonly />
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">编辑</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="userid1">学号</label>
                        <input id="userid1" name="userid1" type="text" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="userlevel1">用户等级</label>
                        <select id="userlevel1" class="form-control">
                            <option value="">请选择...</option>
                            <option value="0">普通用户</option>
                            <option value="1">管理员</option>
                            <option value="2">高级管理员</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="username1">姓名</label>
                        <input id="username1" type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="userphone1">联系方式</label>
                        <input id="userphone1" type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="usergender1">性别</label>
                        <select id="usergender1" class="form-control">
                            <option value="">请选择...</option>
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="userroom1">房间号</label>
                        <input id="userroom1" type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="userstatus1">身份</label>
                        <input id="userstatus1" type="text" class="form-control" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="editUser()">修改</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">删除</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="userid2">学号</label>
                        <input id="userid2" name="userid2" type="text" class="form-control" readonly />
                    </div>
                    <div>
                        确认删除?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="deleteUser()">删除</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="resetModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">重置密码</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="userid3">学号</label>
                        <input id="userid3" name="userid3" type="text" class="form-control" readonly />
                    </div>
                    <div>
                        确认重置密码?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="resetUser()">重置</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        //表格中按钮
        function addFunctionAlty(value, row, index) {
            var result = "";
            result +=
                '<button id="show" type="button" class="btn btn-xs btn-success glyphicon glyphicon-search" style="margin:5px" data-toggle="modal" title="查看"></button>';
            result +=
                '<button id="edit" type="button" class="btn btn-xs btn-info glyphicon glyphicon-pencil" style="margin:5px" data-toggle="modal" title="编辑"></button>';
            result +=
                '<button id="delete" type="button" class="btn btn-xs btn-danger glyphicon glyphicon-remove" style="margin:5px" title="删除"></button>';
            result +=
                '<button id="reset" type="button" class="btn btn-xs btn-warning glyphicon glyphicon-repeat" style="margin:5px" title="重置密码"></button>';
            return result;
        }
        window.operateEvents = {
            "click #show": function (e, value, row, index) {
                $("#userid").val(row.userid);
                $("#level").val(row.level);
                $("#username").val(row.username);
                $("#userphone").val(row.userphone);
                $("#usergender").val(row.usergender);
                $("#userroom").val(row.userroom);
                $("#userstatus").val(row.userstatus);
                $("#showModal").modal();
            },
            'click #edit': function (e, value, row, index) {
                $("#userid1").val(row.userid);
                $("#userlevel1").val(row.userlevel);
                $("#username1").val(row.username);
                $("#userphone1").val(row.userphone);
                $("#usergender1").val(row.usergender);
                $("#userroom1").val(row.userroom);
                $("#userstatus1").val(row.userstatus);
                $("#editModal").modal();
            },
            'click #delete': function (e, value, row, index) {
                $("#userid2").val(row.userid);
                $("#deleteModal").modal();
            },
            'click #reset': function (e, value, row, index) {
                $("#userid3").val(row.userid);
                $("#resetModal").modal();
            }
        };
        $(function () {
            $("#table").bootstrapTable('destroy');
            //1.初始化表格
            var oTable = new TableInit();
            oTable.Init();

        });

        function TableInit() {

            $('#table').bootstrapTable({
                url: 'userAll', // 表格数据来源
                method: 'post',
                async: true,
                toolbar: '#toolbar', //工具按钮用哪个容器
                striped: true, //是否显示行间隔色
                cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true, //是否显示分页（*）
                sortable: false, //是否启用排序
                sortOrder: "asc", //排序方式
                pageNumber: 1, //初始化加载第一页，默认第一页
                pageSize: 10, //每页的记录行数（*）
                pageList: [10, 25, 50, 100, 'All'], //可供选择的每页的行数（*）
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
                    field: 'level',
                    title: '用户等级'
                }, {
                    field: 'userlevel',
                    title: '等级',
                    visible: false
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
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    events: operateEvents,
                    formatter: addFunctionAlty //表格中增加按钮
                }],

            });



            $('#btn_add').click(function () {
                $("#addModal").modal();
            });
            $('#btn_edit').click(function () {
                var row = $("#table").bootstrapTable('getSelections');
                if (row.length != 1) {
                    alert("请选择一行数据");
                    return;
                }
                row = row[0];
                $("#userid1").val(row.userid);
                $("#userlevel1").val(row.userlevel);
                $("#username1").val(row.username);
                $("#userphone1").val(row.userphone);
                $("#usergender1").val(row.usergender);
                $("#userroom1").val(row.userroom);
                $("#userstatus1").val(row.userstatus);
                $("#editModal").modal();
            });
            $('#btn_delete').click(function () {
                var row = $("#table").bootstrapTable('getSelections');
                if (row.length != 1) {
                    alert("请选择一行数据");
                    return;
                }
                row = row[0];
                $("#userid2").val(row.userid);
                $("#deleteModal").modal();
            });
        };

        //添加用户
        function addUser() {
            var data = {
                userid: $('#userid0').val(),
                userlevel: $('#userlevel0').val(),
                username: $('#username0').val(),
                userphone: $('#userphone0').val(),
                usergender: $('#usergender0').val(),
                userroom: $('#userroom0').val(),
                userstatus: $('#userstatus0').val(),
            }
            if (data.userid == "") {
                alert("学号为空！");
                return;
            }
            if (data.userlevel == "") {
                alert("用户等级为空！");
                return;
            }
            if (data.username == "") {
                alert("姓名为空！");
                return;
            }
            if (data.userphone == "") {
                alert("联系方式为空！");
                return;
            }
            if (data.usergender == "") {
                alert("性别为空！");
                return;
            }
            if (data.userroom == "") {
                alert("房间号为空！");
                return;
            }
            if (data.userstatus == "") {
                alert("身份为空！");
                return;
            }
            $.ajax({
                type: 'post',
                url: 'userAdd',
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
                        return;
                    } else {
                        alert("添加成功");
                        $('#table').bootstrapTable('refresh');
                        $('#addModal').modal('hide');
                    }
                }
            })
        }

        //修改信息
        function editUser() {
            var data = {
                userid: $('#userid1').val(),
                userlevel: $('#userlevel1').val(),
                username: $('#username1').val(),
                userphone: $('#userphone1').val(),
                usergender: $('#usergender1').val(),
                userroom: $('#userroom1').val(),
                userstatus: $('#userstatus1').val(),
            }
            if (data.userid == "") {
                alert("学号为空！");
                return;
            }
            if (data.userlevel == "") {
                alert("用户等级为空！");
                return;
            }
            if (data.username == "") {
                alert("姓名为空！");
                return;
            }
            if (data.userphone == "") {
                alert("联系方式为空！");
                return;
            }
            if (data.usergender == "") {
                alert("性别为空！");
                return;
            }
            if (data.userroom == "") {
                alert("房间号为空！");
                return;
            }
            if (data.userstatus == "") {
                alert("身份为空！");
                return;
            }
            $.ajax({
                type: 'post',
                url: 'userEdit',
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
                        return;
                    } else {
                        alert("保存成功");
                        $('#table').bootstrapTable('refresh');
                        $('#editModal').modal('hide');
                    }
                }
            })
        }
        //删除信息
        function deleteUser() {
            $.ajax({
                type: 'post',
                url: 'userDelete',
                dataType: 'json',
                data: {
                    userid: $('#userid2').val()
                },
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
                        return;
                    } else {
                        $('#deleteModal').modal('hide');
                        alert("删除成功");
                        $('#table').bootstrapTable('refresh');
                    }
                }
            })

        }

        //重置密码
        function resetUser() {
            $.ajax({
                type: 'post',
                url: 'passwdReset',
                dataType: 'json',
                data: {
                    userid: $('#userid3').val()
                },
                success: function (result) {
                    if (result.errorMsg) {
                        alert(result.errorMsg);
                        return;
                    } else {
                        $('#resetModal').modal('hide');
                        alert("重置成功");
                        $('#table').bootstrapTable('refresh');
                    }
                }
            })
        }
    </script>

</body>

</html>