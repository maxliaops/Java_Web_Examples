<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<br>	
<table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><b>个人管理</b></td>
  </tr>
  <tr>
    <td height="30" align="right"><a href="userInfo_goinUserManager.htm">个人详细信息</a></td>
  </tr>
  <tr>
    <td height="30" align="right"><a href="blog/userManager/userPassword_update.jsp">修改个人密码</a></td>
  </tr>
</table>
<table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><strong>文章管理</strong></td>
  </tr>
  <tr>
    <td height="30" align="right"><a href="blog/userManager/article_add.jsp">添加文章</a></td>
  </tr>
  <tr>
    <td height="30" align="right"><a href="articleInfo_article_query.htm">文章列表</a></td>
  </tr>
  <tr>
    <td height="30" align="right"><a href="userInfo_artType_query.htm">文章类别</a></td>
  </tr>  
</table>
<table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><strong>相册管理</strong></td>
  </tr>
  <tr>
    <td height="30" align="right"><a href="blog/userManager/photo_add.jsp">添加相片</a></td>
  </tr>
  <tr>
    <td height="30" align="right"><a href="photoInfo_photo_query.htm">相片查询</a></td>
  </tr>
  <tr>
    <td height="30" align="right"><a href="userInfo_phtType_query.htm">相册类别</a></td>
  </tr>
</table>
<table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><strong>好友管理</strong></td>
  </tr>
  <tr>
    <td height="30" align="right"><a href="userInfo_friend_query.htm">查看好友</a></td>
  </tr>
</table>
<table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><strong>留言管理</strong></td>
  </tr>
  <tr>
    <td height="30" align="right"><a href="info_queryInfo.htm?sign=0">查看留言</a></td>
  </tr>

</table>
<table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><strong>小纸条</strong></td>
  </tr>
  <tr>
    <td height="30" align="right"><a href="info_queryInfo.htm?sign=1">查看纸条</a></td>
  </tr>

</table>
<table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><b>退出操作</b></td>
  </tr>
  <tr>
    <td height="30" align="right"><a href="userInfo_goinUser.htm?account=${sessionScope.account}">返回我的博客</a></td>
  </tr>
  <tr>
    <td height="30" align="right"><a href="userInfo_landOutUser.htm">退出系统</a></td>
  </tr>
</table>

