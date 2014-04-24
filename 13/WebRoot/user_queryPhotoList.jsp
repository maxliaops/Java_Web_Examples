<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.Photo"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>宇晨相册——查询个人相册中的相片查询</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/js.js" type="text/javascript"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>


	     <%
	  List list=(List)request.getAttribute("list");
	  Photo photo=(Photo)list.get(0);
	%>

<body>
   <jsp:include page="top.jsp" flush="true" />
   <table width="753" height="40" border="0" align="center" cellpadding="0" cellspacing="0" background="images/16.jpg">
     <tr>
       <td width="561" height="28">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#EDE6BC" size="-1"><b>当前用户：${sessionScope.userInfo.username}</b></font></td>
       <td width="192">
	   <%if(null!=session.getAttribute("userInfo")){ %>      
	   <a href="user_upLoadPhoto.jsp" class="a1">请您上传自己的相片</a>
	    <%} %>
	   </td>
     </tr>
</table>
   <table width="753" height="54" border="0" align="center" cellpadding="0" cellspacing="0" background="images/17.jpg">
     <tr>
       <td height="51">
       
       <table width="287" height="33" border="0" align="center" cellpadding="0" cellspacing="0">
         <tr>
           <th width="287" height="33" align="center" valign="bottom">
		<a href="photoServlet?info=queryPhotoList&type=<%=photo.getPhotoType()%>" class="a3">滚动浏览图片</a>&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoSlide&type=<%=request.getAttribute("type")%>" class="a3">幻灯片浏览</a> 
		   </th>         
		 </tr>
       </table>
       
       </td>
     </tr>
   </table>
   
   
   
   
   
   
   
   
   
   
   
   <table width="753" height="504" border="0" align="center" cellpadding="0" cellspacing="0" background="images/18.jpg">
     <tr>
       <td align="center" valign="top">     
	
	  <a href="photoServlet?info=queryOnePhoto&id=<%=photo.getId()%>" id="toward"><img src="<%=photo.getPhotoAddress()%>" width="400" height="300" id="images11" ></a>
	  
	  
	 <br><br>
  <div id="demo" style="overflow:hidden;width:500;"> 
<table width="516" border="0" cellpadding="0" cellspacing="0">
  <tr>

    <td  height="103" id="marquePic1">
      
		  
	<table width="90%" border=0 cellspacing=0 cellpadding=0>
 <tr align=center>
  <%for(int j=0;j<list.size();j++){
		Photo photo1=(Photo)list.get(j);
		  %>
 <td>
 &nbsp;
 <img src="<%=photo1.getSmallPhoto()%>"  onclick="images11.src='<%=photo1.getPhotoAddress()%>';toward.href='photoServlet?info=queryOnePhoto&id=<%=photo1.getId()%>'">
 
 </td>
	 <%}%>
</tr>
 </table>
		
	

	</td>
	 
	  <td id="marquePic2"></td>
  </tr>
</table>
</div>

<script>
var speed=30 ;
marquePic2.innerHTML=marquePic1.innerHTML; 
function Marquee(){ 
 if(demo.scrollLeft>=marquePic1.scrollWidth){ 
  demo.scrollLeft=0; 
 }
 else{ 
  demo.scrollLeft=demo.scrollLeft+5;
 } 
} 
var MyMar=setInterval(Marquee,speed);
 demo.onmouseover=function() {
 clearInterval(MyMar);
} 
demo.onmouseout=function() {
 MyMar=setInterval(Marquee,speed);
} 
</script>	   </td>
			       
     </tr>
</table>
<jsp:include page="down.jsp" flush="true"></jsp:include>
		 
		 

</body>
</html>
