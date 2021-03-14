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
                    <h4>更改社团信息
                        <a href="/assBack/members/${sessionScope.associationId}">
                            <button class="btn btn-primary" type="button">查看社团成员</button>

                        </a>
                    </h4>
                    <br/>

                </div>
                <div class="card-body">
                    <form class="form-horizontal col-lg-6" method="post" onsubmit="return false;" id="data_form">
                        <input type="hidden" name="id" id="id" value="${association.id}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团名称</label>
                            <div class="col-sm-8">
                                <input class="form-control" value="${association.name}" type="text"
                                       placeholder="请输入社团名称" name="name"
                                       id="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团简介</label>
                            <div class="col-sm-8">
                                <textarea cols="60%" rows="15%" placeholder="请输入社团简介" name="brief" id="brief">
                                    ${association.brief}
                                </textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团类型</label>
                            <div class="col-sm-8">
                                <input type="hidden" id="typeId" value="${association.typeId}">
                                <select class="form-control" name="typeId" id="type">
                                    <option value="">请选择社团类型</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">封面图片</label>
                            <div class="col-sm-8">
                                <input type="hidden" name="imgUrl" value="${association.imgUrl}">
                                <img src="${association.imgUrl}" id="image" width="200px" height="200px">
                                <input type="file" style="display: none" name="file" id="file" onchange="fileupload()">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">官方QQ</label>
                            <div class="col-sm-8">
                                <input value="${association.qq}" class="form-control" type="text" name="qq" id="qq">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">官方邮箱</label>
                            <div class="col-sm-8">
                                <input value="${association.email}" class="form-control" type="text" name="email"
                                       id="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团负责人id</label>
                            <div class="col-sm-8">
                                <input class="form-control" value="${association.studentId}" type="text"
                                       name="studentId" id="studentId">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">负责老师工号</label>
                            <div class="col-sm-8">
                                <input class="form-control" value="${association.teacherId}" type="text"
                                       name="teacherId" id="teacherId">
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-md-9 col-md-offset-3">
                                <button class="btn btn-primary" type="submit" id="save">保存
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
        var typeId = $("#typeId").val();
        $.get(
            type_url + 0,
            {},
            function (data) {
                var types = data["types"];
                for (var i = 0; i < types.length; i++) {
                    if (typeId == types[i].id) {
                        $("#type").append("<option selected value='" + types[i].id + "'>" + types[i].name + "</option>")
                    } else {
                        $("#type").append("<option  value='" + types[i].id + "'>" + types[i].name + "</option>")

                    }
                }
            }
        )
    })

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
            url: '/sys/association',
            type: 'post',
            data: new FormData($("#data_form")[0]),
            dataType: 'json',
            cache: false,
            processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
            contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
            success: function (response) {
                if (response.code == 0) {
                    layer.msg(response.msg, {icon: 1, time: 1000}, function () {
                        location.reload();
                    });
                } else {
                    layer.alert(response.msg, {icon: 5, anim: 6});
                }
            }
        })
    });
</script>
</html>
