<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.util.*,com.wy.form.*" errorPage="" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/js.js" type="text/javascript"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" scope="page" class="com.wy.dao.OperationData"></jsp:useBean>
<title>宇晨相册——首页</title>
</head>


<body>



<table  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/1.jpg" width="753" height="200"></td>
  </tr>
</table>



<table width="753" height="36" border="0" align="center" cellpadding="0" cellspacing="0" background="images/2.jpg">
  <tr>
    <td width="48">&nbsp;</td>
    <td width="705" valign="top"><table width="481" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="31"><font color="EDE6BC"><a href="#" class="a1">相册首页</a>&nbsp; <b>|</b> &nbsp;
		
		                    <c:if test="${sessionScope.userInfo==null}">
                               <a href="#" onclick="javascript:checkUserInfo()" title="请您先登录" class="a1">我的相册</a>
                            </c:if>
                            <c:if test="${sessionScope.userInfo!=null}">
                                <a href="photoServlet?info=userQueryPhoto" class="a1">我的相册</a>
                            </c:if>
								&nbsp; <b>|</b> &nbsp;
											 
								<a href="#" class="a1">分类相册</a> &nbsp;<b>|</b>&nbsp;
											 
							    <a href="#" class="a1">手机相册</a></font></td>
      </tr>
    </table></td>
  </tr>
</table>




<table  height="597" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr >
    <td ><img src="images/10.gif" width="9" height="597"></td>
    <td width="535" valign="top" background="images/3.jpg">
    <br>

<%
List<Photo> list1=(List<Photo>)request.getAttribute("list");
int a=0;
for(Photo photo1:list1){
%>
<table   border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" class="word_black"><%=photo1.getPhotoType()%></td>
    <td height="20" class="word_black" align="right"><a href="photoServlet?info=queryPhotoList&type=<%=photo1.getPhotoType()%>">更多</a></td>
  </tr>
  <tr align="center">
    <%
  List<Photo> list2=dao.photo_queryList("photoType='"+photo1.getPhotoType()+"'");
  int b=0;
  for(Photo photo2:list2){
  %>
    <td width="134" height="103" background="images/9.gif"><a href="photoServlet?info=queryOnePhoto&id=<%=photo2.getId()%>"><img src="<%=photo2.getSmallPhoto()%>"  class="cannelBorder"></a></td>
    <% 
  b++;
  if(b==3)
  break;  }
  if(list2.size()<3){  
  for(int i=0;i<3-list2.size();i++){  %>
    <td width="134" height="103" background="images/9.gif">无</td>
    <%}
  
  
  } %>
  </tr>
</table>
<table width="504" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="504"><hr></td>
        </tr>
</table>
<%

a++;
if(a==3)
break;

} %>
<table width="450" height="100" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="40" class="word_black">其他类别相册</td>
  </tr>
  <tr>
    <td height="47">
	
	
	
	
	
	
	
		<a href="photoServlet?info=queryPhotoList&type=朋友情深">朋友情深</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=甜蜜爱情">甜蜜爱情</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=亲亲宝贝">亲亲宝贝</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=动漫卡通">动漫卡通</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=">游戏图案</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=搞笑贴图">搞笑贴图</a>&nbsp;&nbsp;&nbsp;<a href="#photoServlet?info=queryPhotoList&type=四季印象">四季印象</a><br><br>
		<a href="photoServlet?info=queryPhotoList&type=宠物精灵">宠物精灵</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=美味佳肴">美味佳肴</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=时尚精品">时尚精品</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=花草园林">花草园林</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=">世界军事</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=数码设备">数码设备</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=清风车影">清风车影</a><br><br>
		<a href="photoServlet?info=queryPhotoList&type=天下奇观">天下奇观</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=五花八门">五花八门</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=壮丽山河">壮丽山河</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=城市风光">城市风光</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=">名胜古迹</a>&nbsp;&nbsp;&nbsp;<a href="photoServlet?info=queryPhotoList&type=室内景观">室内景观</a>		</td>
   
   
   
   
   
   
   
   
   
   
   
    </tr>
</table></td>
    <td width="209" valign="top" background="images/4.jpg">	<jsp:include page="right.jsp" flush="true" /></td>
  </tr>
</table>





<jsp:include page="down.jsp" flush="true" />




</body>
</html>
