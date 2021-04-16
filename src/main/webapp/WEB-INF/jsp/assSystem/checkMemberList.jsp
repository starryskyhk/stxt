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
                    <h4>待审核成员列表</h4>
                </div>
                <div class="card-body">

                <input hidden value="${sessionScope.associationId}" name="associationId" id="associationId">

                    <table id="tb_departments"></table>

                </div>
            </div>
        </div>
    </div>
</div>
</body>


<script>
    var list_url = '/sys/association/check/'+$("#associationId").val();
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
                    field: 'operate',
                    title: '操作',
                    formatter: btnGroup,  // 自定义方
                    align: 'center',
                    events: {
                        'click .del-btn': function (event, value, row, index) {
                            //批准
                            ratifyMember(row.memberId);
                        },
                        'click .edit-btn': function (event, value, row, index) {
                            //拒绝
                            rejectMember(row.memberId);
                        },
                    }
                },
            ]
        });

    }


    // 操作按钮
    function btnGroup() {
        var html =
            '<a href="#!" class="btn btn-xs btn-success m-r-5 edit-btn" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>' +
            '<a href="#!" class="btn btn-xs btn-danger m-r-5 del-btn" title="删除" data-toggle="tooltip"><i class="mdi mdi-delete"></i></a>' ;
        return html;
    }

    //性别显示
    function type(value,row,index) {
        if(value == '0'){
            return "男";
        }else{
            return "女";
        }

    }

    //批准
    function ratifyMember(id) {
        var url = '/sys/member/';
        layer.confirm("你确定批准吗?", {icon: 3, offset: '100px'}, function () {
            $.ajax({
                url: url,
                type: 'post',
                data:{
                    "id":id,
                    "status":0
                },
                success: function (response) {
                    if (response.code == 0) {
                        layer.msg("已通过", {icon: 1, time: 1000});
                        $('#tb_departments').bootstrapTable('refresh');
                    } else {
                        layer.alert(response.msg, {icon: 5});
                    }
                }
            })
        })
    }

    //驳回
    function rejectMember(id) {
        var url = '/sys/member/'+id;
        layer.confirm("你确定驳回吗?", {icon: 3, offset: '100px'}, function () {
            $.ajax({
                url: url + id,
                type: 'delete',
                success: function (response) {
                    if (response.code == 0) {
                        layer.msg("已驳回", {icon: 1, time: 1000});
                        //前台删除
                        $('#tb_departments').bootstrapTable('refresh');
                    } else {
                        layer.alert(response.msg, {icon: 5});
                    }
                }
            })
        })
    }


</script>
</html>

