<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新成功</title>
<style type="text/css">
	div{
		font-size: 12px;
	}
	p{
		font-size: 14px;
		color: red;
	}
</style>
<script type="text/javascript">
function closewindow(){
	if(window.opener){
		window.opener.location.reload(true);//刷新父窗体
		window.close();//关闭提示窗体 
	}
}
function clock(){
	i = i -1;
	if(i > 0){//如果i大于0
		setTimeout("clock();",1000);//1秒后重新调用clock()方法
	}else{
		closewindow();//调用关闭窗体方法
	}
}
var i = 3;//设置i值
clock();//页面加载后自动调用clock()
</script>
</head>
<body>
	<p>更新成功！</p>
	<div id="info">本窗口将在3秒后自动关闭</div>
	<input type="button" value="关闭窗口" onclick="closewindow();">
</body>
</html>