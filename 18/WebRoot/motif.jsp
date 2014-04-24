<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>
motif
</title>
</head>
<jsp:useBean id="motifBeanId" scope="session" class="electric.dbs.MotifBean" />
<jsp:setProperty name="motifBeanId" property="*" />
<body bgcolor="#ffffff">
<h1>
JBuilder Generated JSP
</h1>
<form method="post">
<br>Enter new value   :  <input name="sample"><br>
<br><br>
<input type="submit" name="Submit" value="Submit">
<input type="reset" value="Reset">
<br>
Value of Bean property is :<jsp:getProperty name="motifBeanId" property="sample" />
</form>
</body>
</html>
