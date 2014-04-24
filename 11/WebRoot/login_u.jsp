<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%String username=(String)session.getAttribute("username");
if (username==null || username==""){%>
<script src="JS/check.js"></script>
<table width="788" height="34" border="0" align="center" cellpadding="0" cellspacing="0">
<form name="form1" method="post" action="login_U_deal.jsp">
  <tr>
    <td width="68" align="right" bgcolor="#DCE6F2"><img src="images/login_ico.GIF" width="24" height="18" />&nbsp;&nbsp;</td>
    <td width="720" bgcolor="#DCE6F2" class="word_darkBlue">会员名：
      <input name="username" type="text" class="txt_grey" id="username" size="16" />
    &nbsp;密&nbsp;&nbsp;码：
    <input name="PWD" type="password" class="txt_grey" id="PWD" size="16" onkeydown="if(event.keyCode==13) form1.submit();" />
    &nbsp;
    <input name="Submit2" type="button" value="登录" onclick="checkU(form1)" class="btn_bg_login" />
    <input name="Submit3" type="reset" value="重置" class="btn_bg_login" />
    &nbsp;<a href="register.jsp" class="word_orange">注册</a></td>
  </tr>
</form>  
</table>

 <%}else{%>
<table width="788" height="34" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="68" align="right" bgcolor="#DCE6F2"><img src="images/login_ico.GIF" width="24" height="18" />&nbsp;&nbsp;</td>
    <td width="720" bgcolor="#DCE6F2" class="word_darkBlue">[<%=username%>]您好，欢迎光临MR网络购物中心，现在可以购物了，希望您在本购物中心逛得愉快！
    
    &nbsp;
    <input name="Submit2" type="button" value="修改资料" onClick="window.location.href='modifyMember.jsp';" class="btn_bg_long" />
    <input name="Submit3" type="button" value="退出登录" class="btn_bg_long" onClick="window.location.href='logout.jsp';"/></td>
  </tr>
</table>
<%}%>
