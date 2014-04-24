<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="electric.dbs.Messdb"%>
<%@ page import="electric.dbs.mess"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">

<title>留言</title>
</head>

<body>
<%
	int id=ParamUtils.getIntParameter(request,"id",0);
	Messdb me=new Messdb();
	mess mes=null;
    if(id>0){
        mes=me.show(id);
   	}
%>
<table width="777" height="172"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="Images/tiring-room/tiring-room_01.gif" width="777" height="125"></td>
      </tr>
      <tr>
        <td height="47" valign="top" background="Images/tiring-room/tiring-room_02.gif"><jsp:include page="H_navigation.jsp"/></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="44" height="380" valign="top"><img src="Images/tiring-room/tiring-room_03.gif" width="44" height="248"></td>
    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="68" colspan="2" background="Images/tiring-room/h_broad.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
            <table border="0" width="100%">
              <tr>
                <td width="20%" align="center">用 户 名：</td>
                <td width="80%">&nbsp;<%=mes.getMname()%></td>
              </tr>
              <tr>
                <td width="20%" align="center">主&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
                <td width="80%">&nbsp;<%=mes.getMtext()%></td>
              </tr>
              <tr>
                <td width="20%" align="center">时&nbsp;&nbsp;&nbsp;&nbsp;间：</td>
                <td width="80%">&nbsp;<%=mes.getCreateDate().substring(0,4)%>年<%=mes.getCreateDate().substring(4,6)%>月<%=mes.getCreateDate().substring(6,8)%>日</td>
              </tr>
              <tr>
                <td width="20%" height="80" align="center">留言内容：</td>
                <td width="80%">&nbsp;<%=mes.getMnote()%></td>
              </tr>
              <tr>
                <td width="20%" height="38">&nbsp;</td>
                <td width="80%"><input type="button" class="btn_grey" onClick="history.back();" value="&nbsp;返&nbsp;回&nbsp;">
              </tr>
            </table>
		  </td>
      </tr>
    </table></td>
    <td width="35" valign="top"><img src="Images/tiring-room/tiring-room_05.gif" width="35" height="248"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>
