<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <title>用户登录</title>

    <!-- css -->
    <link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="/css/style2.css" rel="stylesheet" type='text/css' media="all"/>
    <link rel="stylesheet" href="/css/linearicons.css">
    <script type="text/javascript" src="/js/jquery-3.5.1.min.js"></script>
    <!-- /css -->
</head>
<body>
<div class="overlay">
    <h1 class="w3layouts agileits" style="font-family: 华文楷体; padding-bottom: 5px;">用 户 登 录</h1>
    <div class="content-w3ls agileits">
        <img src="/img/girl.png" alt="" class="user-wthree">
        <form method="post" onsubmit="return false;" id="data_form">
            <div class="form-group1-agile agile-info">
                <input type="text" name="id" id="id" placeholder="请输入账号">
            </div>
            <div class="form-group2-agile agile-info">
                <input type="password" id="password" placeholder="请输入密码" name="password">
            </div>
          <a href="#" id="save" class="face-link"><i class="fa " aria-hidden="true"></i>
              登录</a>
            <button type="submit" id="sub" hidden></button>
        </form>

    </div>

</div>
</body>
<script>
    $("#save").click(function () {
        $("#sub").click();
    })
    $('#data_form').submit(function () {
        //拼接数据,serialize为序列化表格数据
        var data = $('#data_form').serialize() + "";//数据
        $.ajax({
            url: '/login',
            type: 'post',
            data: new FormData($("#data_form")[0]),
            dataType: 'json',
            cache: false,
            processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
            contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
            success: function (response) {
                if (response.code == 0) {
                    //成功，显示提示消息，并刷新表格
                    window.location.href = response.msg;
                } else {
                    layer.alert(response.msg, {icon: 5, anim: 6});
                }
            }
        })
    });

</script>
</html>