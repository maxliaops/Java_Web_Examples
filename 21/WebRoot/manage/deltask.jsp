<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page import="com.bwm.db.Condb"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>删除课题页面</title>
</head>
<body>
<%
	Condb con=new Condb();
	String str=new String(request.getParameter("te").getBytes("iso-8859-1"),"gb2312");
	if(str!=null){
		//String sql="delete from tb_Task where Taskname='"+str+"'";
		String te1="delete from tb_Task where Taskname='"+str+"'";
		String te="delete from tb_Con where Taskname='"+str+"'";
		int tem=con.executeUpdate(te);
		out.println(te1);
		//con.executeUpdate(sql);
		//con.executeUpdate(te);
		int temp=con.executeUpdate(te1);
		if(temp==1){
			response.sendRedirect("lacktask.jsp");
		}else{
			out.print("删除失败！！！");
		}
	}
%>
</body>
</html>
