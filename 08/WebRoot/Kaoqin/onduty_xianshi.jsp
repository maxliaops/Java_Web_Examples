<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	
	<title>上下班详细信息页面</title>
	<link href="../CSS/style.css" rel="stylesheet" type="text/css">
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
  
</head>
<body>
<%
               String strid= request.getParameter("ID");                       //获得请求参数
               List listonduty = HibernateUtil.findonduty(Integer.parseInt(strid)); 	 //调用条件查询方法						
               if(!listonduty.isEmpty() && listonduty.size()>0){
            	   for(int i=0;i<listonduty.size();i++){
            	   Onduty onduty = (Onduty)listonduty.get(i);	   
          %>
  <table width="458" height="348" border="0" cellpadding="0" cellspacing="0" background="../Images/noword.jpg">
  <tr>
    <td height="348" valign="top"><table width="442" height="339" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr><br>
        <td height="21" valign="bottom">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><span class="STYLE3">上下班登记详细信息</span></td>
      </tr>
      <tr>
        <td height="318"><table width="427" height="175" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="72" height="20"><div align="center" class="STYLE3">姓名</div></td>
            <td width="92"><input name="textfield" type="text" value="<%=onduty.getName1()%>" size="13">
              <div align="center" class="STYLE3"></div></td>
            <td width="87"><div align="center" class="STYLE3">所属部门</div></td>
            <td width="176"><div align="center" class="STYLE3">
              <div align="left">
                &nbsp;&nbsp;<input name="textfield" type="text" value="<%=onduty.getDepartment()%>" size="13">
                </div>
            </div></td>
          </tr>
          <tr>
            <td height="38" valign="middle" class="STYLE3"><div align="center">登记类型</div></td>
            <td height="38" valign="middle" class="STYLE3">
            &nbsp;&nbsp;<input name="textfield" type="text" value="<%=onduty.getEnroltype()%>" size="13">
           </td>
            <td height="38" valign="top" class="STYLE3">&nbsp;</td>
            <td height="38" valign="top" class="STYLE3">&nbsp;</td>
          </tr>
          <tr>
            <td height="90" colspan="4" valign="top" class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登记备注<strong>:</strong><br />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=onduty.getEnrolremark()%></td>
          </tr>
        </table>
        <%}} %>
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
</body>




