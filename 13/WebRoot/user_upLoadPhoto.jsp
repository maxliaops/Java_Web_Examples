<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.tools.Encrypt"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>宇晨相册——个人相册添加</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/js.js" type="text/javascript"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<c:if test="${sessionScope.userInfo==null}">
    <%response.sendRedirect("index.jsp");%>
</c:if>


<script type="text/javascript">
    function addMore(){
    var td = document.getElementById("more");
    var br= document.createElement("br");
    var input= document.createElement("input");
    var button= document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "移除...";
    
    
    button.onclick = function(){
      td.removeChild(br);
      td.removeChild(input);
      td.removeChild(button);
    }
   
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
    }
</script>
 















<body>
   <jsp:include page="top.jsp" flush="true" />
   <table width="753" height="40" border="0" align="center" cellpadding="0" cellspacing="0" background="images/16.jpg">
     <tr>
       <td width="561" height="28">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#EDE6BC" size="-1"><b>当前用户：${sessionScope.userInfo.username}</b></font></td>
       <td width="192">&nbsp;</td>
     </tr>
</table>
   <table width="753" height="54" border="0" align="center" cellpadding="0" cellspacing="0" background="images/17.jpg">
     <tr>
       <td height="51"><table width="287" height="33" border="0" align="center" cellpadding="0" cellspacing="0">
         <tr>
           <th width="287" height="33" align="center" valign="bottom">上传图片</th>
         </tr>
       </table></td>
     </tr>
   </table>
   
   
   
   
   <table width="753" height="504" border="0" align="center" cellpadding="0" cellspacing="0" background="images/18.jpg">
     <tr>
       <td height="120" align="center" valign="top">    
	   
	      
	   <form action="photoServlet?info=userUploadPhoto" method="post" enctype="multipart/form-data" name="form" onSubmit="return checkPhoto(form)">
	     <table width="525" border="0">
         <tr>
           <td width="75" height="20"><b>相片名称：</b></td>
           <td width="434"><input name="photoName" type="text" maxlength="20"></td>
         </tr>
         <tr>
           <td height="20"><b>相片类型：</b></td>
           <td>
             <select name="photoType">
			    <option value="生活用品">生活用品</option>
			    <option value="甜蜜爱情">甜蜜爱情</option>
			    <option value="亲亲宝贝">亲亲宝贝</option>
			    <option value="动漫卡通">动漫卡通</option>
			    <option value="游戏图案">游戏图案</option>
			    <option value="搞笑贴图">搞笑贴图</option>
			    <option value="宠物精灵">宠物精灵</option>
			    <option value="美味佳肴">美味佳肴</option>	
			    <option value="花草园林">花草园林</option>
			    <option value="天下奇观">天下奇观</option>
			    <option value="五花八门">五花八门</option>
			    <option value="壮丽山河">壮丽山河</option>
			    <option value="城市风光">城市风光</option>
			    <option value="名胜古迹">名胜古迹</option>
			    <option value="室内景观">室内景观</option>
			    <option value="四季印象">四季印象</option>
			    <option value="清风车影">清风车影</option>
             </select>
		   </td>
         </tr>
         <tr>
           <td height="20"><b>上传时间：</b></td>
           <td><%=Encrypt.currentlyTime()%><input name="photoTime" type="hidden" value="<%=Encrypt.currentlyTime()%>"></td>
         </tr>
         <tr>
           <td height="20"><b>相片位置：</b></td>
           <td id="more"><input name="file" type="file" maxlength="20"><input type="button" name="more.." value="增加..." onClick="addMore()"></td>
         </tr>
         <tr>
           <td height="20"><b>上传用户：</b></td>
           <td>${sessionScope.userInfo.username}<input name="username" type="hidden" value="${sessionScope.userInfo.username}" class="input2"></td>
         </tr>
         <tr>
           <td height="20"><b>验&nbsp;证&nbsp;码：</b></td>
           <td><input name="code" type="text" maxlength="20"></td>
         </tr>
         <tr>
           <td height="20">&nbsp;</td>
           <td><a href="#" onClick="reload()"><img border=0 src="image.jsp" name="checkCode"></a></td>
         </tr>
         <tr>
           <td height="20">&nbsp;</td>
           <td>             
               <input type="submit" name="Submit" value="上传" >
             &nbsp;&nbsp;
               <input type="reset" name="Submit2" value="重置">
             &nbsp;&nbsp;
               <input type="button" name="Submit3" value="返回" onClick="javascript:window.location.href='photoServlet?info=userQueryPhoto';">
            </td>
         </tr>         
       </table>	   
	 </form>	 
	<b> 注意：图片的格式只能为：“jpg”、“JPG”、“gif”、“bmp”、“BNP”格式<br><br>
	 ${requestScope.information}</b>
       </td>
     </tr>
</table>
<jsp:include page="down.jsp" flush="true"></jsp:include>
</body>
</html>
