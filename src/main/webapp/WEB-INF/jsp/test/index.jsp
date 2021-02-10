<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<input type="file" id="file"  multiple="multiple" onchange="read()">
<div id="imgDiv" ></div>
</body>
<script>
    //可以选择多个文件加载在页面
    function read(){
        var file = document.getElementById("file");
        var imgDiv = document.getElementById("imgDiv");
        for(var i=0;i<file.files.length;i++){
            let reader = new FileReader();
            var file1 = file.files[i];
            reader.readAsDataURL (file1);
            reader.onload = function (result) {
                //reader对象的result属性存储流读取的数据
                imgDiv.innerHTML += '<img src="' + reader.result + '" alt=""/>'
                console.log(reader.result) // 打印出转换后的base64
            }
        }
    }
</script>
</html>