<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.core.*" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) {
    out.println("<script>parent.location.href='../index.jsp';</script>");
    return ;
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body style="background-image:url(../images/blank_bg.gif);background-position:center; background-repeat:no-repeat">
</body>
</html>
