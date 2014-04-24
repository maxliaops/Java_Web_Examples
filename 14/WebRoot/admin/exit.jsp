<%@ page contentType="text/html; charset=GBK" %><%session.removeAttribute("user");session.invalidate();response.sendRedirect("../index.jsp");%>
