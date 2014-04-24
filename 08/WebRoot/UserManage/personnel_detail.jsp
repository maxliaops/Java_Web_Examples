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
	<title>员工详细信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
 
	</head>
<body>
<style type="text/css">
  <!--
 body {
	margin-left: 0px;
	margin-top: 0px;
 }
.style1 {color: #C60001}
.STYLE4 {
	font-size: 9pt;
	color: #FFFFFF;
}
 .style9 {
	font-size: 9pt;
	color: #000000;
  }
 -->
</style>
<body>
<table width="557" height="317" border="0" cellpadding="-2" cellspacing="-2" background="../Images/noword.jpg">
  <tr>
    <td width="817" height="307" valign="top"><table width="100%" height="74"  border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <td height="23" valign="bottom">&nbsp;&nbsp;&nbsp;<span class="style9">&nbsp;&nbsp;&nbsp;&nbsp;<br></span>&nbsp;&nbsp;&nbsp;<span class="STYLE9">员工详细信息</span></td>
      </tr>
      <tr>
        <td height="51">&nbsp;</td>
      </tr>
    </table>      
      <form name="form1">
      <%
        String strid = request.getParameter("ID");
        List listUser = HibernateUtil.findUserId(Integer.parseInt(strid));
         if(!listUser.isEmpty()&&listUser.size()>0){
          for(int i=0;i<listUser.size();i++){
        	  User user = (User)listUser.get(i);
         %>
        <table width="83%" height="214"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td width="14%" height="27"><div align="center" class="style1">用户名：</div></td>
            <td width="32%"><input name="username" type="text" class="Sytle_text" id="username" value="<%=user.getUserName()%>"></td>
            <td width="10%" class="style1"><div align="center">姓名：</div></td>
            <td width="44%">
            <input name="name" type="text" class="Sytle_text" id="name" value="<%=user.getName()%>">            </td>
          </tr>
          <tr>
            <td height="27" valign="top"><div align="center" class="style1">部门：</div></td>
            <td><input name="branch" type="text" class="Sytle_text" id="branch" value="<%=user.getBranch()%>"></td>
            <td class="style1"><div align="center">权限：</div></td>
            <td>&nbsp;<%=user.getPurview()%>　　<span class="style1">性别：</span><%=user.getSex()%></td>
          </tr>
          <tr>
            <td height="27" valign="top"><div align="center" class="style1">电话：</div></td>
            <td><input name="tel" type="text" class="Sytle_text" id="tel" value="<%=user.getTel()%>"></td>
            <td class="style1"><div align="center">职务：</div></td>
            <td><input name="job" type="text" class="Sytle_text" id="job" value="<%=user.getJob()%>"></td>
          </tr>
          <tr>
            <td height="27" valign="top" class="style1"><div align="center">Email：</div></td>
            <td colspan="3"><input name="email" type="text" class="Style_subject" id="email" value="<%=user.getEmail()%>"></td>
          </tr>
          <tr>
            <td height="27" valign="top" class="style1"><div align="center">地址：</div></td>
            <td colspan="3"><input name="address" type="text" class="Style_subject" id="address" value="<%=user.getAddress()%>"></td>
          </tr>
          
          <tr>
            <td colspan="4"><div align="center">
                <br>
                <input name="myclose" type="button" class="btn_grey" id="myclose" value="关闭窗口" onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
        <%}} %>
    </form></td>
  </tr>
</table>
</body>




