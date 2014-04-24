<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<html>
<head>
<title>找回密码</title>
</head>
<link href="css/css.css" rel="stylesheet" type="text/css">
<script src="js/validate.js"></script>
<body bgcolor="#ffffff"> 
<table width="630" border="0" cellspacing="0" cellpadding="0" class="tableBorder6"> 
  <tr> 
    <td height="165"><jsp:include page="top.jsp"/></td> 
  </tr> 
  <tr> 
    <td height="235"><form method="post" action="user_modify.jsp" name="forms"> 
        <table width="548" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
          <tr> 
            <td height="27" colspan="2" align="center" class="TableTitle1">找回密码</td> 
          </tr>           <%User re=(User)request.getAttribute("re");
if(re==null||re.getUid()==null){
User u=(User)request.getAttribute("user");
if(u==null||u.getUid()==null){%> 
          <script>
function repasswrod(){
        if(forms.uid.value==""){
                alert("请填写用户名");
                return false;
        }
}
</script> 
          <tr> 
            <td width="372" height="13" align="center" bgcolor="#FFFFFF">用&nbsp;户&nbsp;名：</td> 
            <td width="367" align="center" bgcolor="#FFFFFF"><input type="text" name="uid"></td> 
          </tr> 
          <%}else{%> 
          <script>
function repasswrod(){
        if(forms.reganswer.value==""){
                alert("请添写回答提示");
                return false;
        }
}
</script> 
          <tr> 
            <td height="14" align="center" bgcolor="#FFFFFF">密码提示：</td> 
            <td width="367" align="center" bgcolor="#FFFFFF"><%=u.getRegqu()%></td> 
          </tr> 
          <tr> 
            <input type="hidden" name="uid" value="<%=u.getUid()%>" > 
            <td height="27" align="center" bgcolor="#FFFFFF">回答提示：</td> 
            <td height="27" align="center" bgcolor="#FFFFFF"><input type="text" name="reganswer" ></td> 
          </tr> 
          <input type="hidden" name="regqu" value="<%=u.getRegqu()%>" > 
          <%}%> 
          <tr> 
            <td height="27" colspan="2" align="center" bgcolor="#FFFFFF"><input type="hidden" value="modify" name="action" > 
&nbsp;&nbsp; 
            <input name="Submit2" type="submit" class="btn_grey" onClick="return repasswrod()"></td> 
          </tr> 
          <%}else{%> 
          <tr> 
            <td height="14" colspan="2" align="center" class="TableTitle1">请及时修改你的密码</td> 
          </tr> 
          <tr> 
            <td height="14" align="center" bgcolor="#FFFFFF">用户名：</td> 
            <td width="367" align="center" bgcolor="#FFFFFF">[<%=re.getUid()%>]</td> 
          </tr> 
          <tr> 
            <td height="14" align="center" bgcolor="#FFFFFF">密&nbsp;&nbsp;码：</td> 
            <td width="367" align="center" bgcolor="#FFFFFF">[<%=re.getPassword()%>]</td> 
          </tr> 
          <tr> 
            <td height="14" colspan="2" align="center" bgcolor="#FFFFFF">&nbsp;</td> 
          </tr>           <%}%> 
        </table> 
      </form></td> 
  </tr> 
  <tr> 
    <td align="center"><jsp:include page="bottom.jsp"/></td> 
  </tr> 
</table> 
</body>
</html>
