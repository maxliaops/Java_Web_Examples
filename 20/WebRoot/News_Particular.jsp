<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*" %>
<html>
<head>
</head>
<%!
String sql;
String title;
String content;
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="Css/style.css">
<body topmargin="0" leftmargin="0">
<jsp:useBean id="data" scope="session" class="cars.Bean1" />
<%
sql="select * from tb_News where ID="+Integer.parseInt(request.getParameter("id"));
ResultSet rs=data.getrs(sql);
rs.beforeFirst();
	if(rs.next()){
%>
<table width="500" height="560" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="#006699" class="table">
  <tr>
    <td valign="top"><table width="480" height="550" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40" align="center" nowrap><div align="center" class="bottm" style="font-size: 16px;color: #F9f9f9;font-weight: bold;width:400;">
		  <%=rs.getString("Title") %>
		  </div></td>
        </tr>
        <form name="orderform" method="post" action="OrderForm.jsp">
          <tr>
            <td valign="top">
              <table width="480" height="510" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="470" colspan="4" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
		out.write(rs.getString("Content"));
	}
  %>		  </td>
                </tr>
                <tr>
                  <td height="30" colspan="4" valign="bottom"><div align="center">
                    <input name="Submit" type="button" class="buttons" value="  [  关  闭  窗  口  ]  " onClick="javascript:window.close();">
                  </div></td>
                </tr>
            </table></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
<div id="Layer1" style="position:absolute; width:459px; height:293px; z-index:1; left: 10px; top: 0px;">
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="479" height="538">
    <param name="movie" value="Image/fish.swf">
    <param name="quality" value="high">
	<param name='wmode' value='transparent'>
    <embed src="Image/fish.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="479" height="538"></embed>
  </object>
</div>
</body>
</html>
