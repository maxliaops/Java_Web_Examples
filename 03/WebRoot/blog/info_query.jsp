<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@taglib prefix ="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<s:set name="userInfo" value="%{#session.userInfo}"/>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<title><s:property value="#userInfo.account"/>博客空间</title>
</head>

<body>
<jsp:include page="blog_top.jsp" flush="true"/>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="184" height="205" valign="top" background="images/b_l_3.gif"><jsp:include page="blog_left.jsp" flush="true"/></td>
    <td align="center" valign="top"> 
      
	  
	   <br>    
    <table width="502" border="0" cellspacing="0" cellpadding="0">
    <s:iterator value="%{#request.list}" id="info">
      <tr>
        <td  height="40"><s:property value="#info.info_fromAccount"/>:<s:property value="#info.info_content"/></td>
                                                
      </tr>
    </s:iterator>  
    </table>    
    <s:bean name="org.apache.struts2.util.Counter" id="counter">
	    <s:param name = "first" value="1"/>
	    <s:param name = "last" value="%{#request.maxPage}"/>
	    <s:iterator status="st" id="idd">	   
	      <s:a href="info_f_queryInfo.htm?count=%{idd}"><s:property/></s:a>	  
	      <s:if test="!#st.last">
	      &nbsp;&nbsp;&nbsp;
	      </s:if>
	    </s:iterator>
	</s:bean>
    <br>
	  
	  
	  
	  
	  
    </td>
    <td width="180" align="center" valign="top" background="images/b_r_2.gif"><jsp:include page="blog_right.jsp" flush="true"/></td>
  </tr>
</table>
<jsp:include page="blog_down.jsp" flush="true"/>
</body>

</html>
