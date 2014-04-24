<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>显示通讯组</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
}
.STYLE2 {
	font-size: 10pt;
	color: #FFFFFF;
}
.STYLE4 {
	font-size: 10pt;
	color: #000000;
}
-->
</style>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
  <script language="javascript">
function Mycheck()
{
if(form1.name1.value=="")
{alert("请输入通讯组名称!!");form1.name1.focus();return;}
form1.submit();
}
</script>
<body>
  <form name="form1" method="post" action="tongxun_addWork.jsp">
<table width="302" height="230" border="0" cellpadding="0" cellspacing="0" background="../Images/noword.jpg">
  <tr>
    <td width="274" height="228" valign="top"><table width="289" height="225" border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td height="27" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br><span class="STYLE4">&nbsp;&nbsp;&nbsp;添加新通讯组类型 </span></td>
      </tr>
      <tr>
        <td height="198"><table width="282" height="92" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="83" height="46"><span class="STYLE4">通讯组名称</span></td>
            <td width="199"><input name="name1" type="text" id="name1" size="25" /></td>
          </tr>
          <tr>
            <td height="46" colspan="2" align="center"><table width="249" height="28" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="249">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="Submit" type="button" class="btn_grey"onclick="Mycheck();" value="发表">
                <input name="Submit2" type="button" class="btn_grey" onClick="JScript:window.close();" value="关闭">
                <input name="Submit3" type="button" class="btn_grey" onClick="JScript:form1.reset();" value="重填">
				</td>
			
           
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>




