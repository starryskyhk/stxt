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
                    <h4>添加管理员</h4>
                </div>
                <div class="card-body">
                    <form class="form-horizontal col-lg-6" method="post" onsubmit="return false;" id="data_form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学号</label>
                            <div class="col-sm-8">
                                <input class="form-control" name="id" id="id"  value="" type="text" placeholder="请输入学号" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">姓名</label>
                            <div class="col-sm-8">
                                <input class="form-control"  value="" type="text" name="name"  id="name" placeholder="请输入姓名" >

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">性别</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="sex" id="sex">
                                    <option value="">请选择性别</option>
                                    <option value="0" >男</option>
                                    <option value="1" >女</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">个人头像</label>
                            <div class="col-sm-8">
                                <input type="hidden" name="imgUrl" value="">
                                <img src="" id="image" width="200px" height="200px">
                                <input type="file" style="display: none" name="file" id="file" onchange="fileupload()" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">手机号码</label>
                            <div class="col-sm-8">
                                <input value="" class="form-control" type="text" name="phone" id="phone">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">邮箱</label>
                            <div class="col-sm-8">
                                <input value="" class="form-control" type="text" name="email" id="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">班级</label>
                            <div class="col-sm-8">
                                <input class="form-control" value="" type="text" name="className" id="className">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">角色</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="roleId" id="roleId">
                                    <option value="">请选择角色</option>
                                    <option value="2" >社团管理员</option>
                                    <option value="3" >系统管理员</option>
                                </select>
                            </div>
                        </div>
                        <input type="hidden" name="roleId" value="1">
                        <div class="form-group">

                            <div class="col-md-9 col-md-offset-3">
                                <button class="btn btn-primary" type="submit" style="display: none;" id="save">保存
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
            type: 'put',
            data: new FormData($("#data_form")[0]),
            dataType: 'json',
            cache:false,
            processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
            contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
            success: function (response) {
                if (response.code == 0) {
                    layer.msg(response.msg, {icon: 1, time: 1000}, function () {
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭
                        parent.$('#tb_departments').bootstrapTable('refresh')
                    });
                } else {
                    layer.alert(response.msg, {icon: 5, anim: 6});
                }
            }
        })
    });
</script>
</html>
