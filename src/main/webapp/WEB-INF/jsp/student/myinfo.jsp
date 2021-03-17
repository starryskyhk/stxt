<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>基本资料</title>
    <%@include file="/WEB-INF/jsp/common2.jsp" %>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


</head>
<style type="text/css">
    #d1 {
        width: 100px;
        height: 100px;
        border: 1px solid #F6214B;
        border-radius: 100%;
        overflow: hidden;
    }

    img {
        max-height: 100%;
    }

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
</style>
</head>
<body onload="showDT()">
<%@include file="/WEB-INF/jsp/student/head.jsp" %>
<div class="site-main-container">
    <!-- Start top-post Area -->
    <section class="latest-post-area pb-120">
        <div class="container no-padding">
            <div class="row">
                <%@include file="/WEB-INF/jsp/student/left.jsp" %>
                <div class="col-lg-9 post-list">
                    <!-- Start latest-post Area -->

                    <div class="latest-post-wrap">
                        <h4 class="cat-title">基本资料</h4>
                        <div class="rtcont fr">
                            <div class="row">
                                <div class="col-lg-12">
                                    <section class="panel">
                                        <div class="panel-body">
                                            <div class=" form">
                                                <form onsubmit="return false;" id="data_form" class="cmxform form-horizontal adminex-form"
                                                      method="post" 7>
                                                    <div style="overflow: hidden;" class=" flot form-group center">
                                                        <label for="cname" class=" control-label ">用户名：</label>
                                                        <div class="col-lg-3 ">
                                                            <input class=" form-control" id="" name=""
                                                                   minlength="2" type="text" value="啦啦维吉尔"/>
                                                        </div>
                                                        <label for="name" class=" control-label">真实姓名：</label>
                                                        <div class="col-lg-3 ">
                                                            <input class="form-control " id="name" type="text"
                                                                   name="name" value="${user.name}"/>
                                                        </div>
                                                    </div>
                                                    <div style="overflow: hidden;" class=" flot form-group center">
                                                        <label for="id" class="control-label ">学号：</label>
                                                        <div class="col-lg-3">
                                                            <input readonly class=" form-control" id="id" name="id"
                                                                   minlength="2" type="text" value="${user.id}"/>
                                                        </div>
                                                        <label for="sex" class="control-label ">性别：</label>
                                                        <div id="sex" style="margin-top: 2%;" class="col-lg-3">
                                                            <input type="radio" name="sex" value="0" ${user.sex==0?"checked":""}/>男
                                                            <input type="radio" name="sex" value="1" ${user.sex==1?"checked":""} />女
                                                        </div>
                                                    </div>

                                                    <div style="overflow: hidden;" class=" flot form-group center">
                                                        <label for="phone" class="control-label ">联系方式：</label>
                                                        <div class="col-lg-3">
                                                            <input class="form-control " id="phone" type="text" name="phone"
                                                                   value="${user.phone}"/>
                                                        </div>
                                                        <label for="email" class="control-label ">email：</label>
                                                        <div class="col-lg-3">
                                                            <input class="form-control " id="email" type="email" name="email"
                                                                   value="${user.email}"/>
                                                        </div>
                                                    </div>
                                                    <div style="overflow: hidden;" class=" flot form-group center">
                                                        <label for="college" class="control-label ">学院：</label>
                                                        <div class="col-lg-3">
                                                            <input  class="form-control " id="college" type="text" name=""
                                                                   value="计算机学院"/>
                                                        </div>
                                                        <label for="className" class="control-label ">班级：</label>
                                                        <div class="col-lg-3">
                                                            <input class="form-control " id="className" type="text" name="className"
                                                                   value="${user.className}"/>
                                                        </div>
                                                    </div>
                                                    <div style="overflow: hidden;" class=" flot form-group center">
                                                        <div class="col-lg-offset-2 col-lg-10">
                                                            <button style="float: right; margin-left: 2%;"
                                                                    class="btn btn-primary" type="submit">保存
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
    </section>
</div>
<script>
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
                        location.reload();
                    });
                } else {
                    layer.alert(response.msg, {icon: 5, anim: 6});
                }
            }
        })
    });

</script>

</body>
</html>
