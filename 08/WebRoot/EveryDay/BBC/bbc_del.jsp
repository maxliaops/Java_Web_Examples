<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.persistence.Placard"/>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>删除公告信息</title>
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
 .style2 {color: #669999}
 .STYLE4 {
	 font-size: 9pt;
	 color: #FFFFFF;
 }
 .STYLE7 {
	 font-size: 9pt;
	 color: #000000;
 }
 -->
</style>
<body>
 <table width="557" height="401" border="0" cellpadding="-2" cellspacing="-2" 
background="../../Images/noword.jpg">
  <tr>
    <td width="817" height="349" valign="top"><table width="100%" height="76"
	  border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <td height="41" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE7">删除公告信息</span></td>
      </tr>
      <tr>
        <td height="35">&nbsp;</td>
      </tr>
    </table>     
    <%
			   int link=Integer.parseInt(request.getParameter("link"));
    		   int currPage=Integer.parseInt(request.getParameter("currPage"));
               String strid= request.getParameter("IDs");
               List listPlacard = HibernateUtil.finplacardId(Integer.parseInt(strid));
               if(!listPlacard.isEmpty()&&listPlacard.size()>0){
            	   for(int i=0;i<listPlacard.size();i++){
            	   Placard placard =(Placard) listPlacard.get(i);
            	   session.setAttribute("PL",placard);
          %> 
      <form ACTION="bbc_del_ok.jsp?currPage=<%=currPage%>&link=<%=link%>" METHOD="POST" name="form1">
        <table width="80%" height="224"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td height="27" colspan="2" align="left" class="STYLE7"><span class="style1">&nbsp;<span class="STYLE7">发布人：</span></span>
			<span class="STYLE7"><%=placard.getPerson()%></span></td>
            <td width="19%"><div align="center" class="STYLE7">发布日期：</div></td>
            <td width="30%"><span class="STYLE7"><%=placard.getDDate()%></span></td>
          </tr>
          <tr>
            <td width="14%" height="29"><div align="center"><span class="STYLE7">主题：</span></div></td>
            <td colspan="3"><input name="subject" type="text" class="Style_subject" 
			id="subject2" value="<%=placard.getSubject()%>"></td>
          </tr>
          <tr>
            <td height="129" valign="top"><div align="center" class="STYLE7">内容：</div></td>
            <td colspan="3"><textarea name="content" cols="53" rows="6" class="Style_content"
			 id="content"><%=placard.getContent()%></textarea></td>
          </tr>
          <%}}%>
          <tr>
            <td colspan="4"><div align="center">
              <input name="but_del" type="submit" class="btn_grey" id="del"
				 value="确定删除">
              <input name="myclose" type="button" class="btn_grey" id="myclose"
				 value="关闭" onClick="javascrip:window.close()">
			</div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>




