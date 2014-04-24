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
    <td height="50" align="center"><div id="font">学生信息管理</div></td>
  </tr>
  <tr>
    <td valign="top"><table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">
      <tr align="center" bgcolor="#21536A">
	<td height="22"><div id="reg">用户名</div></td>
	<td><div id="reg">密码</div></td>
	<td><div id="reg">真实姓名</div></td>
	<td><div id="reg">性别</div></td>
	<td ><div id="reg">出生日期</div></td>
	<td ><div id="reg">毕业学校</div></td>
	<td ><div id="reg">所学专业</div></td>
	<td ><div id="reg">最高学历</div></td>
	<td ><div id="reg">电子邮件</div></td>
	<td ><div id="reg">删除</div></td>
      </tr>
<%
Conn con=new Conn();
ResultSet rs=con.getRs("SELECT * FROM tb_student");
while(rs.next()){
%>
      <tr align="center">
	<td height="22" align="left">
      <%
	String strSname=rs.getString(1);
	out.print(strSname);
%></td>
	<td align="left"><%=rs.getString(2)%></td>
	<td align="left"><%=rs.getString(3)%></td>
	<td align="center">
<%
	if(rs.getInt(5)==1){
		out.print("男");
	}else{
		out.print("女");
	}
%></td>
	<td align="center"><%=rs.getDate(6)%></td>
	<td align="left"><%=rs.getString(7)%></td>
	<td align="left"><%=rs.getString(8)%></td>
	<td align="center"><%=rs.getString(9)%></td>
	<td align="left"><%=rs.getString(10)%></td>
	<td align="center"><a href="dstudent.jsp?sname=<%=strSname%>">删除</a></td>
      </tr>
<%
}
con.close();
%>
      <tr>
	<td colspan="10">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
