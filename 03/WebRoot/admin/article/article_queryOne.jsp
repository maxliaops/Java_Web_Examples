<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">   
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>明日博客地带-后台首页-文章查询</title>
</head>
<body>
<jsp:include page="../top.jsp" flush="true"/>
<table width="900" height="303" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="F7FAFF">
  <tr align="center">
    <td width="116" valign="top"><table width="98" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#3399CC">
	 <s:iterator value="%{#request.authorList}" id="author">
      <tr>
        <td height="30" align="center" bgcolor="#FFFFFF"><s:a href="articleInfo_admin_articleQuery.htm?account=%{#author}"><s:property value="#author"/></s:a></td>
      </tr>
	  </s:iterator>
    </table></td>
    <td width="778" valign="top"><br>  &nbsp;
      ${requestScope.articleInfo.title}
	  <br><br>
	  <table width="709" height="113" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>${requestScope.articleInfo.content}</td>
        </tr>
        <tr>
          <td height="30" align="center">发布人：${requestScope.articleInfo.author}&nbsp;&nbsp;&nbsp;&nbsp;发布时间：${requestScope.articleInfo.sendTime}&nbsp;&nbsp;&nbsp;&nbsp;文章类型：${requestScope.articleInfo.typeName}&nbsp;&nbsp;&nbsp;&nbsp;是否推荐：<s:a href="articleInfo_admin_articleQueryOne.htm?id=%{#request.articleInfo.id}&commend=1">${requestScope.articleInfo.commend}</s:a>&nbsp;&nbsp;&nbsp;&nbsp;访问次数：${requestScope.articleInfo.visit}</td>
        </tr>
      </table>  
      <table width="652" height="24" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="24" align="right"><a style="cursor:hand;" onclick="javascript:history.go(-1);">返回</a></td>
        </tr>
      </table></td>
  </tr>
</table>
<jsp:include page="../down.jsp" flush="true"/>
</body>
</html>
