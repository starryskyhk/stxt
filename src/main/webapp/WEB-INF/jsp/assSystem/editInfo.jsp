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
                    <h4>更改个人信息</h4>
                </div>
                <div class="card-body">
                    <form class="form-horizontal col-lg-6" method="post" onsubmit="return false;" id="data_form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学号/工号</label>
                            <div class="col-sm-8">
                                <input class="form-control" name="id" id="id" readonly value="${sessionScope.user.id}" type="text" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">姓名</label>
                            <div class="col-sm-8">
                                <input class="form-control" readonly  value="${sessionScope.user.name}" type="text" name="name"  id="name" placeholder="请输入姓名" >

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">性别</label>
                            <div class="col-sm-8">
                                <select disabled class="form-control" name="sex" id="sex">
                                    <option value="">请选择性别</option>
                                    <option value="0" ${user.sex==0?"selected":""}>男</option>
                                    <option value="1" ${user.sex==1?"selected":""}>女</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">个人头像</label>
                            <div class="col-sm-8">
                                <input type="hidden" name="imgUrl" value="${user.imgUrl}">
                                <img src="${user.imgUrl}" id="image" width="200px" height="200px">
                                <input type="file" style="display: none" name="file" id="file" onchange="fileupload()" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">手机号码</label>
                            <div class="col-sm-8">
                                <input  value="${user.phone}" class="form-control" type="text" name="phone" id="phone">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">邮箱</label>
                            <div class="col-sm-8">
                                <input value="${user.email}" class="form-control" type="text" name="email" id="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">新密码</label>
                            <div class="col-sm-8">
                                <input class="form-control" type="text" name="password" id="password">
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-md-9 col-md-offset-3">
                                <button class="btn btn-primary" type="submit"  id="save">更改
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
    function fileupload(){
        var file = document.getElementById("file");
        for(var i=0;i<file.files.length;i++){
            let reader = new FileReader();
            var file1 = file.files[i];
            reader.readAsDataURL (file1);
            reader.onload = function (result) {
                //reader对象的result属性存储流读取的数据
                $("#image").attr("src",reader.result);
            }
        }
    }
    //点击图片更改图片文件
    $("#image").click(function () {
        $("#file").click();
    })
    $('#data_form').submit(function () {
        $.ajax({
            url: '/sys/user',
            type: 'post',
            data: new FormData($("#data_form")[0]),
            dataType: 'json',
            cache:false,
            processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
            contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
            success: function (response) {
                if (response.code == 0) {
                    layer.msg(response.msg, {icon: 1, time: 1000}, function () {
                        parent.location.href="/exit";
                    });
                } else {
                    layer.alert(response.msg, {icon: 5, anim: 6});
                }
            }
        })
    });
</script>
</html>
