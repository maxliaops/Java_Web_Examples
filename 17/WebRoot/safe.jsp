<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%if (session.getAttribute("UserName")==null){
	out.println("<script language='javascript'>alert('Äú»¹Ã»ÓÐµÇÂ¼!');window.location.href='index.jsp';</script>");
}%>
