<%@ page contentType="text/html; charset=gb2312" language="java" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>
</body>
</html>
