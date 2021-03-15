<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <%@include file="/WEB-INF/jsp/common.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<div class="container-fluid p-t-15">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>发布活动</h4>
                </div>
                <div class="card-body">
                    <form class="form-horizontal col-lg-6" method="post" onsubmit="return false;" id="data_form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动标题</label>
                            <div class="col-sm-8">
                                <input class="form-control" name="title" id="title" value="" type="text" placeholder="请输入活动标题">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动内容</label>
                            <div class="col-sm-8">
                                <textarea name="content" id="content" class="form-control" rows="3"></textarea>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动封面</label>
                            <div class="col-sm-8">
                                <input type="hidden" name="imgUrl" value="">
                                <img src="" id="image" width="200px" height="200px">
                                <input type="file" style="display: none" name="file" id="file" onchange="fileupload()">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">最大参与人数</label>
                            <div class="col-sm-8">
                                <input value="" class="form-control" type="text" name="maxNum" id="maxNum">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动开始时间</label>
                            <div class="col-sm-8">
                                <input value="" class="form-control" type="datetime-local" name="beginTime" id="beginTime">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">活动结束时间</label>
                            <div class="col-sm-8">
                                <input value="" class="form-control" type="datetime-local" name="endTime" id="endTime">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">场地</label>
                            <div class="col-sm-8">
                                <button class="btn btn-primary" type="submit" id="choose">选择场地</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">备注</label>
                            <div class="col-sm-8">
                                <input value="" class="form-control" type="text" name="remark" id="remark">
                                <input hidden value="${sessionScope.associationId}" name="associationId">
                                <input hidden value="${sessionScope.user.id}" name="id">
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-md-9 col-md-offset-3">
                                <button class="btn btn-primary" type="submit" id="save">发布
                                </button>
                                <a href="/assBack/activityList">
                                    <button class="btn btn-primary" type="button">返回</button>
                                </a>
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
    function fileupload() {
        var file = document.getElementById("file");
        for (var i = 0; i < file.files.length; i++) {
            let reader = new FileReader();
            var file1 = file.files[i];
            reader.readAsDataURL(file1);
            reader.onload = function (result) {
                //reader对象的result属性存储流读取的数据
                $("#image").attr("src", reader.result);
            }
        }
    }

    //点击图片更改图片文件
    $("#image").click(function () {
        $("#file").click();
    })
    $('#data_form').submit(function () {
        $.ajax({
            url: '/sys/activity',
            type: 'put',
            data: new FormData($("#data_form")[0]),
            dataType: 'json',
            cache: false,
            processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
            contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
            success: function (response) {
                if (response.code == 0) {
                    layer.alert("发布成功", {icon: 1, time: 1000});
                    window.location.href="/assBack/activityList"
                } else {
                    layer.alert(response.msg, {icon: 5, anim: 6});
                }
            }
        })
    });
</script>
</html>
