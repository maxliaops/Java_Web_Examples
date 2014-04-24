<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.mr.model.UserInfo"/>
<jsp:directive.page import="com.mr.dao.ObjectDao"/>
<jsp:directive.page import="com.mr.model.ArticleInfo"/>
<jsp:directive.page import="java.util.List"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@taglib prefix ="s" uri="/struts-tags"%>
<s:set name="userInfo" value="%{#request.userInfo}"/>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<title><s:property value="#userInfo.account"/>博客空间</title>
</head>
<script language="javascript">
function openAddReArt(id){
		var hdc=window.open('blog/blog_ReArticleInfo_add.jsp?id='+id,'','width=500,height=200');
		width=screen.width;
		height=screen.height;
		hdc.moveTo((width-480)/2,(height-147)/2);
	}
</script>


<body>
<jsp:include page="blog_top.jsp" flush="true"/>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="184" valign="top" background="images/b_l_3.gif"><jsp:include page="blog_left.jsp" flush="true"/></td>
    <td align="center" valign="top" bgcolor="#FFFFFF">
    <br>
    ${requestScope.articleInfo.title}
  
     <table width="486" height="94" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="539" height="63">${requestScope.articleInfo.content}</td>
      </tr>
      <tr>
        <td height="29">文章类别：${requestScope.articleInfo.typeName }&nbsp;|&nbsp;发布人：${requestScope.articleInfo.author }&nbsp;|&nbsp;发布时间：${requestScope.articleInfo.sendTime}&nbsp;|&nbsp;访问次数：${requestScope.articleInfo.visit}</td>
      </tr>
    </table>


     <table width="505" height="20" border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td width="505" height="20" align="right">   
         <%if(null!=session.getAttribute("account")){ 
        	 String account=(String)session.getAttribute("account");
        	 UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
        	 if(!account.equals(userInfo.getAccount())){
         %>         
         <a  style="cursor:hand;" onClick="openAddReArt('${requestScope.articleInfo.id}')">添加回复内容</a>
          <%}}%>
         &nbsp;&nbsp;&nbsp;&nbsp;
         <a style="cursor:hand;" onclick="javascript:history.go(-1);">返回</a>&nbsp;&nbsp;
         </td>
       </tr>
     </table>
     <hr class="hrr">
    <s:if test="%{#request.list!=null}">  
     <s:iterator value="%{#request.list}" id="reArticle">
     <table width="469" border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td height="30" colspan="2">回复人：<s:property value="#reArticle.account"/></td>
       </tr>
       <tr>
         <td height="59" colspan="2"><s:property value="#reArticle.content"/></td>
       </tr>
       <tr>
         <td width="283" height="30">回复时间：<s:property value="#reArticle.re_time"/></td>
         <td width="221" align="right">&nbsp;
       <%
       ArticleInfo articleInfo=(ArticleInfo)request.getAttribute("articleInfo");
       String account=null;
       if(null!=session.getAttribute("account")){
    	    account=(String)session.getAttribute("account");
       }
       if(articleInfo.getAuthor().equals(account)){
       %>
         <s:a href="reArticleInfo_reArticle_delete.htm?id=%{#reArticle.id}">删除</s:a>
        <%} %>
         </td>
       </tr>
     </table>
      <hr class="hrr">
     </s:iterator>    
    <s:bean name="org.apache.struts2.util.Counter" id="counter">
	    <s:param name = "first" value="1"/>
	    <s:param name = "last" value="%{#request.maxPage}"/>
	    <s:iterator status="st" id="idd">
	      <s:a href="articleInfo_f_article_query.htm?count=%{idd}&id=%{#request.articleInfo.id}"><s:property value="id"/></s:a>
	      <s:if test="!#st.last">
	      &nbsp;&nbsp;&nbsp;
	      </s:if>
	    </s:iterator>
	</s:bean>
    </s:if>
    
    
    <br>	</td>
    <td width="180" align="center" valign="top" background="images/b_r_2.gif"><jsp:include page="blog_right.jsp" flush="true"/></td>
  </tr>
</table>
<jsp:include page="blog_down.jsp" flush="true"/>
</body>

</html>
