<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%>
<%@ page import="com.bwm.page.Show"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>

<body>
<%
	Condb con=new Condb();
	Show show=new Show();    
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	String sql="select * from tb_Person where Username='"+name+"' and Password='"+password+"'";
	ResultSet rs=con.executeQuery(sql);
	if(rs.next()){ 
	int str=rs.getInt(11);
	if(str==1){ 
		response.sendRedirect("index.htm"); 
	}else{
		out.print(show.errorBox("非法的管理员名请不要登录","错误信息"));
		out.close();
	}
}else{
%>
<script language="javascript">
	alert("用户名或密码错误");  
	history.back();
</script>
<%
}
con.close();
%>
</body>
</html>
