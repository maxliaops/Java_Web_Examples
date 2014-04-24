<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.bwm.db.Data" %>
<%@ page import="com.bwm.page.Show" %>
<%@ include file="include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<%
request.setCharacterEncoding("gb2312");
Data data=new Data();
String strName=(String)request.getParameter("name");
String strAddress=(String)request.getParameter("address");
if(strName!=null&&strAddress!=null){
	if(strName.equals("")&&strAddress.equals("")){
		new Show().errorBox("请添加链接名称与地址！","错误信息");
	}else{
		int intT=data.insert("INSERT INTO tb_flink(name,address) VALUES('"+strName+"','"+strAddress+"')");
		if(intT>0){
			out.print("<script>alert('添加成功！');document.location='flink.jsp';</script>");
		}else{
			new Show().errorBox("添加失败！","错误信息");
		}
	}
}
%>
<body topmargin="0px">
<table width="98%" height="500"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td height="50" align="center"><div id="font">友情链接管理</div></td>
  </tr>
  <tr>
    <td valign="top"><table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">
      <tr align="center" bgcolor="#21536A">
	<td height="22"><div id="reg">链接名称</div></td>
	<td ><div id="reg">链接地址</div></td>
	</tr>
	<form method="post">
   <tr align="center">
	<td height="27"><input type="text" name="name"></td>
	<td><input name="address" type="text"></td>
	</tr>
   <tr align="center">
	<td height="27" colspan="2"><input name="Submit" type="submit" value="提交"></td>
	</tr>
	</form>
    <tr>
	<td colspan="2">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
