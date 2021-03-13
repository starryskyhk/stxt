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
                    <h4>登录</h4>
                </div>
                <div class="card-body">
                    <form  class="form-horizontal col-lg-6" method="post" onsubmit="return false;" id="data_form">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">用户名</label>
                            <div class="col-sm-8">
                                <input class="form-control" type="text" placeholder="请输入账号" name="id"
                                       id="id">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">密码</label>
                            <div class="col-sm-8">
                                <input class="form-control" type="text" placeholder="请输入密码" name="password"
                                       id="password">                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-md-9 col-md-offset-3">
                                <button class="btn btn-primary" type="submit"  id="save">保存
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
        //拼接数据,serialize为序列化表格数据
        var data = $('#data_form').serialize() + "";//数据
        $.ajax({
            url: '/login',
            type: 'post',
            data:  new FormData($("#data_form")[0]),
            dataType: 'json',
            cache:false,
            processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
            contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
            success: function (response) {
                if (response.code == 0) {
                    //成功，显示提示消息，并刷新表格
                    window.location.href=response.msg;
                } else {
                    layer.alert(response.msg, {icon: 5,anim: 6});
                }
            }
        })
    });
</script>
</html>
