<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 配置文件 -->
<script type="text/javascript" src="ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="lang/zh-cn/zh-cn.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="add" method="post">
	标题：<input type="text" style="width: 190px; text-align: center;" name="title"><br><br>
	<textarea id="container" name="container" style="width: 800px; height: 400px;">
    </textarea>

    <script type="text/javascript">
    var ue = UE.getEditor('container');
    $(document).ready(function () {
        var value = $("#container").val();       //使用html格式
        UE.getEditor('container').setContent(value, false);  //false清空内容再插入
    });
    var SetValue = function () {
        var value = UE.getEditor('container').getContent();
        $("#container").val(value);            
    };
    </script>

	<input type="submit" value="保存" "><p></p>
	</form> 
</body>
</html>