<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>添加公告</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>
<script language="javascript">
function Mycheck()
{
if (form1.subject.value=="")
{ alert("请输入公告主题！");form1.subject.focus();return;}
if (form1.content.value=="")
{ alert("请输入公告内容！");form1.content.focus();return;}
form1.submit();}
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
        <td height="68" colspan="2" background="Images/tiring-room/h_addbbs.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
		<form method="post" action="news_add2.jsp" name="form1">
		<table width="90%" height="236"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="13%" height="30"><div align="center">主&nbsp;&nbsp;题：</div></td>
            <td width="87%" height="30"><input name="motif" type="text" class="" id="subject" size="63">
              </td>
            </tr>
          <tr>
            <td height="30"><div align="center">发布人：</div></td>
            <td height="30"><input name="kithepeople" type="text" class="txt_grey" id="Person"> </td>
            </tr>
          <tr>
        <input type="hidden" name="pageaction" value="create">
	<input type="hidden" name="responsepage" value="newsman.jsp">

            <td height="146"><div align="center">内 &nbsp;容：</div></td>
            <td valign="top"><textarea name="content" cols="63" rows="9" class="wenbenkuang" id="content">
</textarea></td>
          </tr>
          <tr>
            <td height="30">
			  <div align="center">              </div></td>
            <td height="30"><input name="Submit" type="button" class="btn_grey" value="保存" onClick="Mycheck()">
              <input name="Submit2" type="reset" class="btn_grey" value="重置">
              <input name="Submit3" type="button" class="btn_grey" value="返回" onClick="history.back();"></td>
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