<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%
//验证用户是否登录
if (session.getAttribute("manager")==null || "".equals(session.getAttribute("manager"))){
	response.sendRedirect("login.jsp");
	return;
}
%>
<table width="778" height="99" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="../Images/m_top.jpg">&nbsp;</td>
  </tr>
</table>