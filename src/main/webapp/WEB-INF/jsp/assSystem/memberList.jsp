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


<div class="container-fluid p-t-15">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">

                <div class="card-header">
                    <h4>社团成员列表</h4>
                </div>
                <div class="card-body">

                    <div id="toolbar" class="toolbar-btn-action">
                        <button id="btn_add" type="button" class="btn btn-primary m-r-5 btn-sm"
                                onclick="addMember()">
                            <span class="mdi mdi-plus " aria-hidden="true"></span>新增
                        </button>
                        <button id="btn_delete" type="button" class="btn btn-danger m-r-5 btn-sm"
                                onclick="delMembers()">
                            <span class="mdi mdi-window-close" aria-hidden="true"></span>删除
                        </button>
                        <ul class="list-inline student">
                            <li><b>社团名称：</b>${association.name}</li>
                            <li><b>社团人数：</b>${association.num}</li>
                            <input id="assId" type="hidden" value="${association.id}">
                        </ul>


                    </div>


                    <table id="tb_departments"></table>

                </div>
            </div>
        </div>
    </div>
</div>
</body>


<script>
    var list_url = '/sys/association/'+$("#assId").val();
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
            uniqueId: "memberId",                     //  每一行的唯一标识，一般为主键列
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
                }
            },
            columns: [
                {
                    field: 'check',
                    checkbox: true,
                    align: "center"
                }, {
                    field: 'userId',
                    title: '学号',
                    align: "center"
                }, {
                    field: 'name',
                    title: '姓名',
                    align: "center"
                },{
                    field: 'sex',
                    title: '性别',
                    formatter:type,
                    align: "center"
                }, {
                    field: 'className',
                    title: '班级名称',
                    align: "center"
                }, {
                    field: 'phone',
                    title: '电话',
                    align: "center"
                },{
                    field: 'rank',
                    title: '职位',
                    align: "center"
                },{
                    field: 'operate',
                    title: '操作',
                    formatter: btnGroup,  // 自定义方
                    align: 'center',
                    events: {
                        'click .del-btn': function (event, value, row, index) {
                            delMember(row.memberId);
                        }
                    }
                },
            ]
        });

    }


    // 操作按钮
    function btnGroup() {
        var html =
            '<a href="#!" class="btn btn-xs btn-danger m-r-5 del-btn" title="删除" data-toggle="tooltip"><i class="mdi mdi-delete"></i></a>' ;
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
    //性别显示
    function type(value,row,index) {
        if(value == '0'){
            return "男";
        }else{
            return "女";
        }

    }


    //添加
    function addMember() {
        var url = '/back/addMember/'+$("#assId").val();
        popup.open_add("添加社团成员", url,700,300);
    }


    // 操作方法 - 删除 ,单条删除
    function delMember(id) {
        var url = '/sys/member/';
        layer.confirm("你确定移除该成员吗?", {icon: 3, offset: '100px'}, function () {
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
                        // $('#tb_departments').bootstrapTable('refresh')
                        location.reload();
                    } else {
                        layer.alert(response.msg, {icon: 5});
                    }
                }
            })

        })

    }

    //批量删除
    function delMembers() {
        var rows = $('#tb_departments').bootstrapTable('getSelections');
        if (rows.length == 0) {
            layer.msg("请选择数据行!", {icon: 2, time: 1000,anim: 6})
        } else if (rows.length == 1) {
            layer.confirm("确认移除吗?", {icon: 3}, function () {
                //异步删除一条
                var url = '/sys/member/';
                $.ajax({
                    url: url + rows[0].memberId,
                    type: 'delete',
                    success: function (response) {
                        if (response.code == 0) {
                            layer.msg(response.msg, {icon: 1, time: 1000});
                            //前台删除
                            $('#tb_departments').bootstrapTable('refresh')


                        } else {
                            layer.alert(response.msg, {icon: 5,anim: 6});
                        }
                        location.reload();
                    }
                })
            })
        } else {
            layer.confirm("确认批量移除?", {icon: 3}, function () {
                var ids = new Array();
                for (var i = 0; i < rows.length; i++) {
                    ids.push(rows[i].memberId);
                }
                var url = '/sys/member';
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
                        location.reload();
                    }
                })

            })

        }

    };

</script>
</html>

