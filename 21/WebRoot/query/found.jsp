<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="../css/style.css" rel="stylesheet">
</head>
<body>
<%
Condb con=new Condb();
String keyID=request.getParameter("keyID");
String query=request.getParameter("query");
if(query.equals("成果查询")){
%>
<table width="640" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D1E2D6" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#F7F3F7">
    <td height="32" colspan="4">成果清单</td>
  </tr>
  <tr align="center" valign="middle">
    <td width="92" height="21">序号</td>
    <td width="203" height="21">成果名称</td>
    <td width="195" height="21">发表时间</td>
    <td width="140" height="21">作者姓名</td>
  </tr>
  <%
  	String sql="select * from tb_Result where keyid like '%"+keyID+"%'";
	ResultSet rs=con.executeQuery(sql);
	int num=0;
	while(rs.next()){
  	num++;
  %>
  <tr align="center" valign="middle">
    <td height="21"><%=num%></td>
    <td height="21"><a href="Rparticular.jsp?temp=<%=rs.getString(2)%>"><%out.println(rs.getString(2));%></td>
    <td height="21"><%=rs.getDate(8)%></td>
    <td height="21"><%=rs.getString(9)%></td>
  </tr>
</table>
  <%
  }
}
if(query.equals("课题查询")){
%>
<table width="640" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D1E2D6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td height="32" colspan="4" bgcolor="#F7F3F7">课题清单</td>
  </tr>
  <tr align="center" valign="middle">
    <td width="92" height="21">序号</td>
    <td width="203" height="21">课题名称</td>
    <td width="195" height="21">发表时间</td>
    <td width="140" height="21">作者姓名</td>
  </tr>
  <%
  	String sq="select * from tb_Task where keyid like '%"+keyID+"%'";
	ResultSet rss=con.executeQuery(sq);
	int sum=0;
	while(rss.next()){
  	sum++;
  %>
  <tr align="center" valign="middle">
    <td height="21"><%=sum%></td>
    <td height="21"><a href="Tparticular.jsp?temp=<%=rss.getString(2)%>"><%String str=rss.getString(2);out.println(str);%></a></td>
    <td height="21"><%=rss.getDate(9)%></td>
    <td height="21"><%=rss.getString(11)%></td>
  </tr>
  <%
  	}
}
con.close();
  %>
</table>
</body>
</html>
