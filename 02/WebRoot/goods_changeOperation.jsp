<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>

<body>

<%
String goods_id=(String)request.getAttribute("goods_id");

out.print("<script language=javascript>alert('您回执发货单确认成功！！！');window.location.href='goods_queryGoodsId.action?goods_id="+goods_id+"';</script>");

%>






</body>
</html>
