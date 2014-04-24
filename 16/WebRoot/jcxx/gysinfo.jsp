<%@ page contentType="text/html;charset=gb2312" language="java"%>
<% request.setCharacterEncoding("gb2312"); %>
<jsp:useBean id="gysinfo" scope="page" class="com.mingri.info.GysinfoBean">
<jsp:setProperty name="gysinfo" property="*"/>
</jsp:useBean>
<jsp:useBean id="regist" scope="page" class="com.mingri.info.GysRegist"/>
<%
   regist.setGysinfo(gysinfo);
   regist.regist();
   out.println("<script language='javascript'>alert('µÇ¼Ç³É¹¦');"+
               "window.location.href='gysinfo.html';</script>");
%>
