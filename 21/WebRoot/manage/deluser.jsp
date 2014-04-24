<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%>
<%@ page import="com.bwm.string.Str"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>
<body>
<%
	Str str=new Str();
	Condb con=new Condb();
	String temp=str.toChinese(request.getParameter("temp"));
	String tem="select * from tb_Person where Uername='"+temp+"'";
	String sql="delete from tb_Person where Username='"+temp+"'";
	int te=con.executeUpdate(sql);
	if(te<0){
	out.println("数据库错误请与系统管理员联系");
	}else{
		response.sendRedirect("Uparticular.jsp");
	}
	con.close();
%>
</body>
</html>
