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
                    <h4>添加场地</h4>
                </div>
                <div class="card-body">
                    <form class="form-horizontal col-lg-6" method="post" onsubmit="return false;" id="data_form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">场地名称</label>
                            <div class="col-sm-8">
                                <input class="form-control"  name="name"  id="name" type="text" placeholder="请输入场地名称" >
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
        $.ajax({
            url: '/sys/space',
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
