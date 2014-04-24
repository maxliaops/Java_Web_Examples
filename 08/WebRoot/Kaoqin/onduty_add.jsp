<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	 <link rel="stylesheet" type="text/css" href="CSS/style.css">
	<title>上下班登记对话框</title>
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
 .STYLE4 {
	font-size: 10pt;
	color: #FFFFFF;
}
 -->
</style>
<script language="javascript">
function Mycheck()
{
if(form1.name1.value=="")
{alert("请输入姓名!!");form1.name1.focus();return;}
if(form1.department.value=="")
{alert("请输入所属部门!!");form1.department.focus();return;}
if(form1.enroltype.value=="")
{alert("请选择登记类型!!");form1.enroltype.focus();return;}
if(form1.enrolremark.value=="")
{alert("请输入登记备注!");form1.enrolremark.focus();return;}
form1.submit();
}
</script>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="form1" action="onduty_add_cl.jsp" method="post">
<table width="627" height="329" border="0" cellpadding="0" cellspacing="0" background="../Images/noword.jpg">
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
    <td valign="top"><table width="617" height="312" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr><br>
        <td height="25" colspan="8" valign="middle">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br>&nbsp;&nbsp;&nbsp;<span class="STYLE2">上下班登记</span></td>
      </tr>
      <tr>
        <td height="17" colspan="8" valign="bottom"><table width="597" height="39" border="0" cellpadding="0" cellspacing="0">
          <tr><br>
            <td width="61" valign="bottom"><div align="center" class="STYLE2">姓名</div></td>
            <td width="192" valign="bottom"><label>
              <input name="name1" type="text" id="name1" onKeyDown="if(event.keyCode==13){form1.department.focus();}"value="<%=application.getAttribute("un")%>" readonly="yes">
            </label></td>
            <td width="69" valign="bottom"><div align="center" class="STYLE2">所属部门</div></td>
            <td width="275" valign="bottom"><label>
              <input name="department" type="text" id="department" onKeyDown="if(event.keyCode==13){form1.enroltype.focus();}">
            </label></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="60" height="222" valign="top"><table width="61" height="105" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="38" class="STYLE2">登记类型</td>
          </tr>
          <tr>
            <td height="59" class="STYLE2">登记备注</td>
          </tr>
        </table></td>
        <td colspan="7" valign="top"><table width="548" height="107" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="38"><select name="enroltype" id="enroltype" onkeydown="if(event.keyCode==13){form1.enrolremark.focus();}">
              <option>请选择登记类型类</option>
              <option value="上班登记">上班登记</option>
              <option value="下班登记">下班登记</option>
            </select>
            </td>
          </tr>
          <tr>
            <td height="59"><textarea name="enrolremark" cols="40" rows="6" id="enrolremark"></textarea></td>
          </tr>
        </table>        <label></label>
        <table width="404" height="60" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="bottom"><table width="230" height="34" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="middle"><div align="right"><input name="Submit" type="button" class="btn_grey"onclick="Mycheck();" value="提交">
                  </div></td>
                <td valign="middle"><div align="left">&nbsp;&nbsp;<input name="Submit3" type="button" class="btn_grey" onClick="JScript:window.close();" value="关闭">
                </div></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="25" colspan="8" class="STYLE2"><label></label>          <label></label>&nbsp;</td>
        </tr>
      <tr>
        <td height="13" colspan="8" valign="bottom">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>




