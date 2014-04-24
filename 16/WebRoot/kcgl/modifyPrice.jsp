<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<%
   request.setCharacterEncoding("gb2312");
   String hid=request.getParameter("hid");
   String hkcje=request.getParameter("hkcje");
   String hdj=request.getParameter("hdj");
   String strSql="update tb_kucun set kcje="+hkcje+
                 ", dj="+hdj+"where id='"+hid+"'";
   rst.doExecute(strSql);
   out.println("<script language='javascript'>alert('商品价格修改成功');"+
                "window.location.href='modifyPrice1.jsp';</script>");
%>
