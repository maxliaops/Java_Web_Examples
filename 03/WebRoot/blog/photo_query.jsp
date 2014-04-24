<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.mr.model.UserInfo"/>
<jsp:directive.page import="com.mr.dao.ObjectDao"/>
<jsp:directive.page import="com.mr.model.ArticleInfo"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.mr.tools.ToChinese"/>
<jsp:directive.page import="com.mr.model.PhotoInfo"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@taglib prefix ="s" uri="/struts-tags"%>
<s:set name="userInfo" value="%{#session.userInfo}"/>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<title><s:property value="#userInfo.account"/>博客空间</title>
</head>
<%
String info="相片全部查询";
if(null!=request.getAttribute("Info")){
	info=(String)request.getAttribute("info");
}
List list=(List)request.getAttribute("list");
%>
<body>
<jsp:include page="blog_top.jsp" flush="true"/>

<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="184" height="205" valign="top" background="images/b_l_3.gif"><jsp:include page="blog_left.jsp" flush="true"/></td>
    <td align="center" valign="top"> 
	
	 <br>
    <%=info%><br><br>
    <table width="179" height="165" border="0" cellpadding="0" cellspacing="0">
        <tr>
         <%
		  int  lineCount=2;
		  int  size=list.size();
		  int  rowCount=size/lineCount;
		  if(size%lineCount!=0){
			  rowCount++;
		  }
		  for(int i = 0;i<size;i++){
			  PhotoInfo photoInfo=(PhotoInfo)list.get(i);
		  %>
          <td width="179">
		 
		  <table width="147" height="164" border="1" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="143" height="98" align="center">
              <a href="blog/userManager/photo_queryOne.jsp?address=<%=photoInfo.getPhotoAddress()%>" target="_blank">
              <img src="<%=photoInfo.getPhotoAddress()%>" height="123" width="140">
              </a>
              </td>
            </tr>
            <tr>
              <td height="20">相片类别：<%=photoInfo.getPhotoType()%></td>
            </tr>
            <tr>
              <td height="20">相片名称：<%=photoInfo.getPhotoName() %></td>
            </tr>     
          </table>
          </td>
		      <%
            if(i%lineCount==lineCount-1){
             	  
             out.print("</tr><tr>");             	  
           }
        }  
      
        if(rowCount*lineCount-size>0){
        	int overCount=rowCount*lineCount-size;
        	  for(int j=0;j<overCount;j++){
              out.print("<td align=center>&nbsp;</td>");
        	  }
        }
        %>
        </tr>
      </table>
   
   
   
   <br>	
	
    </td>
    <td width="180" align="center" valign="top" background="images/b_r_2.gif"><jsp:include page="blog_right.jsp" flush="true"/></td>
  </tr>
</table>
<jsp:include page="blog_down.jsp" flush="true"/>
</body>

</html>
