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
                    <h4>审核社团</h4>
                </div>
                <div class="card-body">
                    <form class="form-horizontal col-lg-6" method="post" onsubmit="return false;" id="data_form">
                        <input type="hidden" name="id" id="id" value="${association.id}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团名称</label>
                            <div class="col-sm-8">
                                <input disabled class="form-control" value="${association.name}" type="text" placeholder="请输入社团名称" name="name"
                                       id="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团简介</label>
                            <div class="col-sm-8">
                                <textarea disabled  placeholder="请输入社团简介"  name="brief" id="brief">
                                    ${association.brief}
                                </textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团类型</label>
                            <div class="col-sm-8">
                                <input  type="hidden" id="typeId" value="${association.typeId}" >
                                <select disabled class="form-control" name="typeId" id="type">
                                    <option value="">请选择社团类型</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">封面图片</label>
                            <div class="col-sm-8">
                                <input disabled type="hidden" name="imgUrl" value="${association.imgUrl}">
                                <img  disabled src="${association.imgUrl}" id="image" width="200px" height="200px">
                                <input type="file" style="display: none" name="file" id="file" onchange="fileupload()" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">官方QQ</label>
                            <div class="col-sm-8">
                                <input disabled value="${association.qq}" class="form-control" type="text" name="qq" id="qq">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">官方邮箱</label>
                            <div class="col-sm-8">
                                <input disabled value="${association.email}" class="form-control" type="text" name="email" id="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团负责人id</label>
                            <div class="col-sm-8">
                                <input disabled class="form-control" value="${association.studentId}" type="text" name="studentId" id="studentId">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">负责老师工号</label>
                            <div class="col-sm-8">
                                <input disabled class="form-control" value="${association.teacherId}" type="text" name="teacherId" id="teacherId">
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-md-9 col-md-offset-3">
                                <button class="btn btn-info" type="submit"  id="pass">通过
                                </button>
                                <button class="btn btn-danger" type="submit"id="reject">驳回
                                </button>
                                <a href="/back/assCheck"><button class="btn btn-default" type="button"id="back">返回
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
        var typeId = $("#typeId").val();
        $.get(
            type_url+0,
            {},
            function (data) {
                var types = data["types"];
                for(var i=0;i<types.length;i++){
                    if(typeId==types[i].id){
                        $("#type").append("<option selected value='" + types[i].id + "'>" + types[i].name + "</option>")
                    }else{
                        $("#type").append("<option  value='" + types[i].id + "'>" + types[i].name + "</option>")

                    }
                }
            }

        )
    })

    $("#pass").click(function () {
        var url = '/sys/association/';
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
        var url = '/sys/association/';
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
