<%@ page contentType="text/html; charset=gb2312"%>
<%
String manager=(String)session.getAttribute("manager");
//验证用户是否登录
if (manager==null || "".equals(manager)){
	response.sendRedirect("login.jsp");
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="118" valign="bottom" background="Images/top_bg.gif" bgcolor="#EEEEEE"><table width="73%" height="79"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="69" align="right" valign="bottom">当前登录用户：<%=manager%></td>
        </tr>
    </table></td>
  </tr>
</table>
