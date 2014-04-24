<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>MR网络购物中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="navigation.jsp"/>
<jsp:include page="login_u.jsp"/>
<jsp:include page="ad.jsp"/>
<table width="788" height="236"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="193" height="182" valign="top" bgcolor="#FFFFFF">
	<jsp:include page="search.jsp"/>
    <jsp:include page="goodsType.jsp"/>
	</td>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%" height="743"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="45" valign="top" background="images/sub_cartSee.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="top">&nbsp;</td>
        </tr>
            <tr valign="top">
              <td align="center" background="images/cart.gif" style="background-position:right bottom; background-repeat:no-repeat">
<table width="100%" height="191"  border="0" cellpadding="0" cellspacing="0">

			    <tr>
                  <td width="45%" height="125" align="right" valign="middle"><img src="images/sign.GIF" width="44" height="39"></td>
		          <td width="2%" align="right" valign="middle">&nbsp;</td>
		          <td width="53%" align="left" valign="middle">您的购物车为空！</td>
		      </tr>
			    <tr>
			      <td colspan="3" align="center" valign="middle"><input name="Button" type="button" class="btn_bg_long1" value="购买商品" onClick="window.location.href='index.jsp'"></td>
		      </tr>
              </table>              </td>
            </tr>
            
          </table>	  
	  
    </td>
        </tr>
    </table></td>
  </tr>
</table>
 <jsp:include page="copyright.jsp"/>
</body>
</html>