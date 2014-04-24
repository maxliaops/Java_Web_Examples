<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<html>
<head>
<title>华奥汽车销售集团网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1" />
<jsp:useBean id="bottom" scope="session" class="cars.Bean3" />
<jsp:useBean id="rst" scope="session" class="cars.Pages" />
<%!
	String sql;
	String vari;
	int i;
	int pagecount;
	int pages;
	int nows;
	ResultSet rs;
%>
<link rel="stylesheet" href="Css/style.css">
<Script src="Js/PopMenu.js"></script>
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<body bgcolor="#ffffff" topmargin="0" leftmargin="0">
<table width="744" height="60" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="f9f9f9">
  <tr>
    <td><div align="center"><img src="Image/Fla.jpg" width="740" height="200"> </div></td>
  </tr>
</table>
<table width="744" height="526" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="526" valign="top"><%@ include file="Manage_Left.jsp" %>    </td>
    <td width="580" valign="top"><table width="580" height="564" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20" colspan="2">&nbsp;管理中心</td>
      </tr>
      <tr>
        <td height="544" colspan="2" valign="middle"><div align="center">
          <table width="492" height="490" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="50" colspan="2"><div align="center">集 团 信 息 管 理</div></td>
            </tr>
            <form name="form3" method="post" action="About_Update.jsp?action=future">
              <tr>
                <td width="463" height="20" valign="bottom" bgcolor="#efefef" class="bottm">&nbsp;&nbsp;未来展望</td>
                <td width="59" height="20" valign="bottom" bgcolor="#efefef" class="bottm">
                  <div align="right">
                    <input name="Submit" type="submit" class="buttons" value="更新">
                </div></td>
              </tr>
              <tr>
                <td height="200" colspan="2" valign="middle">

                  <textarea name="content" cols="80" rows="13" class="wenbenkuang" id="content">                 
				   <%
sql="select * from tb_News where Title='未来展望'";
rs=data.getrs(sql);
rs.beforeFirst();
if(rs.next()){
%><%=rs.getString("Content")%>                  
<%}
				data.close();
				%></textarea>

                </td>
              </tr>
            </form>
            <form name="form4" method="post" action="About_Update.jsp?action=history">
              <tr>
                <td height="20" valign="bottom" bgcolor="#efefef" class="bottm">&nbsp;&nbsp;历史回顾</td>
                <td valign="bottom" bgcolor="#efefef" class="bottm">
                  <div align="right">
                    <input name="Submit2" type="submit" class="buttons" value="更新">
                </div></td>
              </tr>
              <tr><td height="200" colspan="2" valign="middle">

                  <textarea name="content" cols="80" rows="13" class="wenbenkuang" id="content">                
                  <%
sql="select * from tb_News where Title='历史回顾'";
rs=data.getrs(sql);
rs.beforeFirst();
if(rs.next()){
%><%=rs.getString("Content")%>                  <%}
				data.close();%></textarea>

                </td>
              </tr>
            </form>
          </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="744" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center">汽车厂商标志</div></td>
  </tr>
</table>
<table width="744" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center">
      <p><%=bottom.seturl("吉林省长春市明日科技有限公司","www.mingrisoft.com")%> <a style="color:#000000;" href="Exit.jsp">管理出口</a><%=bottom.setnumbers("0431-4972266")%><br>
        <%=bottom.setemail("mingrisoft@mingrisoft.com")%><br>
        Copyright &copy; 2005-2008</p>
    </div></td>
  </tr>
</table>
</body>
</html>
