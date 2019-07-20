<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title></title>
</head>
<body>

<form>
    <input type="file" id="file1" name="file1" />
    <img id="img1" src="" alt=""/>
</form>
<table class="table">
    <caption>火车票识别结果</caption>
    <thead>
    <tr>
        <th>票号</th>
        <th>出发地</th>
        <th>车次</th>
        <th>目的地</th>
        <th>乘车时间</th>
        <th>票价</th>
        <th>座位信息</th>
        <th>有效期</th>
        <th>乘车人姓名</th>
        <th>身份证号</th>
        <th>车站代码</th>
    </tr>
    </thead>
    <tbody id="result_train">

    </tbody>
</table>
<script src="static/js/jquery1.6.1.js"></script>
<script>
    //选择图片后，预览图片
    var result_train = document.getElementById("result_train");
    result_train.innerHTML = "";
    document.getElementById("file1").onchange=function(){
        //1 创建文件读取对象
        var reader=new FileReader();

        //文件存储在file表单元素的files属性中，它是一个数组
        //没有返回值，但是读取完毕后，将读取结果存储在对象的result中
        var fil=document.getElementById("file1").files;
        // console.log(fil);
        reader.readAsDataURL(fil[0]);
        //当读取成功后触发
        reader.onload=function(){
            // console.log(reader.result);
            document.getElementById("img1").src=reader.result;
            $.ajax({
                url: "/DistinguishDemo/distinguish",
                type: "POST",
                data: {
                    "img": reader.result
                },
                success: function(result) {
                    result = $.parseJSON(result);
                    console.log(result.words_result);
                    result = result.words_result
                    result_train.innerHTML = result_train.innerHTML +
                        "<tr>" +
                        "<td>" + result[0].words + "</td>" +
                        "<td>" + result[2].words + "</td>" +
                        "<td>" + result[3].words + "</td>" +
                        "<td>" + result[4].words + "</td>" +
                        "<td>" + result[7].words + "</td>" +
                        "<td>" + result[8].words + "</td>" +
                        "<td>" + result[9].words + "</td>" +
                        "<td>" + result[10].words + "</td>" +
                        "<td>" + result[11].words + "</td>" +
                        "<td>" + result[12].words + "</td>" +
                        "<td>" + result[13].words + "</td>" +
                        "</tr>"
                },
                //请求失败，包含具体的错误信息
                error: function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            })
        };
    };
</script>
</body>
</html>