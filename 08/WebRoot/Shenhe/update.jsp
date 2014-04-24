<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<%@page import="com.hiernate.persistence.*"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<head>
	<html:base />
	<title>修改</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
	
<body>
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
.STYLE3 {	font-size: 9pt;
	color: #000000;
}
-->
</style>
<script language="javascript">
function Mycheck()
{
if(form1.title.value=="")
{alert("请输入申请标题!");form1.title.focus();return;}
if(form1.content.value=="")
{alert("请输入申请内容!");form1.content.focus();return;}
form1.submit();
}
</script>
<body>
<form name="form1" method="post" action="updateShen.jsp">
<%
    String strID = (String)session.getAttribute("stid");
    List listSid = (List)HibernateUtil.findShenheId(Integer.parseInt(strID));
     if(!listSid.isEmpty() && listSid.size()>0){
    	 for(int i=0;i<listSid.size();i++){
    		Shenhe shehe = (Shenhe)listSid.get(i); 
    		session.setAttribute("Shenhe",shehe);
 %>

<table width="520" height="465" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="495" height="465" valign="top" background="Images/tongxun_add.gif"><table width="500" height="458" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="27" valign="bottom">&nbsp;&nbsp;<span class="STYLE3">&nbsp;&nbsp;修改申请</span></td>
      </tr>
      <tr>
        <td height="431" valign="middle"><table width="427" height="298" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="20"><div align="center" class="STYLE3">申请主题</div></td>
            <td width="283"><div align="center" class="STYLE3">
                <div align="left">
                  <input name="title" type="text" id="title" value="<%=shehe.getTitle()%>" size="20" />
                </div>
            </div></td>
          </tr>
          <tr>
            <td width="72" height="187" valign="middle" class="STYLE3">&nbsp;&nbsp;
                <div align="center">申请内容<br />
              </div></td>
            <td height="187" colspan="3" valign="middle" class="STYLE3"><textarea name="content" cols="40" rows="17" id="content"><%=shehe.getContent()%></textarea></td>
          </tr>
          <tr>
            <td height="15">&nbsp;</td>
            <td width="70" height="15">&nbsp;</td>
            <td height="15" colspan="2">&nbsp;</td>
          </tr>
        </table>
          <table width="283" height="28" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>&nbsp;&nbsp;&nbsp;
              <td width="283"><input name="Submit" type="button" class="btn_grey"onclick="Mycheck();" value="发表">
              <input name="Submit2" type="button" class="btn_grey" onClick="JScript:window.close();" value="关闭">
              <input name="Submit3" type="button" class="btn_grey" onClick="JScript:form1.reset();" value="重填">
              </td>
            </tr>
          </table><p>&nbsp;</p></td>
      </tr>
    </table></td>
  </tr>
</table>
<%}} %>
</form>
</body>




