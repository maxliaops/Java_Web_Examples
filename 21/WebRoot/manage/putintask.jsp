<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>已入库课题情况</title>
<style type="text/css">
<!--
.style3 {color: #CC9933}
-->
</style>
</head>
<link href="../css/style.css" rel="stylesheet">
<body>
<table width="610" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D1E2D6" bordercolorlight="#FFFFFF" bgcolor="#FAFAFA">
  <tr align="center" bgcolor="#D1E2D6">
    <td height="30" colspan="4" bgcolor="#F7F3EF"><center class="style3">
      <font size="+1" face="黑体">已入库课题</font>
    </center></td>
  </tr>
  <tr>
    <td width="37" height="22" align="center">序号</td>
    <td width="421" height="22" align="center">课题名称</td>
    <td width="110" height="22" align="center">立项时间</td>
    <td width="103" height="22" align="center">完成时间</td>
  </tr>
  <%
  Condb con=new Condb();
  int num=0;
  String sql="select * from tb_Task where Whether='"+1+"'";
  ResultSet rs=con.executeQuery(sql);
  while(rs.next()){
  num++;
  %>
  <tr>
    <td width="37" height="22" align="center"><%=num%></td>
    <td height="22" align="left"><a href="Tparticular.jsp?temp=<%=rs.getString(2)%>"><%String str=rs.getString(2);out.println(str);%></a></td>
    <td height="22" align="center"><%=rs.getDate(9)%></td>
    <td height="22" align="center"><%=rs.getDate(10)%></td>
  </tr>
  <%
  }
  con.close();
  %>
</table>
</body>
</html>
