<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误</title>
</head>
<body>
	访问页面错误！
	<br>
	<hr>
	<p>
	<s:property value="getText(exception.errorCode,exception.args)"/>
	</p>
	<s:a action="index">返回主页</s:a>
    <s:debug></s:debug>
</body>
</html>