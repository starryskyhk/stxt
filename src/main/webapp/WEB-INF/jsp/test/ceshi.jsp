<%--图片更改实时显示测试--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        #file{
            display: none;
        }
    </style>
    <jsp:include page="/WEB-INF/jsp/common.jsp"/>
</head>
<body>
    <input type="file" name="file" id="file" onchange="read()">
    <img id="image" width="500px" height="300px" src="/file/1612854983679-你的名字.jpg"/>
</body>
<script>
    $("#image").click(function () {
        $("#file").click();
    })

    //可以选择多个文件加载在页面
    function read(){
        var file = document.getElementById("file");
        for(var i=0;i<file.files.length;i++){
            let reader = new FileReader();
            var file1 = file.files[i];
            reader.readAsDataURL (file1);
            reader.onload = function (result) {
                //reader对象的result属性存储流读取的数据
                $("#image").attr("src",reader.result);
            }
        }
    }
</script>
</html>