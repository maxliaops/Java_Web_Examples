<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*,com.hiernate.util.*"%>
<jsp:directive.page import="com.hiernate.persistence.Placard;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>公告详细信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
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
.STYLE6 {color: #000000; font-size: 9pt; }
-->
</style>
	<link href="../../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
       <%
               String strid= request.getParameter("id");    //获得参数
               List listPlacard = HibernateUtil.finplacardId(Integer.parseInt(strid)); //调用条件查询方法
               if(!listPlacard.isEmpty()&&listPlacard.size()>0){
            	   for(int i=0;i<listPlacard.size();i++){   //循环遍例公告信息
            	   Placard placard =(Placard) listPlacard.get(i);	   
          %>
  <table width="557" height="401" border="0" cellpadding="-2" cellspacing="-2"
 background="../../Images/noword.jpg">
  <tr>
    <td width="817" height="349" valign="top"><table width="100%" height="96"
	 border="0" cellpadding="-2" cellspacing="-2">
      <tr><br>
        <td height="41" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE6">公告详细信息</span></td>
      </tr>
      <tr>
        <td height="55">&nbsp;</td>
      </tr>
    </table>      
      <form name="form1">
        <table width="80%" height="224"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td height="27" colspan="2" align="left"><span class="STYLE6">&nbsp;发布人：</span>
			<span class="STYLE6"><%=placard.getPerson()%></span></td>
            <td width="19%"><div align="center" class="STYLE6">发布日期：</div></td>
            <td width="30%"><span class="STYLE6"><%=placard.getDDate()%></span></td>
          </tr>
          <tr>
            <td width="14%" height="29"><div align="center"><span class="STYLE6">主题：</span></div></td>
            <td colspan="3">
			<input name="subject" type="text" class="Style_subject" id="subject2" 
			value="<%=placard.getSubject()%>"></td>
          </tr>
          <tr>
            <td height="129" valign="top"><div align="center" class="STYLE6">内容：</div></td>
            <td colspan="3" align="left">
			<textarea name="content" cols="53" rows="6" class="Style_content"
			 id="content"><%=placard.getContent()%></textarea></td>
          </tr>
          
          <tr>
            <td colspan="4"><div align="center">
             <input name="myclose" type="button" class="btn_grey" id="myclose"
				 value="关闭" onClick="javascrip:window.close()">
     </div></td>
          </tr>
        </table>
      
      </form></td>
  </tr>
</table>
<%}} %>
</body>




