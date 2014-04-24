<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%if (session.getAttribute("username")==null){
	out.println("<script language='javascript'>alert('Äú»¹Ã»ÓÐµÇÂ¼!');window.location.href='index.jsp';</script>");
}%>
