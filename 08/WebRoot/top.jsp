<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.struts.form.UserForm;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
  <head>
    <title>网页主窗口</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
<script src="JS/DateTime2.js"></script>
<script language="javascript">
function Check()
{
if(confirm("确定要重新登录本系统吗??"))
{
window.location="index.jsp";
}
}
</script>
<script language="javascript">
function Check1()
{
	window.close();
}
</script>
<% 
    if((UserForm) session.getAttribute("uform") == null){   //如果session过期，则提示用户重新登录系统
    %>
    <script language="javascript">                         
         alert("您登录的网页已经过期，请重新登录！");             
         window.location="index.jsp"
   </script>
    <%}else{                                               //如果session没有过期，将执行以下代码
    UserForm uf =(UserForm) session.getAttribute("uform");
    application.setAttribute("Purview",uf.getUserPurview());
    application.setAttribute("un",uf.getUserName());
    %>
</head>
<body>
<table width="1003" height="114" border="0" align="center" cellpadding="0" cellspacing="0" background="Images/top_bg.jpg">
  <tr>
    <td height="67">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" height="45" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="17" colspan="3">&nbsp;</td>
        <td colspan="2">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="30%" align="center"><a href="default.jsp"  style="color:#546A3E">&nbsp;&nbsp;&nbsp;首页</a></td>
              <td width="44%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="Check();return false;" style="color:#546A3E">重新登录</a></td>
              <td width="26%">&nbsp;&nbsp;<a href="#" onClick="Check1();return false;" style="color:#546A3E">退出</a></td>
            </tr>
          </table></td>
        </tr>
      <tr>
        <td width="21%">&nbsp;</td>
        <td width="55%" class="word_white">&nbsp;用户名： <%=uf.getUserName()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;权限：<%=uf.getUserPurview()%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所在部门：<%=uf.getUserbranch()%></td>
        <td colspan="2" class="word_white" id="Time">&nbsp;<script language="javascript">ShowDate(Time);</script></td>
        <td width="10%" class="word_white" id="Time2">&nbsp;<script language="javascript">ShowTime(Time2);</script></td>
      </tr>
    </table></td>
    </tr>
</table>
<%} %>
  </body>
</html>
