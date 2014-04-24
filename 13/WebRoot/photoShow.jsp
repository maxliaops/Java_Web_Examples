<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.form.Photo"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>宇晨相册—相片的详细查询</title>
</head>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/js.js" type="text/javascript"></script>

<%
Photo photo=(Photo)request.getAttribute("photo");
%>
<body>
 <jsp:include page="top.jsp" flush="true" />
 <table width="753" height="37" align="center" cellpadding="0" cellspacing="0" background="images/13.jpg">
   <tr>
     <td width="777" height="30"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#EDE6BC" size="-1"><b>当前用户：${sessionScope.userInfo.username}</b></font></td>
     <td width="117"><br><a href="#" onClick="javascript:history.go(-1);" class="a1">返回</a></td>
   </tr>
</table>

  <table width="753" height="60" border="0" align="center" cellpadding="0" cellspacing="0" background="images/14.jpg">
    <tr>
      <td><table width="476" border="0" align="center">
        <tr>
          <td height="51" valign="bottom" align="center"><a href="#" class="a3" onclick="images11.src='${requestScope.photo.photoAddress}'">查看源相片</a>&nbsp;&nbsp;&nbsp; <c:if test="${requestScope.photo.printAddress!=0}"><a href="#" onclick="images11.src='${requestScope.photo.printAddress}'" class="a3">查看水印相片</a></c:if> </td>
        </tr>
      </table></td>
    </tr>
  </table>
  <table width="753" height="499" border="0" align="center" cellpadding="0" cellspacing="0" background="images/15.jpg">
    <tr>
      <td width="60" height="499" valign="top">&nbsp;</td>
      <td width="438" valign="top"><table width="210" height="64" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="64">&nbsp;</td>
        </tr>
      </table>
        <table width="403" height="315" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="379" height="315"><img src="<%=photo.getPhotoAddress()%>" height="315" width="403" id="images11"></td>
        </tr>
      </table></td>
      <td width="255" valign="top"><table width="233" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <th width="73" height="64">&nbsp;</th>
          <td width="160" valign="bottom" align="left"><b>相片信息</b></td>
        </tr>
      </table>   
	  <br>
	  
	     <table width="205" border="0">
        <tr>
          <td width="75" height="24" align="right">相片名称：</td>
          <td width="120"><%=photo.getPhotoName()%></td>
        </tr>
        <tr>
          <td height="24" align="right">相册名称：</td>
          <td><%=photo.getPhotoType()%></td>
        </tr>
        <tr>
          <td height="24" align="right">相片大小：</td>
          <td><%      
          float size = Integer.valueOf(photo.getPhotoSize()) /1024;
          out.print(size);          
          %>KB</td>
        </tr>
        <tr>
          <td height="24" align="right">上传时间：</td>
          <td><%=photo.getPhotoTime()%></td>
        </tr>
        <tr>
          <td height="24" align="right">上传用户：</td>
          <td><%=photo.getUsername()%></td>
        </tr>        
      </table>
	  
	    <%if(null!=session.getAttribute("userInfo")){ %>
	  
	  <br> <br>
		
           <c:if test="${requestScope.photo.username==sessionScope.userInfo.username}">
		  
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=userDeletePhoto&id=${requestScope.photo.id}" class="a4">删除此相片</a>
		
	
	  <br>
		
    <br> <br><br> <br><br> 
	  <form name="form" method="post" action="photoServlet?info=userprintPhoto&id=${requestScope.photo.id}" onSubmit="return checkPhotoPrint(form)">
        <table width="157" border="0" align="center">
          <tr>
            <td height="30">&nbsp;&nbsp;&nbsp;<b>&nbsp;添加水印文字</b></td>
          </tr>
          <tr>
            <td height="25"><input type="text" name="information" class="input2"></td>
          </tr>
          <tr>
            <td height="39">&nbsp;&nbsp;&nbsp;<a href="javascript:form.submit();" class="a4">生成水印图片</a></td>
          </tr>
        </table>
		</form>
		<br><center>
		${requestScope.information}
		</center>
		   </c:if>		
		<%} %>
		
	  </td>
    </tr>
</table>
  <jsp:include page="down.jsp" flush="true"/>
</body>
</html>
