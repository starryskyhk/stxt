<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    Hello World
    <form action="/sys/user/upload" method="post" enctype="multipart/form-data">
        <input type="file" name="file" value="请上传图片"/>
        <input type="submit" value="提交">
    </form>
</body>
<script>

</script>
</html>