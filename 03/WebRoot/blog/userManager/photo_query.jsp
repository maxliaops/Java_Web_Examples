<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.mr.model.PhotoInfo"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set name="user" value="%{#request.userInfo}"/>
<title>${sessionScope.account}的博客后台管理-相册查询</title>
</head>
<%
List list=(List)request.getAttribute("list");
%>
<body>
<jsp:include page="manager_top.jsp" flush="true"/>
<table width="900" height="39" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_b_top1.gif">
  <tr>
    <td width="249">&nbsp;&nbsp;<font color="#FFFFFF"><b>当前登录用户：${session.account}</b></font></td>
    <td width="651">相册查询</td>
  </tr>
</table>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="EBF1FD" bgcolor="EBF1FD">
  <tr>
    <td width="194" height="339" valign="top"><jsp:include page="manager_left.jsp" flush="true"/></td>
    <td width="644" align="center" valign="top" bgcolor="#FFFFFF"><br>
      <br>    
	  <br>
	  <table width="179" height="165" border="0" cellpadding="0" cellspacing="0">
        <tr>
         <%
		  int  lineCount=3;
		  int  size=list.size();
		  int  rowCount=size/lineCount;
		  if(size%lineCount!=0){
			  rowCount++;
		  }
		  for(int i = 0;i<size;i++){
			  PhotoInfo photoInfo=(PhotoInfo)list.get(i);
		  %>
          <td width="179">
		 
		  <table width="147" height="164" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="194">
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
              <td height="20" align="right"><a href="photoInfo_photo_delete.htm?id=<%=photoInfo.getId()%>">删除</a></td>
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
    </table>    </td>
  </tr>
</table>
<jsp:include flush="true" page="manager_down.jsp"/>
</body>
</html>
