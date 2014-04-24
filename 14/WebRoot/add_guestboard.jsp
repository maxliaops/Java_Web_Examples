<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.core.*" %>
<%@ page import="com.model.Guestboard" %>
<%@ page import="com.model.User" %>
<html>
<head>
<title>添加留言</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>

<script >
function guests(){
	if(form1.title.value==""){
		alert("请填写留言标题");	return false;
	}
	if(form1.content.value==""){
		alert("请填写留言内容");	return false;
	}
}
</script>
<body> 
<%
User user1=(User)session.getAttribute("user");
String user="游客";
if(user1!=null){
	user=user1.getName();
}
boolean flag=false;
String submit=ParamUtils.getParameter(request,"submit");
if(submit!=null&&!"".equals(submit)){
    session.removeAttribute("error");
    if("".equals(ParamUtils.getParameter(request,"title"))){
        flag=true;
        session.setAttribute("error","没有添加标题");
        response.sendRedirect("error.jsp");
    }else{
	    BasetableFactory bf=BasetableFactory.getInstance();
        if(!bf.CreateGuestboard(request)){
		    flag=true;
            session.setAttribute("error","添加留言失败");
            response.sendRedirect("error.jsp");
        }else{
		      out.print("<script>opener.location.reload();window.close();</script>");
        }
	}
}
%> 
<table width="499" height="220" border="0" align="center" cellpadding="0" cellspacing="0" style="filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr='#B9E4FF',endColorStr='#4CABE5',gradientType='0')"> 
  <tr align="center"> 
    <td height="30" colspan="2"><img src="images/guestboard.JPG" width="499" height="38"></td> 
  </tr> 
  <form name="form1" method="post" action=""> 
    <tr align="center"> 
      <td height="27">留言标题</td> 
      <td height="27" align="left"> <input name="title" type="text" size="40"></td> 
    </tr> 
    <tr align="center"> 
      <td height="50">留言内容</td> 
      <td align="left"> <textarea name="content" cols="50" rows="6"></textarea></td> 
    </tr> 
    <tr align="center"> 
      <td width="18%" height="27">留&nbsp;言&nbsp;人</td> 
      <td width="82%" height="3" align="left"><input name="guest" type="text" size="40" value="<%=user%>"></td> 
    </tr> 
    <tr align="center"> 
      <td colspan="2"> <input name="Submit2" type="submit" class="btn_grey" onClick="return guests()" value="添加留言"> 
&nbsp;&nbsp; 
        <input type="hidden" value="submit" name="submit" > 
        <input name="Submit" type="button" class="btn_grey" onClick="javascript:opener.location.reload();window.close();" value="关闭窗口"></td> 
    </tr> 
  </form> 
</table> 
</body>
</html>
