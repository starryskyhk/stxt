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
                    <h4><b>活动列表</b></h4>
                </div>
                <div id="toolbar" class="toolbar-btn-action">
                    <button id="btn_add" type="button" class="btn btn-primary m-r-5 btn-sm"
                            onclick="addActivity()">
                        <span class="mdi mdi-plus " aria-hidden="true"></span>发布活动
                    </button>
                    <button id="btn_delete" type="button" class="btn btn-danger m-r-5 btn-sm"
                            onclick="delActivitys()">
                        <span class="mdi mdi-window-close" aria-hidden="true"></span>删除活动
                    </button>


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
    var list_url = '/sys/activity';
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
                    associationId:$("#associationId").val()
                }
            },
            columns: [
                {
                    field: 'check',
                    checkbox: true
                }, {
                    field: 'title',
                    title: '活动标题',
                    align: "center"
                }, {
                    field: 'address',
                    title: '活动地址',
                    align: "center",
                    formatter:addressType
                },{
                    field: 'maxNum',
                    title: '活动允许最大参与人数',
                    align: "center"
                }, {
                    field: 'userId',
                    title: '活动负责人',
                    align: "center"
                }, {
                    field: '',
                    title: '活动开始时间',
                    align: "center",
                    formatter:beginTime
                },  {
                    field: '',
                    title: '活动结束时间',
                    align: "center",
                    formatter:endTime
                },  {
                    field: 'status',
                    title: '审核状态',
                    formatter:status,
                    align: "center"
                },{
                    field: 'createTime',
                    title: '申请时间',
                    align: "center"
                },{
                    field: 'operate',
                    title: '操作',
                    formatter: btnGroup,  // 自定义方
                    align: 'center',
                    events: {
                        'click .edit-btn': function (event, value, row, index) {
                            activityInfo(row.id);
                        }
                    }
                },
            ]
        });

    }


    // 操作按钮
    function btnGroup() {
        var html =
            '<a href="#!" class="btn btn-xs btn-success m-r-5 edit-btn" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>'
         return html;
    }

    //活动状态显示
    function status(value,row,index) {
        if(value=='0'){
            return "待审批";
        }else if(value=='1'){
            return "正常"
        }else if(value == '4'){
            return "已驳回";
        }
        return value;
    }
    //地址显示
    function addressType(value,row,index) {
        $.ajax({
            url:  "/sys/space/getAddress/"+row.address,
            type:"get",
            async:false,
            success: function (data) {
                value=data.name;
            }
        })
        return value;
    }
    function beginTime(value,row,index) {
        $.ajax({
            url:  "/sys/activitSpace/getByActivityId/"+row.id,
            type:"get",
            async:false,
            success: function (data) {
                value=data.beginTime;
            }
        })
        return value;
    }
    function endTime(value,row,index) {
        $.ajax({
            url:  "/sys/activitSpace/getByActivityId/"+row.id,
            type:"get",
            async:false,
            success: function (data) {
                value=data.endTime;
            }
        })
        return value;

    }

    // 操作方法 - 编辑
    function activityInfo(id) {
        var url = '/assBack/activityInfo/' + id;
        window.location.href=url;
    }
    function addActivity() {
        window.location.href="/assBack/addActivity";
    }

    //批量删除
    function delActivitys() {
        var rows = $('#tb_departments').bootstrapTable('getSelections');
        if (rows.length == 0) {
            layer.msg("请选择数据行!", {icon: 2, time: 1000,anim: 6})
        } else if (rows.length == 1) {
            layer.confirm("确认删除?", {icon: 3}, function () {
                //异步删除一条
                var url = '/sys/activity/';
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
                var url = '/sys/activity/';
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

</script>
</html>

