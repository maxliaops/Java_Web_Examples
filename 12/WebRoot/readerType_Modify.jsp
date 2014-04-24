<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.actionForm.ReaderTypeForm" %>
<%@ page import="com.core.ChStr"%>
<html>
<head>
<title>修改读者类型信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="CSS/style.css">
</head>

<body>
<%
ReaderTypeForm readerTypeForm=(ReaderTypeForm)request.getAttribute("readerTypeQueryif");
ChStr chStr=new ChStr();
%>
<table width="292" height="175" border="0" cellpadding="0" cellspacing="0" background="Images/subBG.jpg">
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="3%" height="25">&nbsp;</td>
        <td width="94%">&nbsp;</td>
        <td width="3%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><table width="100%" height="131"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" valign="top"><form name="form1" method="post" action="readerType?action=readerTypeModify">
 <input name="id" type="hidden" size="50" value="<%=readerTypeForm.getId()%>"> 
  <table width="100%" height="111" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="28%" align="center">类型名称：      </td>
    <td width="72%"><input name="name" type="text" size="28" value="<%=readerTypeForm.getName()%>">
      </td>
  </tr>
  <tr>
    <td align="center">可借数量：</td>
    <td><input name="number" type="text" size="25" value="<%=readerTypeForm.getNumber()%>">
      (本)</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input name="Submit" type="submit" class="btn_grey" value="保存">
&nbsp;
<input name="Submit2" type="reset" class="btn_grey" value="重置">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" onClick="window.close()" value="关闭"></td>
  </tr>
</table>
</form></td>
          </tr>
        </table></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
