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
表格
类型<input type="text" id="search_type">
状态
<select id="search_status">
    <option value="">请选择</option>
    <option value="0">待审核</option>
    <option value="1">正常</option>
    <option value="2">已注销</option>
</select>
<div class="col-md-3 control-label" style="padding-top: 0; ">
    <button class="btn  btn-success" type="button" id="search" value="搜索">搜索</button>
    <button class="btn  btn-success" type="reset" id="" value="重置">重置</button>
</div>
<div class="container-fluid p-t-15">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">

                <div class="card-header">
                    <h4>管理员列表</h4>
                </div>
                <div class="card-body">

                    <div id="toolbar" class="toolbar-btn-action">
                        <button id="btn_add" type="button" class="btn btn-primary m-r-5 btn-sm"
                                onclick="addAssociation()">
                            <span class="mdi mdi-plus " aria-hidden="true"></span>新增
                        </button>
                        <button id="btn_delete" type="button" class="btn btn-danger m-r-5 btn-sm"
                                onclick="delCheckAssociation()">
                            <span class="mdi mdi-window-close" aria-hidden="true"></span>删除
                        </button>


                    </div>

                    <table id="tb_departments"></table>

                </div>
            </div>
        </div>
    </div>
</div>
</body>


<script>
    var list_url = '/sys/association';
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
                    typeId:$("#search_type").val(),
                    status:$("#search_status").val()
                }
            },
            columns: [
                {
                    field: 'check',
                    checkbox: true
                }, {
                    field: 'name',
                    title: '社团名称'
                }, {
                    field: 'num',
                    title: '社团人数'
                },{
                    field: 'qq',
                    title: '官方QQ'
                }, {
                    field: 'email',
                    title: '官方邮箱',
                }, {
                    field: 'typeId',
                    title: '社团类型',
                    formatter:type
                },{
                    field: 'status',
                    title: '社团状态',
                    formatter:status
                },{
                    field: 'email',
                    title: '邮箱'
                },{
                    field: 'createTime',
                    title: '创建时间'
                },{
                    field: 'operate',
                    title: '操作',
                    formatter: btnGroup,  // 自定义方
                    align: 'center',
                    events: {
                        'click .edit-btn': function (event, value, row, index) {
                            editAssociation(row.id);
                        },
                        'click .del-btn': function (event, value, row, index) {
                            delAssociation(row.id);
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
            '<a href="#!" class="btn btn-xs btn-info re-btn" title="重置密码" data-toggle="tooltip"><i class="mdi mdi-reload"></i></a>';
        return html;
    }
    //社团状态显示
    function status(value,row,index) {
        if(row.status=='0'){
            value="待审核";
        }else if(row.status=='1'){
            value="正常";
        }else{
            value="已注销";
        }
        return value;
    }
    //社团类型显示
    function type(value,row,index) {
        $.ajax({

            url:  "/sys/type/getName/"+row.typeId,
            type:"get",
            async:false,
            success: function (data) {
                value=data["typeName"];
            }

        })
        return value;

    }

    // 操作方法 - 编辑
    function editAssociation(id) {
        var url = '/back/editAssociation/' + id;
        popup.open_add('编辑用户', url)
    }

    //添加
    function addAssociation(id) {
        var url = '/test/add';
        popup.open_add("新增社团", url);
    }

    // 操作方法 - 删除 ,单条删除
    function delAssociation(id) {
        var url = '/sys/association/';
        layer.confirm("你确定删除吗?", {icon: 3, offset: '100px'}, function () {
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

                    } else {
                        layer.alert(response.msg, {icon: 5});
                    }
                }
            })

        })

    }

    //批量删除
    function delCheckAssociation() {
        var rows = $('#tb_departments').bootstrapTable('getSelections');
        if (rows.length == 0) {
            layer.msg("请选择数据行!", {icon: 2, time: 1000,anim: 6})
        } else if (rows.length == 1) {
            layer.confirm("确认删除?", {icon: 3}, function () {
                //异步删除一条
                var url = '/sys/association/';
                $.ajax({
                    url: url + rows[0].id,
                    type: 'delete',
                    success: function (response) {
                        if (response.code == 0) {
                            layer.msg(response.msg, {icon: 1, time: 1000});
                            //前台删除
                            $('#tb_departments').bootstrapTable('remove', {
                                field: "id",   //此处的 “id”对应的是字段名
                                values: [parseInt(rows[0].id)]
                            });

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
                var url = '/sys/association/';
                $.ajax({
                    url: url,
                    type: 'delete',
                    data: {ids: ids.toString()},
                    success: function (response) {
                        if (response.code == 0) {
                            layer.msg(response.msg, {icon: 1, time: 1000});
                            //前台删除
                            for (var i = 0; i < ids.length; i++) {
                                $('#tb_departments').bootstrapTable('remove', {
                                    field: "id",   //此处的 “id”对应的是字段名
                                    values: [parseInt(ids[i])]
                                });
                            }
                            $('#tb_departments').bootstrapTable('refresh')

                        } else {
                            layer.alert(response.msg, {icon: 5,anim: 6});
                        }
                    }
                })

            })

        }

    };

</script>
</html>

