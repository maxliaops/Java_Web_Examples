<%@ page contentType="text/html; charset=GBK"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>锐芒科技</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="clockon(bgclock)">
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr align="center">
    <td height="165" colspan="4"><jsp:include page="top.jsp"/></td>
  </tr>
  <tr>
    <td width="11" align="left" valign="top">&nbsp;</td>
    <td width="117" align="left" valign="top"><jsp:include page="left.jsp"/></td>
    <td width="20">&nbsp;</td>
    <td align="left" valign="top">
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><jsp:include page="new.jsp"/></td>
        </tr>
        <tr>
          <td><jsp:include page="produce.jsp"/></td>
        </tr>
    </table>    </td>
  </tr>
  <tr>
    <td colspan="4" align="center"><jsp:include page="bottom.jsp"/></td>
  </tr>
</table>
</body>
</html>


