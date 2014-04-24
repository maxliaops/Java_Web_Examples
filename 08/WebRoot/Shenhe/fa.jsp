<%@ page language="java" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
  <title>发布申请</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
	
<body>
<style type="text/css">
<!--
  @import url("table.css");
  @import url("biaodan.css");
  body,td,th {
	 font-size: 12px;
 }
 body {
	background-color: #ffffff;
	margin-left: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
  }
  .style4 {
	font-size: 16px;
	font-weight: bold;
	color: #FFFFFF;
 } 
 .style6 {
	font-size: 9pt;
	color: #000000;
 }
  -->
</style>
<body background="../Images/main_center.jpg">
<table width="801" height="518" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="801" height="518" valign="top"><table width="71%" height="84%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
		<form name="form1" method="post" action="fa_add.jsp">
  <table width="695" height="415" border="0" align="center" cellpadding="0" cellspacing="0"  >
    <tr align="left">
      <td height="25" width="100%" colspan="2">
        <table width="801" border="0" background="../Images/main_top.JPG">
          <tr>
           <td width="25" height="38"></td>
            <td width="518" valign="bottom"><span class="style6"><b>发布申请</b></span></td>
          </tr>
        </table>
        <span class="style4"><br>
        </span></td>
    </tr>
    <tr>
      <td width="57" height="33"><div align="right">标题：</div></td>
      <td width="618"> 
        <input name="title" type="text" class="unnamed1" id="title" size="50">
      <input name="post" type="hidden" id="post" value="true"></td>
    </tr>
    <tr>
      <td width="57" height="113" valign="top" ><div align="right">内容：</div></td>
      <td> 
      <textarea name="content" cols="76" rows="20" id="content" class="unnamed1"></textarea></td>
    </tr>
    <tr>
      <td height="35" colspan="2"><div align="center">
        <input name="Submit" type="submit" class="btn_grey" value="提交">
        　<input name="Submit2" type="reset" class="btn_grey" value="重置">
      </div></td>
    </tr>
  </table>
</form>
</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>




