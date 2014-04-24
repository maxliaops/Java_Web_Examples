<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<html>
<% request.setCharacterEncoding("gb2312");%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
<title>新闻信息修改</title>
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1"></jsp:useBean>
<link rel="stylesheet" href="Css/style.css">
<body topmargin="0" leftmargin="0">
<%!
	String sql;
	int i,id;
	String content;
%>
<% if(request.getParameter("action")!=null){
	id=Integer.parseInt(request.getParameter("id"));
	content=request.getParameter("content");
	sql="update tb_News set Content='"+content+"' where ID="+id;
	i=data.getint(sql);
	if(i>0){
%>
	<script language="javascript">
		alert("新闻信息修改成功");
		window.close();
	</script>
<%
	}
}
data.close();
%>
<table width="500" height="270" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#A7B5CE" class="table">
  <tr>
    <td valign="top"><table width="480" height="270" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:160;">新 闻 信 息 修 改</div></td>
        </tr>
        <form name="orderform" method="post" action="New_Change.jsp?action=add">
          <tr>
            <td valign="top">
		<%
 sql="select * from tb_News where ID="+Integer.parseInt(request.getParameter("id"));
ResultSet rs=data.getrs(sql);
rs.beforeFirst();
if(rs.next()){
 %>
              <table width="480" height="227" border="0" cellpadding="0" cellspacing="0">
                <tr valign="bottom">
                  <td height="30"><div align="right">新闻类别：</div></td>
                  <td width="390" height="30"><input name="type" type="text" class="wenbenkuang" id="type" size="20" value="<%=rs.getString("Type")%>" readonly="yes">
                  <input name="id" type="hidden" id="id" value="<%=rs.getInt("ID")%>"> </td>
                </tr>
                <tr valign="bottom">
                  <td width="90" height="30"><div align="right">新闻标题：</div></td>
                  <td height="30">
                    <input name="title" type="text" class="wenbenkuang" id="title" size="50" value="<%=rs.getString("Title")%>" readonly="yes">
                  </td>
                </tr>
                <tr valign="bottom">
                  <td width="90" height="30"><div align="right">新闻内容：</div>                    <div align="right"></div></td>
                  <td height="100" rowspan="3"><div align="left">
                      </div>
                    <textarea name="content" cols="60" rows="6" class="wenbenkuang" id="content"><%=rs.getString("Content")%></textarea>                  </td>
                </tr>
                <tr valign="bottom">
                  <td height="30">&nbsp;</td>
                </tr>
                <tr valign="bottom">
                  <td height="47">&nbsp;</td>
                </tr>
                <tr valign="bottom">
                  <td height="30" colspan="2">
                    <div align="center">
                      <input name="Submit2" type="submit" class="buttons" value="  修  改  ">
                      <input name="Submit" type="reset" class="buttons" value="  重  置  ">
                      <input name="Submit3" type="button" class="buttons" value="  返  回  " onClick="javascript:window.close()">
                  </div></td>
                </tr>
                <tr valign="bottom">
                  <td height="30" colspan="2"><div align="center" style="color: #FF0000 ">吉林省长春市华奥汽车销售集团公司 24小时客户服务热线：xxxx-xxxxxxx</div></td>
                </tr>
            </table>
<%}
data.close();
%>
</td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
</body>
</html>
