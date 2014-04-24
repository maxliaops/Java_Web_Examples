<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%>
<%@ page import="com.bwm.string.Str"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>成果入库详单</title>
<style type="text/css">
<!--
.style1 {color: #000000}
-->
</style>
</head>
<link href="../css/style.css" rel="stylesheet">
<body>
<%
	Str str=new Str();
	Condb con=new Condb();
	String temp=str.toChinese(request.getParameter("temp"));
	String sql="";
	sql="select * from tb_Result where Result='"+1+"'and Resultname='"+temp+"'";
	ResultSet rs=con.executeQuery(sql);
	while(rs.next()){
%>
<table width="640" height="367" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D1E2D6" bordercolorlight="#FFFFFF" bgcolor="#FFFFFF" >
  <form action="check.jsp" method="post" name="form1">
    <tr align="center" bgcolor="#F7F3F7">
      <td height="32" colspan="3"><center class="style1">
        <font size="+1" face="黑体">已入库成果</font>
      </center></td>
    </tr>
    <tr>
      <td width="108" height="24" align="center">成果形式:</td>
      <td width="526" height="24" colspan="2"><font color="#0000CC"><%=rs.getString(1)%></font></td>
    </tr>
    <tr>
      <td height="24" align="center">成果名称:</td>
      <td height="24" colspan="2"><font color="#0000CC"><%=rs.getString(2)%></font></td>
    </tr>
    <tr>
      <td height="24" align="center">研究领域:</td>
      <td height="24" colspan="2"><font color="#0000CC"><%=rs.getString(3)%></font></td>
    </tr>
    <tr>
      <td height="24" align="center">成果字数:</td>
      <td height="24" colspan="2"><font color="#0000CC"><%=rs.getString(4)%></font></td>
    </tr>
    <tr>
      <td height="24" align="center">研究分类:</td>
      <td height="24" colspan="2"><font color="#0000CC"><%=rs.getString(5)%></font></td>
    </tr>
    <tr>
      <td height="24" align="center">成果类型:</td>
      <td height="24" colspan="2"><font color="#0000CC"><%=rs.getString(6)%></font></td>
    </tr>
    <tr>
      <td height="24" align="center">成果语言:</td>
      <td height="24" colspan="2"><font color="#0000CC"><%=rs.getString(7)%></font></td>
    </tr>
    <tr>
      <td height="24" align="center">发表时间:</td>
      <td height="24" colspan="2"><font color="#0000CC"><%=rs.getDate(8)%></font></td>
    </tr>
    <tr>
      <td height="24" align="center">作者姓名:</td>
      <td height="24" colspan="2" align="left"><font color="#0000CC"><%=rs.getString(9)%></font></td>
    </tr>
    <tr>
      <td height="24" align="center">内容摘要:</td>
      <td height="24" colspan="2"><font color="#0000CC"><%=rs.getString(10)%></font></td>
    </tr>
    <tr>
      <td height="24" align="center">备注:</td>
      <td height="24" colspan="2"><font color="#0000CC"><%=rs.getString(11)%></font></td>
    </tr>
   
  </form>
</table>
<%
}
con.close();
%>
</body>
</html>
