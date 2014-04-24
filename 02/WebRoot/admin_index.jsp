<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>物流配货网</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
</head>

<body>
<table width="100%" height="20" border="0" cellpadding="0" cellspacing="0" bgcolor="1281AF" >
  <tr>
    <td width="1%"><img src="images/logistics_01.jpg" width="57" height="20"></td>
    <td width="637">&nbsp;</td>
    <td width="50%">&nbsp;</td>
  </tr>
</table>







  <table border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="57"><img src="images/logistics_04.jpg" width="57" height="183"></td>
      <td width="29"><img src="images/logistics_13.jpg" width="637" height="183"></td>
      <td width="14"><img src="images/logistics_06.jpg" width="309" height="183"></td>
    </tr>
</table>








  <table width="1003" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="58" height="467">&nbsp;</td>
      <td width="367">	 
      
      
       <s:form action="admin_index" method="post">
  <table width="208" align="right" >
          <tr>
            <td height="35" colspan="2">用户名：<s:textfield name="admin_user"/></td>
          </tr>
          <tr>
            <td height="35" colspan="2">密&nbsp;&nbsp;码：<s:password name="admin_password"/></td>
          </tr>
		    <tr>
            <td height="35" colspan="2" align="center"> 		 
		 <s:submit value="" cssStyle="background-image:url(images/land.gif);border:0;width:44;height:35"/>
          &nbsp;&nbsp;&nbsp;
         <s:reset value="" cssStyle="background-image:url(images/reset.gif);border:0;width:44;height:35"/>
		  </td>
          </tr>		
		  
		       <tr>
            <td width="43" height="35" >&nbsp;</td>
            <td width="153">
			<s:fielderror><s:param value="%{'admin_user'}"/></s:fielderror><s:fielderror><s:param value="%{'admin_password'}"/></s:fielderror><s:actionerror/>			
			</td>
	      </tr>
		  
		  
		  
      </table>    
  
	 
	
	

	    </s:form>


  
  
  
  
  
  
  
  <%
if(null!=session.getAttribute("admin_user")){
	out.print("<script language=javascript>window.location.href='mainPage.jsp';</script>");	
}
%>  
	  </td>
      <td width="578"><img src="images/logistics_14.jpg" width="578" height="467"></td>
    </tr>
  </table>
  <jsp:include page="main_down.jsp"/>
</body>
</html>
