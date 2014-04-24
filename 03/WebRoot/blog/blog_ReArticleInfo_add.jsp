<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%request.setAttribute("id",request.getParameter("id")); %>
<table width="480" height="147" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFCC00">
  <tr>
    <td height="147">	
<table width="517" border="1" cellspacing="0" cellpadding="0">
     <s:form action="reArticleInfo_reArticle_add">
      <tr>
        <td width="513" height="30">文章回复：${sessionScope.account}</td>
      </tr>
      <tr>
        <td height="93"><s:textarea name="content" cols="75" rows="5"/></td>
      </tr>
      <tr>
        <td height="30"><s:submit value=" 回复 "/><s:hidden name="re_id" value="%{#request.id}"/></td>
      </tr>
      </s:form>
    </table>
	
	</td>
  </tr>
</table>
    
    
  
