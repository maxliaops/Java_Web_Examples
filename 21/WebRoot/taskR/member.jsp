<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ page import="com.bwm.db.Condb"%> 
<% request.setCharacterEncoding("gb2312"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>成员添加</title>
</head>
<link href="../css/style.css" rel="stylesheet">
<body>
<p>&nbsp;</p>
<%
	Condb con=new Condb();
	String result=request.getParameter("result");
	String mname=request.getParameter("mname");
	String munit=request.getParameter("munit");
	String moffice=request.getParameter("moffice");
	int inttem=0;
	if(result!=null||result.equals("")||mname!=null||munit!=null||moffice!=null){
		String str="select Member from tb_Member where MemID='"+result+"'";
		ResultSet rs=con.executeQuery(str);
		while(rs.next()){
			inttem=1;
	%>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<a href="memberadd.htm"><center><font size="+2" color="#0033CC" face="华文行楷"><%out.println("此成员ID已经被占用返回重新命名!");%></font></center></a>
	<%
		}
		if(inttem==0){
			String sql="insert into tb_Member(MemID,Member,Munit,Moffice)values('"+result+"','"+mname+"','"+munit+"','"+moffice+"')";
			con.executeUpdate(sql);
			String mem="insert into tb_Work(Username,MemID) values('"+session.getAttribute("name")+"','"+result+"')";
			con.executeUpdate(mem);
	%>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<center><font size="+2" face="华文行楷" color="#0033FF"><%out.println("添加成功");%></font></center>
	<center><a href="memberadd.htm"><font size="4" color="#0033FF" face="黑体">添加新成员</font></a></center>
	<center><a href="resultadd.htm"><font size="4" color="#0033FF" face="黑体">进入审报系统</font></a></center>
	<%
		}
	}
	con.close();
%>
	
</body>
</html>
