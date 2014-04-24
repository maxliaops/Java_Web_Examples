<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.Dbnews"%>
<%@ page import="electric.dbs.news"%>
<%@ page import="electric.dbs.Newsdb"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%
      Newsdb newse=new Newsdb();
      int countpage=newse.selectsql(5);
      int a=0;
      //int i=0;
      a=ParamUtils.getIntParameter(request,"a",0);
%>
<html>
<head>
<title>详细内容</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>
<%Dbnews news_2=new Dbnews(a);%>		
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr bgcolor="#E6E0DC">
    <td height="5" colspan="3"></td>
  </tr>
  <tr>
    <td width="5" height="40" bgcolor="#E6E0DC" class="white"></td>
    <td background="Images/Top.GIF" class="white">&nbsp;<%=news_2.getMotif()%></td>
    <td width="5" bgcolor="#E6E0DC" class="white"></td>
  </tr>
</table>

<table width="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
		      <table width="100%" height="208"  border="0" cellpadding="-2" cellspacing="-2">
                <tr>
                  <td width="6%" height="187"></td>
                  <td colspan="2" valign="top" style="padding:5px;"><%=news_2.getContent()%></td>
                  <td width="5%">&nbsp;</td>
                </tr>
                <tr>
                  <td width="6%" bgcolor="#EEEEEE"></td>
                  <td width="46%" height="21" bgcolor="#EEEEEE"><div align="left">发布人 ：<%=news_2.getKithepeople()%></div></td>
                  <td width="43%" bgcolor="#EEEEEE"><div align="right">发表日期：<%=news_2.getCreateDate().substring(0,4)%>年<%=news_2.getCreateDate().substring(4,6)%>月<%=news_2.getCreateDate().substring(6,8)%>日</div></td>
                  <td width="5%" bgcolor="#EEEEEE">&nbsp;</td>
                </tr>
    </table>	</td>
  </tr>
  <tr>
    <td height="28" bgcolor="#E6E0DC">&nbsp;</td>
  </tr>
</table>
</body>
</html>
