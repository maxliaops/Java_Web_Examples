<%@ page contentType="text/html; charset=gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String mainPage=(String)request.getAttribute("mainPage");
	if(mainPage==null||mainPage.equals(""))
		mainPage="default.jsp";
%>
<html>
	<head>
		<title>ΆΰΓ½Με²©ΏΝ</title>
		<base href="<%=basePath%>">
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	<body>
    	<%--<center>
	        <table border="0" cellpadding="0" cellspacing="0" background="images/allBack.jpg">
    	        <tr height="150"><td colspan="2"><%@ include file="top.jsp" %></td></tr>
        	    <tr>
            	    <td width="30%" valign="top" align="right"><jsp:include page="left.jsp"/></td>
                	<td align="left" valign="top"><jsp:include page="<%=mainPage%>"/></td>
	            </tr>
    	        <tr height="100"><td colspan="2"><%@ include file="end.jsp" %></td></tr>
        	</table>        
	    </center>
	    --%><center>
	        <table width="1000" cellpadding="0" cellspacing="0" background="images/allBack.jpg" 
	        rules="rows" border="1" rules="none" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900">
    	        <tr><td colspan="2"><%@ include file="top.jsp" %></td></tr>
        	    <tr>
            	    <td width="280" valign="top" align="right"><jsp:include page="left.jsp"/></td>
                	<td width="720" align="left" valign="top"><jsp:include page="<%=mainPage%>"/></td>
	            </tr>
    	        <tr height="100"><td colspan="2"><%@ include file="end.jsp" %></td></tr>
        	</table>        
	    </center>
	</body>
</html>