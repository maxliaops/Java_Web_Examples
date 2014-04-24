<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>留言版</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>

<body>
<table width="777" height="411" border="0" cellpadding="-2" cellspacing="-2">
  <tr>
    <td valign="top"><table width="777" height="94" border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <td height="94" valign="top" background="Images/top_01.gif">
		<table width="100%" height="25"  border="0" cellpadding="-2" cellspacing="-2">
          <tr>
            <td valign="top" background="Images/default_01.gif">
						<table width="100%" height="25"  border="0" cellpadding="-2" cellspacing="-2">
               <tr>
                <td height="6" colspan="11"></td>
                </tr>
			  <tr>
                <td width="2%" height="19">&nbsp;</td>
                <td width="10%"><div align="center"><a href="default.asp" class="shadow">| 首页 |</a></div></td>   
                <td width="10%" valign="middle"><div align="center"><a href="#" class="shadow">| 公司介绍 |</a></div></td>   
                <td width="10%" valign="middle"><div align="center"><a href="news.jsp" class="shadow">| 新闻动态 |</a></div></td>   
				<td width="10%" valign="middle"><div align="center"><a href="productusher.jsp" class="shadow">| 产品展示 |</a></div></td>   
                <td width="10%" valign="middle"><div align="center"><a href="Teaching.asp" class="shadow">| 公司荣誉 |</a></div></td>   
                <td width="10%" valign="middle"><div align="center"><a href="#" class="shadow">| 加盟我们 |</a></div></td>   
                <td width="10%" valign="middle"><div align="center"><a href="mess.jsp" class="shadow" onClick="">| 联系我们 |</a></div></td>   

                <td width="2%">&nbsp;</td>
              </tr>
            </table>
            </td>
          </tr>

<table width="588" height="100" border="0" cellpadding="-2" cellspacing="-2" background="Images/bbs_detail_01.gif">
  <tr>
    <td valign="top"><table width="100%" height="51"  border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <td width="61%">&nbsp;</td>
        <td width="39%" valign="bottom"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="221" height="46">
          <param name="movie" value="Flash/banner_bbs.swf">
          <param name="quality" value="high">
          <param name="wmode" value="transparent">
          <embed src="Flash/banner_bbs.swf" width="221" height="46" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
        </object></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="588" height="314" border="0" cellpadding="-2" cellspacing="-2" background="Images/bbs_detail_02.gif">
  <tr>
    <td valign="top">
	<table width="100%" height="40"  border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <td width="5%" height="48">&nbsp;</td>
        <td width="95%" colspan="5"><img src="Images/register.gif" width="519" height="30"></td>
        </tr>
    </table>
	<table width="100%" height="231"  border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <td width="11%" height="231">&nbsp;</td>
        <td colspan="5" valign="top">
        <form method="POST" action="mess_add.jsp">
  <p>留言版：</p>
  <p>&nbsp;&nbsp;&nbsp;&nbsp; 您的姓名：<input type="text" name="mname" size="20"></p>   
  <input type="hidden" name="pageaction" value="create">
  <input type="hidden" name="responsepage" value="mess.jsp">
  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 主题：<input type="text" name="mtext" size="20"></p>   
  <p>&nbsp;&nbsp;&nbsp;&nbsp; 留言内容：<textarea rows="2" name="mnote" cols="20"></textarea></p>   
  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="提交" name="B1">&nbsp;&nbsp;  
  <input type="reset" value="全部重写" name="B2"></p>
</form>

		</td>
        <td width="10%" valign="top">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
