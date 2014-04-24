<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="currentTime" class="com.tools.CurrentTime" scope="page"/>
<table width="100%" height="20" border="0" cellpadding="0" cellspacing="0" bgcolor="1281AF" >
  <tr>
    <td width="57"><img src="images/logistics_01.jpg" width="57" height="20"></td>
    <td width="645"> <table width="249" align="right">
      <tr>
        <td width="241" align="center" class="word_white"><a href="admin_updatePassword.jsp" class="a1">修改密码</a> | <a href="mainPage.jsp" class="a1">返回首页</a> | <a href="admin_loginout.jsp" class="a1">退出系统</a></td>
      </tr>
    </table></td>
    <td width="543">&nbsp;</td>
  </tr>
</table>
<table height="22" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="57"><img src="images/logistics_04.jpg" width="57" height="183"></td>
    <td width="637" height="183" valign="top" background="images/logistics_05.jpg"><table width="607" height="168" align="center">
      <tr>
        <td width="409" height="161" valign="bottom"><font color="#FFFFFF"><%=currentTime.currentlyTime()%></font></td>
        <td width="93" valign="bottom"><a href="customer_queryCustomerList.action" class="a1">固定客户管理</a></td>
        <td width="89" valign="bottom"><a href="car_queryCarList.action" class="a1">车源信息管理</a></td>
      </tr>
    </table></td>
    <td width="60"><img src="images/logistics_06.jpg" width="309" height="183"></td>
  </tr>
</table>

<%
	if (null == session.getAttribute("admin_user")) {

		out.print("<script language=javascript>alert('您已经与服务器断开');window.location.href='admin_index.jsp';</script>");

	}
%>







