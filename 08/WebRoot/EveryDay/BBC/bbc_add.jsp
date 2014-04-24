<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>添加新公告页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
 <script language="javascript">
function Mycheck()
{
if (form1.subject.value=="")
{ alert("请输入公告主题！");form1.subject.focus();return;}
if (form1.content.value=="")
{ alert("请输入公告内容！");form1.content.focus();return;}
form1.submit();
}
</script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
.style1 {color: #C60001}
.style2 {color: #669999}
.STYLE4 {
	font-size: 9pt;
	color: #FFFFFF;
}
.STYLE5 {
	font-size: 9pt;
	color: #000000;
}
-->
</style>
<link href="../../CSS/style.css" rel="stylesheet" type="text/css">
<body>
  <table width="557" height="401" border="0" cellpadding="-2" cellspacing="-2"
 background="../../Images/noword.jpg">
  <tr>
    <td width="817" height="349" valign="top"><table width="100%" height="90"
	  border="0" cellpadding="-2" cellspacing="-2">
      <tr><br>
        <td height="43" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE5">添加新公告信息</span></td>
      </tr>
      <tr>
        <td height="45">&nbsp;</td>
      </tr>
    </table>      
      <form name="form1" method="POST" action="bbc_addCenter.jsp">
        <table width="80%" height="213"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td width="13%" height="27"><div align="center" class="STYLE5">主题：</div></td>
            <td width="87%"><input name="subject" type="text" class="Style_subject" id="subject"></td>
          </tr>
          <tr>
            <td height="135" valign="top"><div align="center" class="STYLE5">内容：</div></td>
            <td><textarea name="content" cols="53" rows="8" class="Style_content"
			 id="content"></textarea></td>
          </tr>
          <tr>
            <td colspan="2"><div align="center">
                <input name="Button" type="button" class="btn_grey" value="提交" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="btn_grey" value="重置">                
                <input name="myclose" type="button" class="btn_grey" id="myclose" value="关闭"
				 onClick="javascrip:window.close()">
                <input name="person" type="hidden" id="person" value="<%=session.getAttribute("username")%>">
                </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>




