<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.mr.model.UserInfo"/>
<jsp:directive.page import="com.mr.model.PhotoInfo"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">   
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>狼族博客地带-后台首页-相册查询</title>
</head>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String info="全部相册查询";
if(null!=request.getAttribute("info")){
info=(String)request.getAttribute("info");
}
%>
<body>
<jsp:include page="../top.jsp" flush="true"/>
<table width="900" height="303" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="F7FAFF">
  <tr align="center">
    <td width="116" valign="top"><table width="98" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#3399CC">
	<%
	List<UserInfo> userInfoList=(List<UserInfo>)request.getAttribute("userInfoList");
	  for(UserInfo userInfo:userInfoList){
		  String photos[]=userInfo.getPicType().split(",");
	%>	
      <tr>
        <td height="30" bgcolor="#FFFFFF"><b><%=userInfo.getAccount()%><b></td>
      </tr>
      <%
      
      if(photos.length>1){
      for(String photo:photos){ 
      %>
      <tr>
        <td height="30" align="right" bgcolor="#FFFFFF"><a href="photoInfo_admin_photoQuery.htm?photoType=<%=photo%>"><%=photo%></a></td>
      </tr>
	 <%} } }%>
    </table></td>
    <td width="778" valign="top"><br>
    <%=info%><br>
	
	<table width="179" height="165" border="0" cellpadding="0" cellspacing="0">
        <tr>
         <%
          List list=(List)request.getAttribute("list");
		  int  lineCount=4;
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
             <tr>
              <td height="20" align="right"><a href="photoInfo_photo_delete.htm?id=<%=photoInfo.getId()%>&admin=admin">删除</a></td>
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
  </tr>
</table>
<jsp:include page="../down.jsp" flush="true"/>
</body>
</html>
