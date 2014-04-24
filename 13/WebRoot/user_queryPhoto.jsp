<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.Photo"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>宇晨相册——查询个人相册</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/js.js" type="text/javascript"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<%
if(null==session.getAttribute("userInfo")){
response.sendRedirect("index.jsp");
}

%>

<body>
   <jsp:include page="top.jsp" flush="true" />
   <table width="753" height="40" border="0" align="center" cellpadding="0" cellspacing="0" background="images/16.jpg">
     <tr>
       <td width="561" height="28">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#EDE6BC" size="-1"><b>当前用户：${sessionScope.userInfo.username}</b></font></td>
       <td width="192"><a href="user_upLoadPhoto.jsp" class="a1">请您上传自己的相片</a>
	   </td>
     </tr>
</table>
   <table width="753" height="54" border="0" align="center" cellpadding="0" cellspacing="0" background="images/17.jpg">
     <tr>
       <td height="51"><table width="287" height="33" border="0" align="center" cellpadding="0" cellspacing="0">
         <tr>
           <th width="287" height="33" align="center" valign="bottom">查询个人相册</th>
         </tr>
       </table></td>
     </tr>
   </table>
   <table width="753" height="504" border="0" align="center" cellpadding="0" cellspacing="0" background="images/18.jpg">
     <tr>
       <td height="347" align="center">       
	   <c:if test="${empty type}">
	      <c:out value="您还没有上传自己的相片"/>	      
	   </c:if>
	  
	  
	   <c:if test="${!empty type}">
	          <table width="139" border="0" cellpadding="0" cellspacing="0">
	  <%
	  String[] typePhoto=(String[])request.getAttribute("type");
	  int  lineCount=5;
	  int  typeLength=typePhoto.length;
	  int  rowCount=typeLength/lineCount;
	  if(typeLength%lineCount!=0){
		  rowCount++;
	  }
	  List list=(List)request.getAttribute("list");
	  %>
       <tr>     
      <%
       for(int i=0;i<typeLength;i++){ 
      %>           
      <td width="149" height="153" align="center">
		
		
		<table width="128" height="142" border="0">
  <tr>
    <td width="118" height="111" align="center">
    <%
        for(int j=0;j<list.size();j++){
        	Photo photo=(Photo)list.get(j);
        	if(photo.getPhotoType().equals(typePhoto[i])){
    %>
       <a href="photoServlet?info=queryPhotoList&type=<%=photo.getPhotoType()%>">
	   
<img src="<%=photo.getSmallPhoto()%>">
	   
	   
	   
	   </a>
    <%
       break;
        	} }%>
    </td>
  </tr>
  <tr>
    <td width="122" height="28" align="center" background="images/11.gif"><b><%=typePhoto[i]%><b></td>
  </tr>
</table>		
	      </td>
           <%
            if(i%lineCount==lineCount-1){
             	  
             out.print("</tr><tr>");             	  
           }
        }  
      
        if(rowCount*lineCount-typeLength>0){
        	int overCount=rowCount*lineCount-typeLength;
        	  for(int j=0;j<overCount;j++){
              out.print("<td align=center width=155>&nbsp;</td>");
        	  }
        }
        %>
       </tr>
      </table> 	
				
				
				
				
				      
	   </c:if>
	  
	  
	  
	  
	  
	  
	  
       </td>
     </tr>
</table>
<jsp:include page="down.jsp" flush="true"></jsp:include>
</body>
</html>
