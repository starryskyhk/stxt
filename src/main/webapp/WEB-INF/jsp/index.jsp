<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
Hello World
<img src="/file/ddd.jpg">
<form action="/sys/association/upload" method="post" enctype="multipart/form-data">
    <%--        社团名称：<input type="text" name="name" placeholder="请输入社团名称">--%>
    <%--        <br/>--%>
    <%--        社团简介：<input type="text" name="brief" placeholder="请输入社团简介">--%>
    图片：<input type="file" name="file" value="请上传图片"/>
    <input type="submit" value="提交">
</form>
</body>

</html>