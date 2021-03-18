<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <%@include file="/WEB-INF/jsp/common.jsp"%>
</head>
<body>
<div class="container-fluid p-t-15">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>添加社团</h4>
                </div>
                <div class="card-body">
                    <form enctype="multipart/form-data" class="form-horizontal col-lg-6" method="put" onsubmit="return false;" id="data_form">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团名称</label>
                            <div class="col-sm-8">
                                <input class="form-control" type="text" placeholder="请输入社团名称" name="name"
                                       id="name">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团简介</label>
                            <div class="col-sm-8">
                                <textarea class="form-control"   placeholder="请输入社团简介" name="brief" id="brief"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团类型</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="type" name="typeId">
                                    <option  value="">请选择社团类型</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">官方QQ</label>
                            <div class="col-sm-8">
                                <input class="form-control" type="text" name="qq" id="qq">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">官方邮箱</label>
                            <div class="col-sm-8">
                                <input class="form-control" type="text" name="email" id="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">封面图片</label>
                            <div class="col-sm-8">
                                <input class="form-control" type="file"  accept=".jpg,.jpeg,.png" name="file" id="file">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">社团负责人id</label>
                            <div class="col-sm-8">
                                <input class="form-control" type="text" name="studentId" id="studentId">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">负责老师工号</label>
                            <div class="col-sm-8">
                                <input class="form-control" type="text" name="teacherId" id="teacherId">
                            </div>
                        </div>



<%--                        <div class="form-group" style="display: none" id="collegeDiv">--%>
<%--                            <label class=" col-sm-3 control-label">学院</label>--%>
<%--                            <div class="col-sm-8">--%>
<%--                                <select id="college" class="select2-multiple" multiple>--%>
<%--                                    <option value=""></option> <!--取消默认第一个-->--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>


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

    $(function () {
        $.get(
            "/sys/type/0",
            {},
            function (data) {
                var types = data["types"];
                for(var i=0;i<types.length;i++){
                    $("#type").append("<option value='" + types[i].id + "'>" + types[i].name + "</option>")
                }
            }
        )
    })
    $('#data_form').submit(function () {
        //拼接数据,serialize为序列化表格数据
        var data = $('#data_form').serialize() + "";//数据
        $.ajax({
            url: '/sys/association',
            type: 'put',
            data:  new FormData($("#data_form")[0]),
            dataType: 'json',
            cache:false,
            processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
            contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
            success: function (response) {
                if (response.code == 0) {
                    //成功，显示提示消息，并刷新表格
                    popup.layermsg(response.msg, 'tb_departments');
                } else {
                    layer.alert(response.msg, {icon: 5,anim: 6});
                }
            }
        })
    });
</script>
</html>
