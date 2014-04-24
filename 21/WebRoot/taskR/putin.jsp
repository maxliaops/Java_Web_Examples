<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page import="com.bwm.db.Condb"%> 
<% request.setCharacterEncoding("gb2312"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>

<body>
<%
	Condb con=new Condb();
	String Username=request.getParameter("Username");
	String Password=request.getParameter("Password");
	String Office=request.getParameter("Office");
	String Name=request.getParameter("Name");
	String Age=request.getParameter("Age");
	String Business=request.getParameter("Business");
	String Post=request.getParameter("Post");
	String Dattime=request.getParameter("Datetime");
	String Bio=request.getParameter("Bio");
	String Strupd="update tb_Person set Username='"+Username+"',Password='"+Password+"',Office='"+Office+"',Name='"+Name+"',Age='"+Age+"',Business='"+Business+"',Post='"+Post+"',Datetime='"+Dattime+"',Bio='"+Bio+"' where Username='"+session.getAttribute("name")+"'";
	int temp=con.executeUpdate(Strupd);
	if(temp==1){
%>
<script language="javascript">
	alert("数据更新成功");
</script>
<%
}
%>
</body>
</html>
