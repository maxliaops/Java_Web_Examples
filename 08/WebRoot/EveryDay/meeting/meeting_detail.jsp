<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.persistence.Meeting"/>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
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
	color: #000000;
}
.STYLE5 {
	font-size: 9pt;
	color: #FFFFFF;
}
-->
</style>
	<link href="../../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
  <table width="557" height="401" border="0" cellpadding="-2" cellspacing="-2" background="../../Images/noword.jpg">
  <tr>
    <td width="817" height="349" valign="top"><table width="100%" height="90"  border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <br>
        <td height="43" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE3">会议记录详细信息</span></td>
      </tr>
      <tr>
        <td height="47">&nbsp;</td>
      </tr>
    </table>      
      <form name="form1">
        <table width="93%" height="232"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
           <%
              String strid = request.getParameter("ID");              //获得参数
              List list =HibernateUtil.findMeetingid(Integer.parseInt(strid));    //调用条件查询方法
              for(int i=0;i<list.size();i++){
    	      Meeting meeting =(Meeting)list.get(i);
           %>
            <td width="12%" height="27"><div class="style1 STYLE3">时&nbsp;&nbsp;间：</div></td>
            <td width="34%"><input name="mtime" type="text" class="Sytle_text" id="mtime"
			 readonly value="<%=meeting.getMTime()%>"></td>
            <td width="13%" class="STYLE3">出席人：</td>
            <td width="41%"><input name="CPerson" type="text" class="Sytle_text" id="CPerson"
			 readonly value="<%=meeting.getZPerson()%>" size="30"></td>
          </tr>
          <tr>
            <td height="25"><span class="STYLE3">主持人：</span></td>
            <td><input name="ZPerson" type="text" class="Sytle_text" id="ZPerson" readonly
			 value="<%=meeting.getCPerson()%>"></td>
            <td class="STYLE3">会议地点：</td>
            <td><input name="address" type="text" class="Sytle_text" id="address" 
			readonly value="<%=meeting.getAddress()%>" size="30"></td>
          </tr>
          <tr>
            <td height="27"><div class="STYLE3">主&nbsp;&nbsp;题：
			</div></td>
            <td colspan="3"><input name="subject" type="text" class="Style_subject"
			 id="subject" readonly value="<%=meeting.getSubject()%>"></td>
          </tr>
          <tr>
            <td height="133" valign="top"><div class="STYLE3"><br>
              内&nbsp;&nbsp;容
			：</div></td>
            <td colspan="3"><textarea name="content" cols="53" rows="6" class="Style_content"
			 id="content"><%=meeting.getContent()%></textarea></td>
			 <%} %>
          </tr>
          <tr>
            <td colspan="4"><div align="center">
                <input name="myclose" type="button" class="btn_grey" id="myclose"
				 value="关闭窗口" onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>




