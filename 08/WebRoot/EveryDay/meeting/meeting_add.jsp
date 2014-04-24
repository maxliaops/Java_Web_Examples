<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <script language="javascript">
function Mycheck()
{
if (form1.mtime.value=="")
{ alert("请输入会议时间！");form1.mtime.focus();return;}
  if(form1.mtime.value.length!=16)
    {alert("您输入的日期不对！请输入标准日期（如：2004/07/27 07:30或2004-07-27 07:30）");form1.mtime.focus();return;}
  if(form1.mtime.value.indexOf('/',0)==-1&form1.mtime.value.indexOf('-',0)==-1)
    {alert("您输入的日期不对！请输入标准日期（如：2004/07/27 07:30或2004-07-27 07:30）");form1.mtime.focus();return;}
	  if(form1.mtime.value.substr(4,1)!="-"&form1.mtime.value.substr(4,1)!="/")
    {alert("您输入的日期不对！请输入标准日期（如：2004/07/27 07:30或2004-07-27 07:30）");form1.mtime.focus();return;}
  if(form1.mtime.value.substr(7,1)!="-"&form1.mtime.value.substr(7,1)!="/")
    {alert("您输入的日期不对！请输入标准日期（如：2004/07/27 07:30或2004-07-27 07:30）");form1.mtime.focus();return;}
  if(form1.mtime.value.substr(10,1)!=" ")
    {alert("您输入的日期不对！请输入标准日期（如：2004/07/27 07:30或2004-07-27 07:30）");form1.mtime.focus();return;}
  if(form1.mtime.value.substr(13,1)!=":")
    {alert("您输入的日期不对！请输入标准日期（如：2004/07/27 07:30或2004-07-27 07:30）");form1.mtime.focus();return;}
  if(form1.mtime.value.substr(5,2)>"12")
    {alert("您输入的日期不对！");form1.mtime.focus();return;}
  if(form1.mtime.value.substr(8,2)>"31")
    {alert("您输入的日期不对！");form1.mtime.focus();return;}
  if(form1.mtime.value.substr(11,2)>"23"||form1.mtime.value.substr(11,2)<"0")
    {alert("您输入的日期不对！");form1.mtime.focus();return;}	
  if(form1.mtime.value.substr(14,2)>"59"||form1.mtime.value.substr(11,2)<"0")
    {alert("您输入的日期不对！");form1.mtime.focus();return;}		
 if (form1.ZPerson.value=="")
 { alert("请输入会议主持人！");form1.ZPerson.focus();return;}
 if (form1.CPerson.value=="")
 { alert("请输入会议出席人！");form1.CPerson.focus();return;}
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
.STYLE3 {
	font-size: 9pt;
	color: #FF0000;
}
.STYLE5 {
	font-size: 9pt;
	color: #FFFFFF;
}
.STYLE6 {font-size: 9pt; color: #000000; }
-->
</style>
  <link href="../../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
  <table width="557" height="401" border="0" cellpadding="-2" cellspacing="-2" background="../../Images/noword.jpg">
  <tr>
    <td width="817" height="100" valign="top"><table width="100%" height="30"  border="0" cellpadding="-2" cellspacing="-2">
      <tr><br>
        <td height="43" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE6">&nbsp;录入会议记录</span></td>
      </tr>
	  <tr>
      </tr>
    </table>      
      <form ACTION="meeting_addCenter.jsp" METHOD="POST" name="form1">
        <table width="93%" height="232"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td width="11%" height="27"><div align="center" class="STYLE6">时&nbsp;&nbsp;间：</div></td>
            <td width="34%"><input name="mtime" type="text" class="Sytle_text" id="mtime"></td>
            <td width="14%" class="STYLE6">出席人：</td>
            <td width="41%"><input name="ZPerson" type="text" class="Sytle_text" id="ZPerson" size="30"></td>
          </tr>
          <tr>
            <td height="25"><span class="STYLE6">主持人：</span></td>
            <td><input name="CPerson" type="text" class="Sytle_text" id="CPerson"></td>
            <td class="STYLE6">会议地点：</td>
            <td><input name="address" type="text" class="Sytle_text" id="address" size="30"></td>
          </tr>
          <tr>
            <td height="27"><div align="center"><span class="STYLE6">主&nbsp;&nbsp;题：</span></div></td>
            <td colspan="3"><input name="subject" type="text" class="Style_subject" id="subject"></td>
          </tr>
          <tr>
            <td height="133" valign="top"><div align="center" class="STYLE6">内&nbsp;&nbsp;容：</div></td>
            <td colspan="3"><textarea name="content" cols="53" rows="6" class="Style_content" id="content"></textarea></td>
          </tr>
          <tr>
            <td colspan="4"><div align="center">
                <input name="Button" type="button" class="btn_grey" value="提交" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="btn_grey" value="重置">                
                <input name="myclose" type="button" class="btn_grey" id="myclose" value="关闭"
				 onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>




