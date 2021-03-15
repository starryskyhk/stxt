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
                    <h4>活动详情</h4>
                </div>
                <div class="card-body">
                    <form class="form-horizontal col-lg-6" method="post" onsubmit="return false;" id="data_form">
                        <input type="hidden" name="id" id="id" value="${activity.id}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动标题</label>
                            <div class="col-sm-8">
                                <input class="form-control" value="${activity.title}" type="title" placeholder="请输入社团名称" name="title"
                                       id="title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动内容</label>
                            <div class="col-sm-8">
                                <textarea   placeholder="请输入社团简介"  name="content" id="content">
                                    ${activity.content}
                                </textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动地址</label>
                            <div class="col-sm-8">
                                <input  class="form-control" value="${activity.address}" type="text" placeholder="请输入活动地址" name="address"
                                       id="address">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动封面图片</label>
                            <div class="col-sm-8">
                                <input  type="hidden" name="imgUrl" value="${activity.imgUrl}">
                                <img   src="${activity.imgUrl}" id="image" width="200px" height="200px">
                                <input type="file" style="display: none" name="file" id="file" onchange="fileupload()" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动最大允许人数</label>
                            <div class="col-sm-8">
                                <input  value="${activity.maxNum}" class="form-control" type="text" name="maxNum" id="maxNum">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动备注</label>
                            <div class="col-sm-8">
                                <input  value="${activity.remark}" class="form-control" type="text" name="remark" id="remark">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动负责人id</label>
                            <div class="col-sm-8">
                                <input disabled class="form-control" value="${activity.userId}" type="text" name="userId" id="userId">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动开始时间</label>
                            <div class="col-sm-8">
                                <input  class="form-control"  type="datetime-local" name="beginTime" id="beginTime">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动结束时间</label>
                            <div class="col-sm-8">
                                <input  class="form-control"  type="datetime-local" name="endTime" id="endTime">
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-md-9 col-md-offset-3">
                                <button class="btn btn-info" type="submit"  id="pass">修改
                                </button>
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
        $.get(
            "/sys/activitSpace/getByActivityId/"+$("#id").val(),
            {},
            function (data) {
                alert(data.beginTime)
                $("#beginTime").val(data.beginTime);
                $("#endTime").val(data.endTime);
            }

        )
    })

    $("#pass").click(function () {
        var url = '/sys/activity';
        layer.confirm("你确定修改吗?", {icon: 3, offset: '100px'}, function () {
            $.ajax({
                url: url,
                data:$("#data_form").serialize(),
                type: 'post',
                success: function (response) {
                    if (response.code == 0) {
                        layer.msg("修改成功", {icon: 1, time: 1000});
                    } else {
                        layer.alert(response.msg, {icon: 5});
                    }
                    window.location.href = "/assBack/activityList";
                }
            })

        })
    })

</script>
</html>
