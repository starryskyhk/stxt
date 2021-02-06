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
                    <h4>更改社团信息</h4>
                </div>
                <div class="card-body">
                    <form class="form-horizontal col-lg-6" method="post" onsubmit="return false;" id="data_form">
                        <input type="hidden" name="id" id="id" value="${association.id}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团名称</label>
                            <div class="col-sm-8">
                                <input class="form-control" value="${association.name}" type="text" placeholder="请输入社团名称" name="name"
                                       id="name">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团简介</label>
                            <div class="col-sm-8">
                                <textarea  placeholder="请输入社团简介"  name="brief" id="brief">
                                    ${association.brief}
                                </textarea>
                            </div>
                        </div>

                        <%--                        <div class="form-group">--%>
                        <%--                            <label class="col-sm-3 control-label">性别</label>--%>
                        <%--                            <div class="col-sm-8">--%>
                        <%--                                <select class="form-control" name="sex">--%>
                        <%--                                    <option value="1">男</option>--%>
                        <%--                                    <option value="2">女</option>--%>
                        <%--                                </select>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">官方QQ</label>
                            <div class="col-sm-8">
                                <input value="${association.qq}" class="form-control" type="text" name="qq" id="qq">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">官方邮箱</label>
                            <div class="col-sm-8">
                                <input value="${association.email}" class="form-control" type="text" name="email" id="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团负责人id</label>
                            <div class="col-sm-8">
                                <input class="form-control" value="${association.studentId}" type="text" name="studentId" id="studentId">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">负责老师工号</label>
                            <div class="col-sm-8">
                                <input class="form-control" value="${association.teacherId}" type="text" name="teacherId" id="teacherId">
                            </div>
                        </div>
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

    $('#data_form').submit(function () {
        var data =$('#data_form').serialize() + "";//数据
        $.ajax({
            url: '/sys/association',
            type: 'post',
            data: data,
            dataType: 'json',
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
