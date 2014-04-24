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
String account=userInfo.getAccount();
String hql = "from ArticleInfo where author = '"+account+"' order by id desc";
String type=null;
if(null!=request.getParameter("type")){
   type=ToChinese.toChinese(request.getParameter("type"));
   hql = "from ArticleInfo where author = '"+account+"' and typeName='"+type+"' order by id desc";
}
request.setAttribute("type",type);
ObjectDao<ArticleInfo> objectDao= new ObjectDao<ArticleInfo>();
List<ArticleInfo> list = objectDao.queryList(hql);

int showNumber = 5;
Integer count = 0;
if (null != request.getParameter("count")) {
	count = Integer.valueOf(request.getParameter("count"));
}
list = objectDao.queryList(hql);
int maxPage = list.size();
if (maxPage % showNumber == 0) {
	maxPage = maxPage / showNumber;
} else {
	maxPage = maxPage / showNumber + 1;
}
if (0 == count) {
	list = objectDao.queryList(hql, showNumber, count);
} else {
	count--;
	list = objectDao.queryList(hql, showNumber, count * showNumber);
}
request.setAttribute("count", count);
request.setAttribute("list", list);
request.setAttribute("maxPage", maxPage);




%>
<body>
<jsp:include page="blog_top.jsp" flush="true"/>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="184" height="205" valign="top" background="images/b_l_3.gif"><jsp:include page="blog_left.jsp" flush="true"/></td>
    <td align="center" valign="top">
    <br>
    
    <%
    if(list.size()==0){
    	out.print("暂无人任何文章！");
    }else{
    for(int i=0;i<list.size();i++){
       ArticleInfo articleInfo = (ArticleInfo)list.get(i);
       String content=articleInfo.getContent();
       if(content.length()>50){
    	   content=content.substring(0,50)+"......";
       }
    %>
	<table width="493" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="513" height="30">
		  <font color="09287A"><b><%=articleInfo.getTitle()%></b></font>		</td>
      </tr>
      <tr>
        <td height="40"><%=content%></td>
      </tr>
      <tr>
        <td height="40">
		<font color="09287A">
		发布时间：<%=articleInfo.getSendTime()%>&nbsp;|&nbsp;访问次数：<%=articleInfo.getVisit() %>&nbsp;|&nbsp;文章类别:<%=articleInfo.getTypeName()%>		</font>		</td>
      </tr>
      <tr>
        <td align="right"><a href=articleInfo_f_article_query.htm?id=<%=articleInfo.getId()%>>详细查询</a></td>
      </tr>
    </table>
	<hr class="hrr">
    <% } }%>
    
    <s:bean name="org.apache.struts2.util.Counter" id="counter">
	    <s:param name = "first" value="1"/>
	    <s:param name = "last" value="%{#request.maxPage}"/>
	    <s:iterator status="st" id="id">
	    <s:if test="%{#request.type==null}">
	      <s:a href="userInfo_goinUser.htm?account=%{#request.userInfo.account}&count=%{id}"></s:a>
	    </s:if>
	    <s:else>
	     <s:a href="userInfo_goinUser.htm?account=%{#request.userInfo.account}&count=%{id}&type=%{#request.type}"></s:a>
	    </s:else>
	      <s:if test="!#st.last">
	      &nbsp;&nbsp;&nbsp;
	      </s:if>
	    </s:iterator>
	</s:bean>
    
    
    
    
    <br>	</td>
    <td width="180" align="center" valign="top" background="images/b_r_2.gif"><jsp:include page="blog_right.jsp" flush="true"/></td>
  </tr>
</table>
<jsp:include page="blog_down.jsp" flush="true"/>
</body>

</html>
