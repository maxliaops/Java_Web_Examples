<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.mr.dao.ObjectDao"/>
<jsp:directive.page import="com.mr.model.UserInfo"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="s" uri="/struts-tags"%>
<title>${sessionScope.account}的博客后台管理-文章添加</title>
</head>
<%
String account = (String) request.getSession().getAttribute("account");
String hql = "from UserInfo where account = '" + account + "'";
ObjectDao<UserInfo> objectDao = new ObjectDao<UserInfo>();
UserInfo userInfo = (UserInfo) objectDao.queryFrom(hql);
String type = userInfo.getArtType().trim();
String types[] = type.split(",");
request.setAttribute("types", types);
if(type.equals("")){
out.print("<script language=javascript>alert('没有文章类别\\n请先添加文章类别！');window.location.href='userInfo_artType_query.htm';</script>");
}


%>
<body>
<jsp:include page="manager_top.jsp" flush="true"/>
<table width="900" height="39" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_b_top1.gif">
  <tr>
    <td width="249">&nbsp;&nbsp;<font color="#FFFFFF"><b>当前登录用户：${session.account}</b></font></td>
    <td width="651">文章添加</td>
  </tr>
</table>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="EBF1FD">
  <tr>
    <td width="194" height="339" valign="top" bgcolor="EBF1FD"><jsp:include page="manager_left.jsp" flush="true"/></td>
    <td width="644" align="center" valign="top" bgcolor="#FFFFFF"><br>
      <table width="550" height="367" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="EBF1FD">
        <s:form action="articleInfo_article_add">
        <tr>
          <td width="80" height="30">文章标题：</td>
          <td width="470" bgcolor="#FFFFFF"><s:textfield name="title"/></td>
        </tr>
        <tr>
          <td height="30">文章类别：</td>
          <td bgcolor="#FFFFFF"><s:select name="typeName" list="#request.types" /></td>
        </tr>
        <tr>
          <td height="270">文章内容：</td>
          <td bgcolor="#FFFFFF"><s:textarea name="content" cols="70" rows="20"/></td>
        </tr>
        <tr>
          <td height="30">&nbsp;</td>
          <td><s:submit value=" 添加文章 "/><s:hidden name="author" value="%{#session.account}"/></td>
        </tr>
        </s:form>
      </table> <br>
      <s:fielderror><s:param value="%{'title'}"/></s:fielderror>
      <s:fielderror><s:param value="%{'content'}"/></s:fielderror>
    ${requestScope.result}    </td>
  </tr>
</table>
<jsp:include flush="true" page="manager_down.jsp"/>
</body>
</html>
