<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.mr.model.UserInfo"/>
<jsp:directive.page import="com.mr.dao.ObjectDao"/>
<jsp:directive.page import="com.mr.model.ArticleInfo"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.mr.tools.ToChinese"/>
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
UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
String friend_type=userInfo.getFriendType();
String friends[]=null;
if(!friend_type.equals("")){
	friends=friend_type.split(",");
	request.setAttribute("friends",friends);
}
%>
<body>
<jsp:include page="blog_top.jsp" flush="true"/>

<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="184" height="205" valign="top" background="images/b_l_3.gif"><jsp:include page="blog_left.jsp" flush="true"/></td>
    <td align="center" valign="top"> 
         <br> 好友查询 <br> <br> <br>
	<s:if test="%{#request.friends==null}">
	
	暂无好友！
	</s:if>
	<s:else>	
    <table width="485"  border="0" cellpadding="0" cellspacing="0">	
      <tr>
        <td width="271" height="38">
        <s:iterator value="%{#request.friends}" id="friends" status="st">
           <s:a href="userInfo_goinUser.htm?account=%{friends}"><s:property value="friends"/></s:a>    &nbsp;&nbsp;&nbsp;
              <s:if test="#st.count%4==0">
	              <br><br>
	         </s:if>    
        </s:iterator>        
        </td>
      </tr>	  
    </table>  
	</s:else>
	  <br>
    </td>
    <td width="180" align="center" valign="top" background="images/b_r_2.gif"><jsp:include page="blog_right.jsp" flush="true"/></td>
  </tr>
</table>
<jsp:include page="blog_down.jsp" flush="true"/>
</body>

</html>
