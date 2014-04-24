<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.Dbproduct"%>
<%@ page import="electric.dbs.Productdb"%>
<%@ page import="electric.dbs.product"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%
     int id=ParamUtils.getIntParameter(request,"id",0);
     Dbproduct pro=null;
     if(id>0)
         {
             pro=new Dbproduct(id);
         }
%>
<html>
<head>
<title>产品展示详细页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr bgcolor="#E6E0DC">
    <td height="5" colspan="3"></td>
  </tr>
  <tr>
    <td width="5" height="40" bgcolor="#E6E0DC" class="white"></td>
    <td background="Images/Top.GIF" class="white">&nbsp;≡ 产品展示详细页面 ≡</td>
    <td width="5" bgcolor="#E6E0DC" class="white"></td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <table width="100%" height="267"  border="0" cellpadding="-2" cellspacing="-2">
        <tr>
          <td width="2%" height="267"></td>
          <td width="93%" valign="top" style="padding:5px;">
		<form method="post" action="register.asp" name="form1">
		<table width="534" height="276"  border="0" cellpadding="0" cellspacing="0">
          <tr>

            <td width="231" rowspan="4" valign="top" height="100"><div align="left"><img src="<%=pro.getPic().substring(1,pro.getPic().length())%>" width="220" height="229" align="top"></div></td>
            <td width="70" height="25" align="center">产品名称：</td>
            <td width="233" height="16"><%=pro.getProductname()%></td>
          </tr>
          <tr>
            <td width="70" height="25" align="center">产品单价：</td>
            <td width="233" height="13" ><%=pro.getProductprice()%></td>
          </tr>
          <tr>
            <td width="70" height="25" align="center">生 产 商：</td>
            <td width="233" height="9" ><%=pro.getProductform()%></td>
          </tr>
          <tr>
            <td width="70" height="62" align="center">产品介绍：</td>
            <td width="233" height="62"><%=pro.getProductnote()%></td>
          </tr>
        </table>
		</form>		  </td>
          <td width="5%">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td height="5" bgcolor="#eeeeee"></td>
  </tr>
  <tr>
    <td height="5" bgcolor="#E6E0DC"></td>
  </tr>
</table>
</body>
</html>