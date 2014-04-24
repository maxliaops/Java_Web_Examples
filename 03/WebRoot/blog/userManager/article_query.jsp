<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="s" uri="/struts-tags"%>
<title>${sessionScope.account}的博客后台管理-文章查询</title>
</head>




<body>
<jsp:include page="manager_top.jsp" flush="true"/>
<table width="900" height="39" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_b_top1.gif">
  <tr>
    <td width="249">&nbsp;&nbsp;<font color="#FFFFFF"><b>当前登录用户：${session.account}</b></font></td>
    <td width="651">文章查询</td>
  </tr>
</table>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="EBF1FD">
  <tr>
    <td width="194" height="339" valign="top" bgcolor="EBF1FD"><jsp:include page="manager_left.jsp" flush="true"/></td>
    <td width="644" align="center" valign="top" bgcolor="#FFFFFF"><br>
      <br>    <br> 
      <table width="605" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="EBF1FD">
        <tr align="center">
          <td width="47" height="25">编号</td>
          <td width="150">标题</td>
          <td width="124">作者</td>
		  <td width="124">文章类别</td>
          <td width="187">时间</td>
          <td width="85">操作</td>
        </tr>
           <s:iterator value="%{#request.list}" id="article">
        <tr align="center" bgcolor="#FFFFFF">
          <td height="25"><s:property value="#article.id"/></td>
          <td><s:a href="articleInfo_article_queryContent.htm?id=%{#article.id}"><s:property value="#article.title"/></s:a></td>
          <td><s:property value="#article.author"/></td>
		  <td><s:property value="#article.typeName"/></td>
          <td><s:property value="#article.sendTime"/></td>
          <td><s:a href="articleInfo_article_forwardUpdate.htm?id=%{#article.id}">修改</s:a>&nbsp;<s:a href="articleInfo_article_delete.htm?id=%{#article.id}">删除</s:a></td>
        </tr>
        </s:iterator>
      </table>      <br>
	
	<s:bean name="org.apache.struts2.util.Counter" id="counter">
	    <s:param name = "first" value="1"/>
	    <s:param name = "last" value="%{#request.maxPage}"/>
	    <s:iterator status="st" id="id">
	      <s:a href="userInfo_article_query.htm?count=%{id}"><s:property value="id"/></s:a>
	      <s:if test="!#st.last">
	      &nbsp;&nbsp;&nbsp;
	      </s:if>
	    </s:iterator>
	</s:bean>    </td>
  </tr>
</table>
<jsp:include flush="true" page="manager_down.jsp"/>
</body>
</html>
