<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>外出登记网页对话框</title>
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
	font-size: 9pt;
	color: #000000;
}
.style4 {
	font-size: 9pt;
	color: #FFFFFF;
}
-->
</style>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
  <script language="javascript">
function Mycheck()
{
if(form1.name1.value=="")
{alert("请输入姓名!!");form1.name1.focus();return;}
if(form1.department.value=="")
{alert("请输入所属部门!!");form1.department.focus();return;}
if(form1.content.value=="")
{alert("请输入外出原因，再进行外出登记!!");form1.content.focus();return;}
if(form1.time1.value=="")
{alert("请输入外出时间!!");form1.time1.focus();return;}
if(form1.time2.value=="")
{alert("请输入外出返回时间!!");form1.time2.focus();return;}
form1.submit();
}
</script>
<body>
     <form name="form1" action="waichu_add_cl.jsp" method="post">
<table width="627" height="346" border="0" cellpadding="0" cellspacing="0" background="../Images/noword.jpg">
  <script language="javascript">
	function loadCalendar(field)
	{
    var rtn = window.showModalDialog("calender.jsp","","dialogWidth:280px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
    return;
}
</script>
  <tr>
    <td height="346" valign="bottom"><br><p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="style2">外出登记</span></p>
      <table width="617" height="310" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="46" colspan="8"><table width="597" height="27" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="61"><div align="center" class="STYLE2">姓名</div></td>
            <td width="192"><label>
              <input name="name1" type="text" id="name1" onKeyDown="if(event.keyCode==13){form1.department.focus();}" value="<%=application.getAttribute("un")%>" readonly="yes">
            </label></td>
            <td width="69"><div align="center" class="STYLE2">所属部门</div></td>
            <td width="275"><label>
              <input name="department" type="text" id="department" onKeyDown="if(event.keyCode==13){form1.content.focus();}">
            </label></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="54" height="205"><span class="STYLE2">外出原因</span></td>
        <td colspan="7"><label>
          <textarea name="content" cols="70" rows="12" wrap="physical" id="content"></textarea>
        </label></td>
      </tr>
      <tr>
        <td height="25" class="STYLE2">外出时间</td>
        <td width="65" height="25" class="STYLE2"><label></label></td>
        <td width="144" height="25" class="STYLE2"><input name="time1" type="text" id="time1" size="20" readonly="yes"></td>
        <td width="6" class="STYLE2">&nbsp;</td>
        <td width="39" height="25" class="STYLE2"><img src="../Images/date.gif" width="20" height="20" onClick="loadCalendar(form1.time1)"></td>
        <td width="20" height="25" class="STYLE2">至</td>
        <td width="145" class="STYLE2"><label>
          <input name="time2" type="text" id="time2" size="20" readonly="yes">
        </label></td>
        <td width="144" class="STYLE2">&nbsp;<img src="../Images/date.gif" width="20" height="20" onClick="loadCalendar(form1.time2)"></td>
      </tr>
      <tr>
        <td height="34" colspan="8" valign="top"><table width="589" height="34" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="34" valign="top"><table width="230" height="34" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td valign="middle"><div align="right"><input name="Submit" type="button" class="btn_grey"onclick="Mycheck();" value="提交"></td>
                <td valign="middle"><div align="left">&nbsp;&nbsp;<input name="Submit3" type="button" class="btn_grey" onClick="JScript:window.close();" value="关闭">
                </div></td>
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




