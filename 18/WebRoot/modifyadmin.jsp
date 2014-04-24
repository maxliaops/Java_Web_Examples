<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.dbs.Dbshop"%>
<%
    int id=ParamUtils.getIntParameter(request,"id",0);
    Dbshop shop=new Dbshop(id);
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
<title>修改管理员信息</title>
</head>

<body>
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
        <td height="68" colspan="2" background="Images/tiring-room/h_manager.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
<form method="POST" action="shop_add.jsp">
<table border="0" width="100%">
    <tr>
      <td width="47%" height="30" align="right">新用户名：</td>
      <td width="53%"><input type="text" name="username" size="20"></td>
    </tr>
    <tr>
      <td width="47%" height="30" align="right">新 密 码：</td>
      <td width="53%"><input type="text" name="password" size="20"></td>
        <input type="hidden" name="id" value="<%=id%>">
        <input type="hidden" name="pageaction" value="MODIFY">
        <input type="hidden" name="responsepage" value="shopman.jsp">
        <input type="hidden" name="shopname" size="20" value="无">
        <input type="hidden" name="area" size="20" value="无">
        <input type="hidden" name="peopleman" size="20" value="无">
        <input type="hidden" name="mantel" size="20" value="无">
        <input type="hidden" name="shoptel" size="20" value="无">
        <input type="hidden" name="usertype" size="20" value="2">
     </tr>
    <tr align="center">
      <td height="30" colspan="2">
        &nbsp;&nbsp;&nbsp;
        <input name="B1" type="submit" class="btn_grey" value="提交">
&nbsp;        <input name="B2" type="reset" class="btn_grey" value="全部重写"> 
&nbsp;        <input name="button" type="button" class="btn_grey" onClick="history.back();" value="&nbsp;返&nbsp;回&nbsp;"></td>
      </tr>
  </table>
</form>
		  </td>
      </tr>
    </table></td>
    <td width="35" valign="top"><img src="Images/tiring-room/tiring-room_05.gif" width="35" height="248"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>

