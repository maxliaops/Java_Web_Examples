<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.actionForm.BookCaseForm" %>
<%@ page import="com.core.ChStr" %>
<html>
<head>
<title>修改书架信息</title>
<meta http-equiv="Content-Type" content="text/html" charset="gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>

<body>
<table width="292" height="175" border="0" cellpadding="0" cellspacing="0" background="Images/subBG.jpg">
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="3%" height="38">&nbsp;</td>
        <td width="94%">&nbsp;</td>
        <td width="3%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><%
BookCaseForm bookCaseForm=(BookCaseForm)request.getAttribute("bookCaseQueryif");
%>
          <form name="form1" method="post" action="bookCase?action=bookCaseModify">

    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="50" align="center">            书架名称：
            <input name="id" type="hidden" size="50" value="<%=bookCaseForm.getId()%>">
    <input name="name" type="text" value="<%=bookCaseForm.getName()%>"></td>
      </tr>
      <tr>
        <td height="35" align="center"><input name="Submit" type="submit" class="btn_grey" value="保存">
&nbsp;
<input name="Submit2" type="reset" class="btn_grey" value="重置">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" onClick="window.close()" value="关闭"></td>
      </tr>
    </table>
          </form></td>
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
