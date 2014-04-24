<%@ page contentType="text/html;charset=gb2312" language="java"%>
<% request.setCharacterEncoding("gb2312");%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="spinfo" scope="page" class="com.mingri.info.SpinfoBean">
<jsp:setProperty name="spinfo" property="*"/>
</jsp:useBean>
<jsp:useBean  id="regist" scope="page" class="com.mingri.info.SpRegist"/>
<%
   regist.setSpinfo(spinfo);
   regist.regist();
   out.println("<script language='javascript'>alert('µÇ¼Ç³É¹¦');"+
               "window.location.href='spinfo1.jsp';</script>");
%>
