<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ page import="com.bwm.db.Condb"%>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.string.Str"%>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>未入库情况表</title>
<style type="text/css">
<!--
.style1 {color: #CC9933}
-->
</style>
</head>
<link href="../css/style.css" rel="stylesheet">
<body>
<table width="610" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" bgcolor="#FFFFFF" bordercolordark="#D1E2D6" bordercolorlight="#FFFFFF">
  <form action="Tcheck.jsp" name="form1" method="post">
  <tr align="center" bgcolor="#F7F3EF">
    <td height="26" colspan="6"><center class="style1">
      <font size="+1" face="黑体">未入库课题</font>
    </center></td>
  </tr>
  <tr>
    <td width="37" height="22" align="center">序号</td>
    <td width="274" height="22" align="center">课题名称</td>
    <td width="99" height="22" align="center">立项时间</td>
    <td width="100" height="22" align="center">完成时间</td>
    <td width="78" align="center">是否删除</td>

  </tr>
  <%
  	int num=0;
  	Condb con=new Condb();
  	String sql="select * from tb_Task where Whether='"+0+"'";
	ResultSet rs=null;
	rs=con.executeQuery(sql);
	while(rs.next()){
	String temp=rs.getString(2);
	num++;
  %>
  <tr>
    <td height="22" align="center"><%=num%></td>
    <td height="22" align="center"><a href="taskedit.jsp?temp=<%=temp%>"><%=temp%></a></td>
    <td height="22" align="center"><%=rs.getDate(9)%></td>
    <td height="22" align="center"><%=rs.getDate(10)%></td>
  
    <td height="22" align="center"><a href="deltask.jsp?te=<%=temp%>">删</a></td>
 </tr>
<%
		}
con.close();
%>
</form>
</table>
</body>
</html>
