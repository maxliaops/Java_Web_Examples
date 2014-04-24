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
	<title>删除会议记录信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="../../CSS/style.css">
 <style type="text/css">
<!--
 body {
	margin-left: 0px;
	margin-top: 0px;
 }
.style1 {color: #C60001}
.style3 {
	color: #C60001;
	font-size: 12pt;
	font-weight: bold;
}
 .STYLE5 {
	font-size: 9pt;
	color: #FFFFFF;
 }
 .style7 {font-size: 9pt; color: #000000; }
 -->
</style>
	</head>
<body>
  <%

    int link=Integer.parseInt(request.getParameter("link"));
    int currPage=Integer.parseInt(request.getParameter("currPage"));
    String strid = request.getParameter("ID");           //获得参数
    List listid = HibernateUtil.findMeetingid(Integer.parseInt(strid));  //调用条件查询方法
    if(!listid.isEmpty()&&listid.size()>0){
    	for(int i=0;i<listid.size();i++){               
    		Meeting meeting = (Meeting)listid.get(i);
    		HibernateUtil.deleMeeting(meeting);         //调用删除方法 
    	}
    }
  %>
  <table width="557" height="401" border="0" cellpadding="-2" cellspacing="-2" background="../../Images/noword.jpg">
  <tr>
    <td width="817" height="349" valign="top"><table width="100%" height="101"  border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <td height="43">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="style7">删除会议记录信息</span></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>      
      <form name="form1" method="post" action="">
        <table width="80%" height="169"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td height="105"><div align="center" class="style1"></div>              
            <div align="center"><span class="style3">会议记录信息删除成功！</span></div></td>
          </tr>
          <tr>
            <td height="25" valign="top"><div align="center" class="style1"></div></td>
          </tr>
          <tr>
            <td><div align="center">
            
            
            <%
              if(link==1){
   				 if(currPage!=1){
  				  currPage=currPage-1;
   			 }%>
   			    <input name="myclose" type="button" class="btn_grey" id="myclose"
				 value="关闭" onClick="javascrip:opener.location.href='meeting_index.jsp?currPage=<%=currPage%>';window.close()">
   				<%}else{%>
   				<input name="myclose2" type="button" class="btn_grey" id="myclose2"
				 value="关闭" onClick="javascrip:opener.location.reload();window.close()">
   				<%} %>
		</div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>




