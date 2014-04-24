<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>添加课程</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
function check(form){
	if(form.name.value==""){
		alert("请输入课程名称!");form.name.focus();return;
	}
	form.submit();
}
</script>
<body>
<table width="292" height="175" border="0" cellpadding="0" cellspacing="0" background="../Images/subBG.jpg">
  <tr>
    <td valign="top"><table width="100%" height="175" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="12%" height="47">&nbsp;</td>
        <td width="85%" valign="bottom"><table width="86%" height="31" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td class="word_white">添加课程</td>
          </tr>
        </table></td>
        <td width="3%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><table width="100%" height="106"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="106" align="center" valign="middle">
	<html:form action="/manage/lesson.do?action=lessonAdd" method="post" focus="name">
	<table height="77"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="67" height="30" align="center">课程名称：</td>
        <td width="181">
          <html:text property="name" size="25"/></td>
      </tr>
      <tr>
        <td height="47" align="center">&nbsp;</td>
        <td><html:button property="button" styleClass="btn_grey" value="保存" onclick="check(lessonForm)"/>
&nbsp;
<html:button property="button" styleClass="btn_grey" value="关闭" onclick="window.close();"/></td>
      </tr>
    </table>
	</html:form></td>
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
