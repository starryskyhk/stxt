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
                    <h4>发布公告</h4>
                </div>
                <div class="card-body">
                    <form enctype="multipart/form-data" class="form-horizontal col-lg-6" method="put" onsubmit="return false;" id="data_form">
                        <input hidden name="id" value="${notice.id}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">公告标题</label>
                            <div class="col-sm-8">
                                <input class="form-control" value="${notice.title}" type="text" placeholder="请输入公告标题" name="title"
                                       id="title">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">公告内容</label>
                            <div class="col-sm-8">
                                <textarea cols="63%" rows="10%" placeholder="请输入公告内容" name="content" id="content">${notice.content}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">发布时间</label>
                            <div class="col-sm-8">
                                <input class="form-control" type="text" disabled value="${notice.createTime}"  name="createTime" id="createTime"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">最后一次修改时间</label>
                            <div class="col-sm-8">
                                <input  class="form-control" type="text" disabled value="${notice.updateTime}"  name="updateTime" id="updateTime"/>
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
        //拼接数据,serialize为序列化表格数据
        var data = $('#data_form').serialize() + "";//数据
        $.ajax({
            url: '/sys/notice',
            type: 'post',
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
