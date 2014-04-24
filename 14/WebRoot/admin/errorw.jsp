<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>用户登录</title>
</head>
<link href="css/admin.css" rel="stylesheet" type="text/css">
<script src="js/validate.js"></script>
<body> 
<table width="550" height="400" border="0" cellpadding="0" cellspacing="0"> 
  <tr> 
    <td height="50" align="left" ><h1>error</h1></td> 
  </tr>
  <tr>
    <td align="center" valign="middle" class="Redfont">
	<%        String error=session.getAttribute("error").toString();
        if(error!=null){
            out.print(error);
        }else{
            out.print("未知错误！！！");
        }%></td>
  </tr>
  <tr>
    <td height="50" align="center" valign="middle"><a style="cursor:hand" onClick="javascript:history.back();" class="delink">返回上页</a>&nbsp;&nbsp;<a style="cursor:hand" onClick="javascrip:window.close();" class="delink">关闭窗口</a></td>
  </tr> 
</table> 
</body>
</html>
