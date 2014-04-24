<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page import="com.bwm.db.Condb"%> 
<% request.setCharacterEncoding("gb2312"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>查询情况</title>
<style type="text/css">
<!--
.style3 {color: #CC9933}
-->
</style>
</head>
<link href="../css/style.css" rel="stylesheet">

<body>
<table width="610" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" bordercolordark="#D1E2D6" bordercolorlight="#FFFFFF" bgcolor="#ECFBFF" class="tableBorder">
  <form action="" method="post" name="form1">
  <tr align="center" bgcolor="#F7F3EF">
    <td height="26" colspan="17"><center class="style3">
      <font size="+1" face="黑体">查询成果入库情况</font>
    </center></td>
  </tr>
  <tr>
    <td width="29" height="22" align="center"><span class="head">序号</span></td>
    <td width="60" align="center"><span class="head">成果形式</span></td>
    <td width="185" align="center"><span class="head">成果名称</span></td>
    <td width="52" align="center"><span class="head">成果字数</span></td>
    <td width="75" align="center"><span class="head">立项日期</span></td>
    <td width="130" align="center"><span class="head">内容摘要</span></td>
    <td width="63" height="22" colspan="11"><span class="head">是否入库</span></td>
  </tr>
  <%
	Condb con=new Condb();
	String datetime=request.getParameter("datetime");
	String dattime=request.getParameter("dattime");
	String resultname=request.getParameter("resultname");
	String sql="select * from tb_Result where Dattime between '"+datetime+"' and '"+dattime+"' and  Resultname like '%"+resultname+"%'";
	ResultSet rs=con.executeQuery(sql);
	int num=0;
	while(rs.next()){
	num++;
%>
  <tr>
    <td height="20" align="center"><%=num%></td>
    <td align="center"><%=rs.getString(1)%>&nbsp;</td>
    <td align="center"><%=rs.getString(2)%>&nbsp;</td> 
    <td align="center"><%=rs.getString(4)%>&nbsp;</td> 
    <td align="center"><%=rs.getDate(8)%>&nbsp;</td>
	<td align="center"><%=rs.getString(10)%>&nbsp;</td>
    <td height="20" colspan="11" align="center"><%String str=rs.getString(12);if(str.equals("0")) out.println("否");if(str.equals("1")) out.println("是");%></td>
  </tr>
 
  <%
}
con.close();
%>
 <tr>
    <td height="21" colspan="17" align="center" bgcolor="#F7F3EF"><a href="rquery.htm">返回</a></td>
    </tr>
</form>
</table>
</body>
</html>
