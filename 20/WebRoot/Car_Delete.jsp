<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>
<jsp:useBean id="datas" scope="page" class="cars.Bean1" />
<body>
<%!
String sql;
int sum;%>
<%int logo=Integer.parseInt(request.getParameter("id"));%>
<% sql="delete tb_Values where Logo="+logo;
sum=datas.getint(sql);
%>
<script language="javascript">
	alert("指定数据已经全部删除！");
	opener.location.reload();
	window.close();
</script>
</body>
</html>
