<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <%--    抽取公共静态文件--%>
    <%@include file="/WEB-INF/jsp/common.jsp"%>
</head>
<body>


<div class="m-t-10 col-md-12" >
    <div class="well">
        <div class="row">
            <form class="form-horizontal" action="" id="" method="post">
                <div class="form-group">
                    <label class="col-md-1 control-label">姓名：</label>
                    <div class="col-md-3">
                            <input class="form-control" type="text" id="name" name="name" placeholder="请输入姓名">
                    </div>
                    <label class="col-md-1 control-label">学号：</label>
                    <div class="col-md-3">
                        <input class="form-control" type="text" id="id" name="id" placeholder="请输入学号">
                    </div>
                    <label class="col-md-1 control-label">手机号码：</label>
                    <div class="col-md-3">
                        <input class="form-control" type="text" id="phone" name="phone" placeholder="请输入手机号码">
                    </div>
                    <div class="col-md-3 control-label">
                        <button class="btn btn-success" type="button" id="search" value="搜索">搜索</button>
                        <button class="btn  btn-success" type="reset" value="重置">重置</button>
                        <button class="btn  btn-success" type="reset" value="返回" onclick="window.history.go(-1)">返回</button>
                    </div>
                </div>
            </form>

        </div>


    </div>
</div>

<div class="container-fluid p-t-15">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">

                <div class="card-header">
                    <h4>用户列表</h4>
                </div>
                <div class="card-body">

                    <div id="toolbar" class="toolbar-btn-action">
                        <button id="btn_add" type="button" class="btn btn-primary m-r-5 btn-sm"
                                onclick="addUser()">
                            <span class="mdi mdi-plus " aria-hidden="true"></span>新增
                        </button>
                        <button id="btn_delete" type="button" class="btn btn-danger m-r-5 btn-sm"
                                onclick="delUsers()">
                            <span class="mdi mdi-window-close" aria-hidden="true"></span>删除
                        </button>
                        <button id="excel" type="button" class="btn btn-info m-r-5 btn-sm">
                             <span class="mdi mdi-download-network" aria-hidden="true"></span>批量导入
                        </button>
                        <a  href="/file/ftl/用户信息导入模板.xlsx" id="template" type="button" class="btn btn-info m-r-5 btn-sm">
                            <span class="mdi mdi-download-network" aria-hidden="true"></span>导入模板下载
                        </a>
                        <form method="put" enctype="multipart/form-data"  onsubmit="return false;" id="data_form">
                            <input type="file" accept=".xlsx,.xls" style="display: none" name="file" id="file" onchange="importUser()" />
                            <button class="btn btn-primary" type="submit" style="display: none;" id="save">保存
                            </button>
                        </form>



                    </div>

                    <table id="tb_departments"></table>

                </div>
            </div>
        </div>
    </div>
</div>
</body>


<script>
    var list_url = '/sys/user';
    $(function () {
    initTable();
        $("#search").bind("click", initTable);
    })
    function initTable() {
        $('#tb_departments').bootstrapTable('destroy');
        $("#tb_departments").bootstrapTable({
            classes: 'table table-bordered table-hover table-striped',
            url: list_url,                      //  请求后台的URL
            method: "get",                      //  请求方式
            uniqueId: "id",                     //  每一行的唯一标识，一般为主键列
            cache: false,                       //  设置为 false 禁用 AJAX 数据缓存， 默认为true
            pagination: true,                   //  是否显示分页
            sidePagination: "client",           //  分页方式：client客户端分页，server服务端分页
            pageSize: 10,                       //  每页的记录行数
            showColumns: true,         // 是否显示所有的列
            showRefresh: true,         // 是否显示刷新按钮
            toolbar: '#toolbar',       // 工具按钮容器
            pageNumber: 1,                       // 初始化加载第一页，默认第一页
            pageSize: 10,                        // 每页的记录行数
            pageList: [10, 20, 30],         // 可供选择的每页的行数
            search: true,
            queryParamsType: '',
            queryParams: function (param) {
                return {
                    name:$("#name").val(),
                    id:$("#id").val(),
                    phone:$("#phone").val(),
                    roleId:1
                }
            },
            columns: [
                {
                    field: 'check',
                    checkbox: true,
                    align: "center"
                }, {
                    field: 'id',
                    title: '学号',
                    align: "center"
                }, {
                    field: 'name',
                    title: '姓名',
                    align: "center"
                },{
                    field: 'sex',
                    title: '性别',
                    align: "center",
                    formatter:sexType
                }, {
                    field: 'email',
                    title: '邮箱',
                    align: "center"
                }, {
                    field: 'phone',
                    title: '手机号码',
                    align: "center"
                },{
                    field: 'className',
                    title: '班级',
                    align: "center"
                }, {
                    field: '',
                    title: '角色',
                    align: "center",
                    formatter:function (value) {
                        return "学生";
                    }
                }, {
                    field: 'createTime',
                    title: '创建时间',
                    align: "center"
                },{
                    field: 'operate',
                    title: '操作',
                    formatter: btnGroup,  // 自定义方
                    align: 'center',
                    events: {
                        'click .edit-btn': function (event, value, row, index) {
                            editUser(row.id);
                        },
                        'click .del-btn': function (event, value, row, index) {
                            delUser(row.id);
                        },
                        'click .member-btn': function (event, value, row, index) {
                            reset(row.id);//TODO:用户管理进行到了这一步
                        }
                    }
                },
            ]
        });

    }


    // 操作按钮
    function btnGroup() {
        var html =
            '<a href="#!" class="btn btn-xs btn-success m-r-5 edit-btn" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>' +
            '<a href="#!" class="btn btn-xs btn-danger m-r-5 del-btn" title="删除" data-toggle="tooltip"><i class="mdi mdi-delete"></i></a>' +
            '<a href="#!" class="btn btn-xs btn-info member-btn" title="查看社团成员" data-toggle="tooltip"><i class="mdi mdi-account-search"></i></a>';
        return html;
    }
    //性别显示
    function sexType(value,row,index) {
        if(value == '0'){
            return "男";
        }else{
            return "女";
        }

    }

    // 操作方法 - 编辑
    function editUser(id) {
        var url = '/back/user/' + id;
        popup.open_add('编辑用户', url)
    }

    //添加
    function addUser() {
        var url = '/back/addUser';
        popup.open_add("添加用户", url);
    }
    //查询社团成员
    function searchMember(id) {
        var url = '/back/members/';
        window.location.href=url+id;
    }

    // 操作方法 - 删除 ,单条删除
    function delUser(id) {
        var url = '/sys/user/';
        layer.confirm("你确定删除该用户吗?", {icon: 3, offset: '100px'}, function () {
            $.ajax({
                url: url + id,
                type: 'delete',
                success: function (response) {
                    if (response.code == 0) {
                        layer.msg(response.msg, {icon: 1, time: 1000});
                        //前台删除
                        $('#tb_departments').bootstrapTable('remove', {
                            field: "id",   //此处的 “id”对应的是字段名
                            values: [parseInt(id)]
                        });
                        $('#tb_departments').bootstrapTable('refresh')

                    } else {
                        layer.alert(response.msg, {icon: 5});
                    }
                }
            })

        })

    }

    //批量删除
    function delUsers() {
        var rows = $('#tb_departments').bootstrapTable('getSelections');
        if (rows.length == 0) {
            layer.msg("请选择数据行!", {icon: 2, time: 1000,anim: 6})
        } else if (rows.length == 1) {
            layer.confirm("确认删除?", {icon: 3}, function () {
                //异步删除一条
                var url = '/sys/user/';
                $.ajax({
                    url: url + rows[0].id,
                    type: 'delete',
                    success: function (response) {
                        if (response.code == 0) {
                            layer.msg(response.msg, {icon: 1, time: 1000});
                            //前台删除
                            $('#tb_departments').bootstrapTable('refresh')

                        } else {
                            layer.alert(response.msg, {icon: 5,anim: 6});
                        }
                    }
                })
            })
        } else {
            layer.confirm("确认批量删除?", {icon: 3}, function () {
                var ids = new Array();
                for (var i = 0; i < rows.length; i++) {
                    ids.push(rows[i].id);
                }
                var url = '/sys/user/';
                $.ajax({
                    url: url,
                    type: 'delete',
                    data: {ids: ids.toString()},
                    success: function (response) {
                        if (response.code == 0) {
                            layer.msg(response.msg, {icon: 1, time: 1000});
                            $('#tb_departments').bootstrapTable('refresh')

                        } else {
                            layer.alert(response.msg, {icon: 5,anim: 6});
                        }
                    }
                })

            })

        }

    };
    //点击图片更改图片文件
    $("#excel").click(function () {
        $("#file").click();
    })
    $('#data_form').submit(function () {
        $.ajax({
            url: '/sys/user/import',
            type: 'put',
            data: new FormData($("#data_form")[0]),
            dataType: 'json',
            cache:false,
            processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
            contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
            success: function (response) {
                if (response.code == 0) {
                    layer.msg(response.msg, {icon: 1, time: 1000}, );
                } else {
                    layer.alert(response.msg, {icon: 5, anim: 6});
                }
                $('#tb_departments').bootstrapTable('refresh')
            }
        })
    });
    function importUser(){
        $("#save").click();
    }

</script>
</html>

