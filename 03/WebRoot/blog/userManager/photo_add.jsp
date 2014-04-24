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
<title>${sessionScope.account}的博客后台管理-相片添加</title>
</head>
<%
String account = (String) request.getSession().getAttribute("account");
String hql = "from UserInfo where account = '" + account + "'";
ObjectDao<UserInfo> objectDao = new ObjectDao<UserInfo>();
UserInfo userInfo = (UserInfo) objectDao.queryFrom(hql);
String type = userInfo.getPicType().trim();
String types[] = type.split(",");
request.setAttribute("types", types);
if(type.equals("")){
out.print("<script language=javascript>alert('没有相册类别\\n请先相册文章类别！');window.location.href='userInfo_phtType_query.htm';</script>");
}


%>
<body>
<jsp:include page="manager_top.jsp" flush="true"/>
<table width="900" height="39" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_b_top1.gif">
  <tr>
    <td width="249">&nbsp;&nbsp;<font color="#FFFFFF"><b>当前登录用户：${session.account}</b></font></td>
    <td width="651">相片添加</td>
  </tr>
</table>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="EBF1FD" bgcolor="EBF1FD">
  <tr>
    <td width="194" height="339" valign="top"><jsp:include page="manager_left.jsp" flush="true"/></td>
    <td width="644" align="center" valign="top" bgcolor="#FFFFFF"><br>      <br>
      <table width="550" height="121" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="EBF1FD">
        <s:form action="photoInfo_photo_add" enctype="multipart/form-data">                                          
        <tr>
          <td width="80" height="40">相片标题：</td>
          <td width="470" bgcolor="#FFFFFF"><s:textfield name="photoName"/></td>
        </tr>
        <tr>
          <td height="40">相册类别：</td>
          <td bgcolor="#FFFFFF"><s:select name="photoType" list="#request.types" /></td>
        </tr>
        <tr>
          <td height="40">相片地址：</td>
          <td bgcolor="#FFFFFF"><s:file name="upload"/></td>
        </tr>
        <tr>
          <td height="40">&nbsp;</td>
          <td><s:submit value=" 添加相片 "/><s:hidden name="author" value="%{#session.account}"/></td>
        </tr>
        </s:form>
      </table> <br>
      <s:fielderror/>
      ${requestScope.result}    </td>
  </tr>
</table>
<jsp:include flush="true" page="manager_down.jsp"/>
</body>
</html>
