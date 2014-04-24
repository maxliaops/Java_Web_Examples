<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="com.actionForm.UserForm" %>
<%
UserForm userForm=(UserForm)request.getAttribute("userList");
if(userForm==null){
%>
<script language="javascript">
alert("您的操作有误！");
window.location.href="user.do?action=userQuery";
</script>
<%
}else{
  int id=userForm.getId();
  String name=userForm.getName();
  Byte setInstorage=userForm.getSetInstorage();
  Byte setOutstorage=userForm.getSetOutstorage();
  Byte setDeal=userForm.getSetDeal();
  Byte setQuery=userForm.getSetQuery();
  Byte setBasic=userForm.getSetBasic();
  Byte setSys=userForm.getSetSys();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>物资管理系统</title>
<link rel="stylesheet" href="Css/style.css">
</head>

<body>
<table width="757" height="174" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="133" align="center" valign="top"><%@ include file="top.jsp"%></td>
  </tr>
  <tr>
    <td>
      <table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" background="images/area_bg.jpg">
        <tr>
          <td width="26%" align="center" class='word_white'>当前登录用户：<%=session.getAttribute("username")%></td>
          <td width="4%">&nbsp;</td>
          <td width="70%" valign="bottom">当前位置：系统管理 &gt; 用户管理 &gt; 修改用户权限 &gt;&gt;&gt;</td>
        </tr>
      </table>
<table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="5" valign="top" background="images/left.gif">&nbsp;</td>
        <td align="center" valign="top">&nbsp;
		<form name="form1" method="post" action="user.do?action=userModify">
        <table width="96%" height="200" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#DDDDDA" bordercolordark="#FFFFFF">
          <tr>
            <td width="16%" align="center">&nbsp;</td>
            <td width="13%" align="left">用户名称：</td>
            <td colspan="5" align="left"><input name="id" type="hidden" id="id" value="<%=id%>">
              <input name="name" type="text" id="name" size="60" readonly="yes" value="<%=name%>"></td>
            <td width="18%" align="left">&nbsp;</td>
          </tr>
         <tr>
            <td align="center">&nbsp;</td>
            <td align="left">物资入库：</td>
            <td width="11%" align="left"><input name="setInstorage" type="checkbox" class="noborder" value="1" <%if(setInstorage.equals(new Byte("1"))){out.println("checked");}%>></td>
            <td width="13%" align="left">物资出库：</td>
            <td width="11%" align="left"><input name="setOutstorage" type="checkbox" class="noborder" value="1" <%if(setOutstorage.equals(new Byte("1"))){out.println("checked");}%>></td>
            <td width="13%" align="left">物资处理：</td>
            <td align="left"><input name="setDeal" type="checkbox" class="noborder" value="1" <%if(setDeal.equals(new Byte("1"))){out.println("checked");}%>></td>
            <td align="left">&nbsp;</td>
         </tr>
         <tr>
           <td align="center">&nbsp;</td>
           <td align="left">查询统计：</td>
           <td align="left"><input name="setQuery" type="checkbox" class="noborder" value="1" <%if(setQuery.equals(new Byte("1"))){out.println("checked");}%>></td>
           <td align="left">基础信息：</td>
           <td align="left"><input name="setBasic" type="checkbox" class="noborder" value="1" <%if(setBasic.equals(new Byte("1"))){out.println("checked");}%>></td>
           <td align="left">系统管理：</td>
           <td align="left"><input name="setSys" type="checkbox" class="noborder" value="1" <%if(setSys.equals(new Byte("1"))){out.println("checked");}%>></td>
           <td align="left">&nbsp;</td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td>&nbsp;</td>
           <td colspan="5"><input name="Submit" type="submit" class="btn_grey" value="保存">
&nbsp;
<input name="Submit2" type="reset" class="btn_grey" value="重置">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" value="返回" onClick="window.location.href='user.do?action=userQuery'"></td>
           <td>&nbsp;</td>
         </tr>
        </table>
		</form>
		</td>
        <td width="10" valign="top" background="images/right.jpg">&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="55" valign="top" background="images/bottom.jpg"><%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>
<%} %>
