<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.dbs.Dbshop"%>
<%
    int id=ParamUtils.getIntParameter(request,"id",0);
    Dbshop shop=new Dbshop(id);
%>
<html>
<head>
<title>修改连锁店</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>
<script language=javascript>
function CheckForm()
{
	if(document.form1.pname.value=="")
	{
		alert("请输入商品名！");
		document.form1.pname.focus();
		return false;
	}
	if(document.form1.pmodel.value == "")
	{
		alert("请输入型号！");
		document.form1.pmodel.focus();
		return false;
	}
	if(document.form1.pcost.value == "")
	{
		alert("请输入单价！");
		document.form1.pcost.focus();
		return false;
	}
	if(document.form1.pheft.value == "")
	{
		alert("请输入重量！");
		document.form1.pheft.focus();
		return false;
	}


		return true;
}
</script>

<body>
<table width="777" height="172"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="Images/tiring-room/tiring-room_01.gif" width="777" height="125"></td>
      </tr>
      <tr>
        <td height="47" valign="top" background="Images/tiring-room/tiring-room_02.gif"><jsp:include page="H_navigation.jsp"/></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="44" height="380" valign="top"><img src="Images/tiring-room/tiring-room_03.gif" width="44" height="248"></td>
    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="68" colspan="2" background="Images/tiring-room/h_modifychain.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
	<form method="POST" action="shop_add.jsp">
      <table width="80%" border="0" align="center">
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用户名：</td>
          <td colspan="2"><input type="text" name="username" size="20" value=<%=shop.getUsername()%>></td>
        </tr>
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 密码：</td>
          <td colspan="2"><input type="text" name="password" size="20" value=<%=shop.getPassword()%>></td>
        </tr>
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp;&nbsp;&nbsp; 连锁店名称：</td>
          <td colspan="2"><input type="text" name="shopname" size="20" value=<%=shop.getShopname()%>></td>
        </tr>
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 所属地区：</td>
          <td colspan="2"><input type="text" name="area" size="20" value=<%=shop.getArea()%>></td>
        </tr>
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp; 连锁店负责人:</td>
          <td colspan="2">
            <input type="text" name="peopleman" size="20" value=<%=shop.getPeopleman()%>></td>
        </tr>
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp;&nbsp;&nbsp; 负责人电话:</td>
          <td colspan="2">
            <input type="text" name="mantel" size="20" value=<%=shop.getMantel()%>></td>
          <input type="hidden" name="id" value="<%=id%>">
          <input type="hidden" name="usertype" value="1">
          <input type="hidden" name="pageaction" value="MODIFY">
          <input type="hidden" name="responsepage" value="shopman.jsp">
        </tr>
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp;&nbsp;&nbsp; 连锁店电话：</td>
          <td colspan="2"><input type="text" name="shoptel" size="20" value=<%=shop.getShoptel()%>></td>
        </tr>
        <tr>
          <td width="23%" height="30" align="right"><input name="B1" type="submit" class="btn_grey" value="提交"></td>
          <td width="15%" align="center"><input name="B2" type="reset" class="btn_grey" value="全部重写"></td>
          <td width="62%"><input name="button" type="button" class="btn_grey" onClick="history.back();" value="&nbsp;返&nbsp;回&nbsp;"></td>
        </tr>
      </table>
    </form>
		  </td>
      </tr>
    </table></td>
    <td width="35" valign="top"><img src="Images/tiring-room/tiring-room_05.gif" width="35" height="248"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>