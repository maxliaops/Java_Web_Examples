<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.bwm.db.Conn" %>
<%@ include file="include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0px">
<table width="98%" height="500"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td height="50" align="center"><div id="font">招聘信息管理</div></td>
  </tr>
  <tr>
    <td valign="top"><table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">
      <tr align="center" bgcolor="#21536A">
        <td height="22"><div id="reg">用户名</div></td>
        <td><div id="reg">所属行业</div></td>
        <td><div id="reg">招聘职位</div></td>
        <td><div id="reg">诚诺薪水</div></td>
        <td ><div id="reg">发布日期</div></td>
        <td ><div id="reg">有效日期</div></td>
        <td ><div id="reg">其他说明</div></td>
        <td ><div id="reg">删除</div></td>
      </tr>
      <tr>
	<td colspan="8" height="8"></td>
      </tr>
<%
Conn con=new Conn();
ResultSet rs=con.getRs("SELECT * FROM tb_cjob");
while(rs.next()){
        String strSname=rs.getString(1);
%>
      <tr align="center" valign="baseline">
        <td height="22"><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getDate(6)%></td>
        <td><%=rs.getDate(7)%></td>
        <td width="150" align="left"><%=rs.getString(8)%></td>
        <td><a href="dcjob.jsp?jobid=<%=strSname%>">删除</a></td>
      </tr>
<%
}
con.close();
%>
      <tr>
        <td colspan="8">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
