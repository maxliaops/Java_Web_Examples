<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<html>
<head>
<title>网上书店</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" background="Images/bg.gif">
  <tr>
    <td>
<table width="777" height="768"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top">
	<jsp:include page="Top.jsp"/>
	<table width="100%" height="330"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="26%" valign="top">
		 <jsp:include page="left.jsp"/> 
		</td>
          <td width="5" valign="top" background="Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="272"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="97%" height="220" valign="top">
			   <table width="100%" height="126"  border="0" cellpadding="0" cellspacing="0">

			    <tr>
                  <td valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="70" colspan="2" class="tableBorder_B"><img src="Images/ico_cart.gif" width="176" height="70"></td>
                    </tr>
                    <tr>
                      <td height="24" colspan="2" align="center">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="48%" height="38" align="right" class="word_orange">您的购物车为空！</td>
                      <td width="52%" rowspan="3" align="right" valign="bottom"><img src="Images/cart.gif" width="150" height="186"></td>
                    </tr>
                    <tr>
                      <td height="57" align="right"><input name="Button" type="button" class="btn_grey" value="我要购书！" onClick="window.location.href='index.jsp'"></td>
                    </tr>
                    <tr>
                      <td height="72" align="right">&nbsp;</td>
                    </tr>
                  </table></td>
			     </tr>
              </table>
					  </td>
              <td width="3%" valign="top">&nbsp;</td>
            </tr>
          </table></td>
        </tr>
      </table>
      <jsp:include page="copyright.jsp"/>
    </td>
  </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>
