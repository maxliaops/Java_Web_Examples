<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<body>
<%! String sql;%>
<%sql="delete tb_Enterprise where ID="+Integer.parseInt(request.getParameter("id"));
int i=data.getint(sql);
if(i>0){%>
<script language="javascript">
	alert("企业数据删除成功");
	window.close();
	opener.location.reload();
</script>
<%}%>
</body>
</html>
