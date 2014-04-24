<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<html>
<% request.setCharacterEncoding("gb2312");%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
<title>新闻信息添加</title>
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1"></jsp:useBean>
<link rel="stylesheet" href="Css/style.css">
<body topmargin="0" leftmargin="0">
<%!
	String sql;
	int years,months,days;
	int i,j;
	ResultSet rs;
	String type;
	String title;
	String content;
	java.util.Date today;
%>
<% if(request.getParameter("action")!=null){
	type=request.getParameter("type");
	title=request.getParameter("title");
	content=request.getParameter("content");
	sql="select * from tb_News where Title='"+title+"' and Content='"+content+"' and Type='"+type+"'";
	rs=data.getrs(sql);
	rs.beforeFirst();
	if(rs.next()){
	data.close();
%>
<script language="javascript">alert("相同新闻已经存在");history.back();</script>
<%
	}
	else{
	data.close();
	today=new java.util.Date();
	years=today.getYear();
	months=today.getMonth();
	days=today.getDate();
	java.sql.Date dates=new java.sql.Date(years,months,days);
	sql="insert into tb_News values('"+title+"','"+content+"','"+dates+"','"+type+"')";
	i=data.getint(sql);
	if(i>0){
%>
	<script language="javascript">
		alert("新闻信息添加成功");
		window.close();
		opener.location.reload();
	</script>
<%
	}
}
data.close();
}
%>
<table width="500" height="270" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#A7B5CE" class="table">
  <tr>
    <td valign="top"><table width="480" height="270" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:160;">新 闻 信 息 添 加</div></td>
        </tr>
        <form name="orderform" method="post" action="New_Add.jsp?action=add">
          <tr>
            <td valign="top">
              <table width="480" height="227" border="0" cellpadding="0" cellspacing="0">
                <tr valign="bottom">
                  <td height="30"><div align="right">新闻类别：</div></td>
                  <td width="390" height="30"><select name="type" class="wenbenkuang" id="type">
                    <option value="新闻报道" selected>新闻报道</option>
                    <option value="新车报道">新车报道</option>
                    <option value="集团动向">集团动向</option>
                    <option value="站内公告">站内公告</option>
                  </select></td>
                </tr>
                <tr valign="bottom">
                  <td width="90" height="30"><div align="right">新闻标题：</div></td>
                  <td height="30">
                    <input name="title" type="text" class="wenbenkuang" id="title" size="50">
                  </td>
                </tr>
                <tr valign="bottom">
                  <td width="90" height="30"><div align="right">新闻内容：</div>                    <div align="right"></div></td>
                  <td height="100" rowspan="3"><div align="left">
                      </div>
                    <textarea name="content" cols="60" rows="6" class="wenbenkuang" id="content"></textarea>                  </td>
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
                      <input name="Submit2" type="submit" class="buttons" value="  添  加  ">
                      <input name="Submit" type="reset" class="buttons" value="  重  置  ">
                      <input name="Submit3" type="button" class="buttons" value="  返  回  " onClick="javascript:window.close()">
                  </div></td>
                </tr>
                <tr valign="bottom">
                  <td height="30" colspan="2"><div align="center" style="color: #FF0000 ">吉林省长春市华奥汽车销售集团公司 24小时客户服务热线：xxxx-xxxxxxx</div></td>
                </tr>
            </table></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
</body>
</html>
