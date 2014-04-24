<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<%
if(session.getAttribute("poll")==null){
	if (!request.getParameter("optionname").equals("")){
		String opt=chStr.chStr(request.getParameter("optionname"));
		int temp=connDB.executeUpdate("update tb_poll set poll=poll+1 where optionName='"+opt+"'");
		if (temp==0){
			out.println("<script language='javascript'>alert('投票失败!');window.location.href='index.jsp';</script>");
		}else{
			out.println("<script language='javascript'>alert('投票成功!');window.location.href='poll_result.jsp';</script>");
			session.setAttribute("poll","ok");
		}
	}
}else{
	out.println("<script language='javascript'>alert('您已经投过票了!');window.location.href='poll_result.jsp';</script>");
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
