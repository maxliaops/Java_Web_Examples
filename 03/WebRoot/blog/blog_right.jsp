<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:directive.page import="com.mr.model.UserInfo" />
<jsp:directive.page import="com.mr.model.ArticleInfo" />
<jsp:directive.page import="com.mr.dao.ObjectDao" />
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="com.mr.model.PhotoInfo"/>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	ObjectDao<ArticleInfo> objectDao = new ObjectDao<ArticleInfo>();
	UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
	String account = userInfo.getAccount();
	String hql = "select typeName , count(*) as number from ArticleInfo where author='"
			+ account + "' group by typeName";
	List typeList = objectDao.queryListObject(hql);
	
	
	hql="select id,title from ArticleInfo where author='"+ account + "' order by visit desc";;
	List visitList = objectDao.queryListObject(hql);	
	if(visitList.size()>5){
	visitList=visitList.subList(0,5);
	}
	
	
	String friends[]=null;
	String friends_type = userInfo.getFriendType();	
	if(!friends_type.equals("")){
		friends=friends_type.split(",");	
	}
	
	
	ObjectDao<PhotoInfo> objectDao1 = new ObjectDao<PhotoInfo>();	
	String hql1 = "select photoType , count(*) as number from PhotoInfo where author='"
			+ account + "' group by photoType";
	List photoType = objectDao1.queryListObject(hql1);
	
%>

<table width="180" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_r_2.gif">
  <tr>
    <td><img src="images/b_r_1.gif" width="180" height="38"></td>
  </tr>
  <tr>
    <td>
	
	
      <table width="167" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<%if(visitList.size()==0){ %>
	<tr>
		<td height="30">暂无热门文章</td>
	</tr>
	<%}else{
		for(int i = 0;i<visitList.size();i++){
			Object[] result1=(Object[])visitList.get(i);
		%>
	<tr>
		<td height="30"><a href="articleInfo_f_article_query.htm?id=<%=result1[0]%>"><%=result1[1]%></a></td>
	</tr>
	<%} }%>
</table>
	
	
	
	
	</td>
  </tr>
</table>
<table width="180" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_r_2.gif">
  <tr>
    <td height="48"><img src="images/b_r_3.gif" width="180" height="48"></td>
  </tr>
  <tr>
    <td>
	<table width="167" border="0" align="center" cellpadding="0"
	cellspacing="0">	
	<%if(typeList.size()==0){ %>
	<tr>
		<td height="30">暂无文章分类</td>
	</tr>
	
<%}else{
for(int i =0;i<typeList.size();i++){
    Object[] result2=(Object[])typeList.get(i);
%>
	<tr>
		<td height="30"><a href=blog/blog.jsp?type=<%=result2[0]%>><%=result2[0]%>（<%=result2[1]%>）</a></td>
	</tr>
<% }}%>
</table>
	
	</td>
  </tr>
</table>



<table width="180" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_r_2.gif">
  <tr>
    <td height="41"><img src="images/b_r_4.gif" width="180" height="41"></td>
  </tr>
  <tr>
    <td><table width="167" height="22" border="0" align="center" cellpadding="0"
	cellspacing="0">
		<%if(typeList.size()==0){ %>
	<tr>
		<td height="30">暂无图片分类</td>
	</tr>
	
<%}else{
for(int i =0;i<photoType.size();i++){
    Object[] result2=(Object[])photoType.get(i);
%>
	<tr>
		<td height="30"><a href=photoInfo_fphoto_query.htm?photoType=<%=result2[0]%>><%=result2[0]%>（<%=result2[1]%>）</a></td>
	</tr>
<% }}%>
</table>  </td>
  </tr>
</table>



<table width="180" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_r_2.gif">
  <tr>
    <td height="41"><img src="images/b_r_5.gif" width="180" height="44"></td>
  </tr>
  <tr>
    <td><table width="167" height="22" border="0" align="center" cellpadding="0"
	cellspacing="0">
	
	<%if(null==friends) {%>
	<tr>
		<td height="40">暂无好友联系</td>
	</tr>
	<%}else{
		int size=friends.length;		
		if(size>5){
			size=5;
		}
	   for(int i = 0;i<size;i++){		   
	%>
	<tr>
		<td height="40"><a href="userInfo_goinUser.htm?account=<%=friends[i]%>"><%=friends[i]%></a></td>
	</tr>	
	<%} }%>	
</table></td>
  </tr>
</table>
