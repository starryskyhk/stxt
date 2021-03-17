<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>社团创办</title>
    <%@include file="/WEB-INF/jsp/common2.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <style type="text/css">
        .flot {
            margin-top: 2%;
        }

        .flot label {
            padding-left: 7%;
            float: left;
            display: inline-block;
            width: 140px;

            line-height: 38px;
            font-size: 16px;
            margin-top: 1%;
        }

        .flot div {
            float: left;
            margin: 1%;
            padding: 0;
        }

        .form-horizontal.adminex-form .form-group {
            border-bottom: 1px solid #eff2f7;
            padding-bottom: 15px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body onload="showDT()">
<%@include file="/WEB-INF/jsp/student/head.jsp" %>
<div class="site-main-container">
    <!-- Start top-post Area -->

    <section class="latest-post-area pb-10">
        <div class="container no-padding">
            <div class="row">
                <div class="col-lg-8 post-list " style="margin-left: 15%;">
                    <!-- Start latest-post Area -->
                    <div class="latest-post-wrap">
                        <h4 class="cat-title">创建社团</h4>


                        <div class="rtcont fr">
                            <div class="row">
                                <div class="col-lg-12">
                                    <section class="panel">
                                        <div class="panel-body">
                                            <div class=" form">
                                                <form enctype="multipart/form-data" onsubmit="return false;"
                                                      class="cmxform form-horizontal adminex-form" id="data_form"
                                                      method="put">
                                                    <input hidden name="studentId" value="${sessionScope.user.id}">
                                                    <div style="overflow: hidden;" class=" flot form-group center">
                                                        <label for="name" class=" control-label ">社团名称：</label>
                                                        <div class="col-lg-3 ">
                                                            <input class=" form-control" id="name" name="name"
                                                                   minlength="2" type="text" placeholder="请输入社团名称"
                                                                   onfocus="this.placeholder = ''"
                                                                   onblur="this.placeholder = '请输入社团名称'" required=""/>
                                                        </div>
                                                        <label for="type" class=" control-label">社团类别：</label>
                                                        <div id="" class="col-lg-3 ">
                                                            <select id="type" name="typeId"
                                                                    style="font-size: 14px;height: 35.5px"
                                                                    class="form-control">
                                                            </select>
                                                        </div>
                                                    </div>


                                                    <div style="overflow: hidden;" class=" flot form-group center">
                                                        <label for="curl" class="control-label ">社团简介：</label>
                                                        <div class="form-group"
                                                             style="border-bottom: none; padding: 0; margin: 0;">
                                                            <textarea class="form-control mb-10" cols="50" rows="4"
                                                                      name="brief" placeholder="请输入社团简介.."
                                                                      onfocus="this.placeholder = ''"
                                                                      onblur="this.placeholder = '社团简介'"
                                                                      required=""></textarea>
                                                        </div>
                                                    </div>
                                                    <div style="overflow: hidden;" class=" flot form-group center">
                                                        <label for="curl" class="control-label ">工号：</label>
                                                        <div class="col-lg-3">
                                                            <input class="form-control " id="teacherId" type="text"
                                                                   name="teacherId"
                                                                   placeholder="请输入负责老师工号"
                                                                   onfocus="this.placeholder = ''"
                                                                   onblur="this.placeholder = '请输入负责老师工号'" required=""/>
                                                        </div>
                                                        <label for="curl" class="control-label ">联系方式：</label>
                                                        <div class="col-lg-3">
                                                            <input class="form-control " id="phone" type="text"
                                                                   name="teacherId"
                                                                   placeholder="请输入老师联系方式"
                                                                   onfocus="this.placeholder = ''"
                                                                   onblur="this.placeholder = '请输入老师联系方式'" required=""/>
                                                        </div>
                                                    </div>
                                                    <div style="overflow: hidden;" class=" flot form-group center">
                                                        <label for="qq" class="control-label ">官方qq群：</label>
                                                        <div class="col-lg-3">
                                                            <input class="form-control " id="qq" type="text" name="qq"
                                                                   placeholder="请输入官方qq群"
                                                                   onfocus="this.placeholder = ''"
                                                                   onblur="this.placeholder = '请输入官方qq群'" required=""/>
                                                        </div>
                                                        <label for="email" class="control-label ">官方邮箱：</label>
                                                        <div class="col-lg-3">
                                                            <input class="form-control " id="email" type="email"
                                                                   name="email"
                                                                   placeholder="请输入官方邮箱" onfocus="this.placeholder = ''"
                                                                   onblur="this.placeholder = '请输入官方邮箱'" required=""/>
                                                        </div>
                                                    </div>
                                                    <div style="overflow: hidden;" class=" flot form-group center">
                                                        <label for="file" class="control-label ">上传图片：</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control" type="file"
                                                                   accept=".jpg,.jpeg,.png" name="file" id="file">
                                                        </div>

                                                    </div>

                                                    <div style="overflow: hidden;" class=" flot form-group center">
                                                        <div class="col-lg-offset-2 col-lg-10">
                                                            <button style="float: right; margin-left: 2%;"
                                                                    class="btn btn-primary" type="submit">保存
                                                            </button>
                                                            <button style="float: right;" class="btn btn-default"
                                                                    type="button">取消
                                                            </button>
                                                        </div>
                                                    </div>

                                                </form>
                                            </div>

                                        </div>
                                    </section>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </div>
</div>
</section>
</div>

<script>
    $(function () {
        $.get(
            "/sys/type/0",
            {},
            function (data) {
                var types = data["types"];
                for (var i = 0; i < types.length; i++) {
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
            data: new FormData($("#data_form")[0]),
            dataType: 'json',
            cache: false,
            processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
            contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
            success: function (response) {
                if (response.code == 0) {
                    //成功，显示提示消息，并刷新表格
                    popup.layermsg("申请成功，请等待审核", 'tb_departments');
                    setTimeout(function () {
                        location.reload();
                    }, 2000);
                } else {
                    layer.alert(response.msg, {icon: 5, anim: 6});
                }
            }
        })
    });

</script>
</body>
</html>
