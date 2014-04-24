<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.lang.*"%>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
if(request.getParameter("ISBN")!=""){
	String ISBN=chStr.chStr(request.getParameter("ISBN"));
	String sql="delete from tb_bookinfo where ISBN='"+ISBN+"'";
	int ret=0;
	ret=connDB.executeUpdate(sql);
	if (ret!=0){
		out.println("<script language='javascript'>alert('图书信息删除成功！');window.location.href='index.jsp';</script>");
		}else{
		out.println("<script language='javascript'>alert('图书信息删除失败！');window.location.href='index.jsp';</script>");
	}
}
%>
