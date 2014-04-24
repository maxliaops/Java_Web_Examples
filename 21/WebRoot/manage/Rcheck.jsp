<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>

<body>
<%
	Condb con=new Condb();
	String temp=request.getParameter("Numbic");
	String choose=request.getParameter("choose");

	String sql="";
	if(choose.equals("on")){
		sql="Update tb_Result set Result=1 where Resultname='"+temp+"'";
	}
	int te=con.executeUpdate(sql);
	if(te>0){
		response.sendRedirect("resultedit.jsp");
	}else{
		out.println("数据库错误!!!");
	}
	
%>
</body>
</html>
