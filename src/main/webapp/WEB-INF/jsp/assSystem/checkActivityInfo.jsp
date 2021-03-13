<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <%@include file="/WEB-INF/jsp/common.jsp"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
<div class="container-fluid p-t-15">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>审核活动</h4>
                </div>
                <div class="card-body">
                    <form class="form-horizontal col-lg-6" method="post" onsubmit="return false;" id="data_form">
                        <input type="hidden" name="id" id="id" value="${activity.id}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动标题</label>
                            <div class="col-sm-8">
                                <input disabled class="form-control" value="${activity.title}" type="title" placeholder="请输入社团名称" name="name"
                                       id="title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动内容</label>
                            <div class="col-sm-8">
                                <textarea disabled  placeholder="请输入社团简介"  name="content" id="content">
                                    ${activity.content}
                                </textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动地址</label>
                            <div class="col-sm-8">
                                <input disabled class="form-control" value="${activity.address}" type="text" placeholder="请输入社团名称" name="name"
                                       id="address">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动封面图片</label>
                            <div class="col-sm-8">
                                <input disabled type="hidden" name="imgUrl" value="${activity.imgUrl}">
                                <img  disabled src="${activity.imgUrl}" id="image" width="200px" height="200px">
                                <input type="file" style="display: none" name="file" id="file" onchange="fileupload()" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动最大允许人数</label>
                            <div class="col-sm-8">
                                <input disabled value="${activity.maxNum}" class="form-control" type="text" name="maxNum" id="maxNum">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动备注</label>
                            <div class="col-sm-8">
                                <input disabled value="${activity.remark}" class="form-control" type="text" name="remark" id="remark">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动负责人id</label>
                            <div class="col-sm-8">
                                <input disabled class="form-control" value="${activity.userId}" type="text" name="userId" id="userId">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动举办社团</label>
                            <div class="col-sm-8">
                                <input disabled class="form-control" type="text" value="${activity.associationId}" id="associationId" name="associationId" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动举办时间</label>
                            <div class="col-sm-8">
                                <input disabled class="form-control"  type="text" name="time" id="time">
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-md-9 col-md-offset-3">
                                <button class="btn btn-info" type="submit"  id="pass">通过
                                </button>
                                <button class="btn btn-danger" type="submit"id="reject">驳回
                                </button>
                                <a href="/back/activityCheck"><button class="btn btn-default" type="button"id="back">返回
                                </button></a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    var type_url = "/sys/type/"
    $(function () {
        //地址
        $.get(
            "/sys/space/getAddress/"+$("#address").val(),
            {},
            function (data) {
                $("#address").val(data.name);
            }
        )
        //社團名稱
        $.get(
            "/sys/association/getAss/"+$("#associationId").val(),
            {},
            function (data) {
                $("#associationId").val(data.name);
            }

        )
        $.get(
            "/sys/activitSpace/getByActivityId/"+$("#id").val(),
            {},
            function (data) {
                $("#time").val(data.beginTime+'---'+data.endTime);
            }

        )
    })

    $("#pass").click(function () {
        var url = '/sys/activity/';
        layer.confirm("你确定通过吗?", {icon: 3, offset: '100px'}, function () {
            $.ajax({
                url: url,
                data:{
                  "id":$("#id").val(),
                    "status":1
                },
                type: 'post',
                success: function (response) {
                    if (response.code == 0) {
                        layer.msg("已通过", {icon: 1, time: 1000});
                    } else {
                        layer.alert(response.msg, {icon: 5});
                    }
                    window.location.href = "/back/assCheck";
                }
            })

        })
    })

    $("#reject").click(function () {
        var url = '/sys/activity/';
        layer.confirm("你确定驳回吗?", {icon: 3, offset: '100px'}, function () {
            $.ajax({
                url: url,
                data:{
                    "id":$("#id").val(),
                    "status":3
                },
                type: 'post',
                success: function (response) {
                    if (response.code == 0) {
                        layer.msg("已驳回", {icon: 1, time: 1000});
                    } else {
                        layer.alert(response.msg, {icon: 5});
                    }
                    window.location.href = "/back/assCheck";
                }
            })

        })
    })

</script>
</html>
