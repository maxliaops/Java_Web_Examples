<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="beans.bookelement"%>
<%
Vector cart=(Vector)session.getAttribute("cart");
try{
	String ID=request.getParameter("ID");
	int id=Integer.parseInt(ID);
	cart.removeElementAt(id);
	session.setAttribute("cart",cart);
	response.sendRedirect("cart_see.jsp");
	}catch(Exception e){
}
%>
