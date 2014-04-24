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
	<title>部门详细信息页面</title>
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
.STYLE3 {
	font-size: 9pt;
	color: #000000;
}
-->
</style>
	<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
	
<body>
 <%
    String strid = request.getParameter("ID");
    List listSid = HibernateUtil.findShenheId(Integer.parseInt(strid));
     if(!listSid.isEmpty() && listSid.size()>0){
    	 for(int i=0;i<listSid.size();i++){
    		Shenhe shenhe = (Shenhe)listSid.get(i); 
  %>
 <table width="458" height="459" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" background="../Images/waichudeng.gif"><table width="442" height="448" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="42" valign="bottom">&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE3">申请详细信息</span></td>
      </tr>
      <tr>
        <td height="406"><table width="427" height="298" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="20"><div align="center" class="STYLE3">申请主题</div></td>
            <td width="283"><div align="center" class="STYLE3">
              <div align="left">
                <input name="textfield" type="text" value="<%=shenhe.getTitle()%>" size="20">
                </div>
            </div></td>
          </tr>
          <tr>
            <td width="72" height="187" valign="middle" class="STYLE3">&nbsp;&nbsp;
              <div align="center">申请内容<br>
              </div></td>
            <td height="187" colspan="3" valign="middle" class="STYLE3"><textarea name="content" cols="48" rows="17" id="content"><%=shenhe.getContent()%></textarea></td>
          </tr>
          <tr>
            <td height="15"><div align="center" class="STYLE3">发表日期 </div></td>
            <td width="70" height="15"><div align="center" class="STYLE3">
              <div align="left">
                <input name="time1" type="text" id="time1" value="<%=shenhe.getTime1()%>" size="10">
             </div>
            </div></td>
            <td height="15" colspan="2">&nbsp;</td>
            </tr>
        </table>
        <br>
        <table width="131" height="39" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center"><input name="Submit" type="submit" class="btn_grey" onClick="javascrip:window.close()" value=" 关闭窗口 "></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<%}} %>
</body>




