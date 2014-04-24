<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
ResultSet rs=connDB.executeQuery("select * from tb_poll");
%>
<html>
<head>
<title>网上图书超市</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
<script src="../JS/check.jsp"></script>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" background="../Images/bg.gif">
  <tr>
    <td>
<table width="777" height="609"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top">
	<jsp:include page="Top.jsp"/>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="tableBorder_LTR">
      <tr>
        <td height="30" align="center" bgcolor="#eeeeee">≡≡≡ <span class="word_grey"><a href="poll_add.jsp">添加投票项目信息</a></span> ≡≡≡</td>
      </tr>
    </table>
	<table width="100%" height="396"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" height="395" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="../Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">投票管理</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey"><ul><li>投票项目不可修改，只可添加和删除项目。</li>
                <li> 添加投票项目：点击“添加投票项目信息”超链接可以进行投票项目的添加。</li>
                <li>删除投票项目：点击每条投票项目信息后面的“删除”按钮可以删除投票项目。</li>
                </ul></td>
            </tr>
            <tr align="center">
              <td colspan="2" valign="middle" class="word_grey"></td>
            </tr>
          </table></td>
          <td width="5" valign="top" background="../Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="13" align="center">&nbsp;</td>
            </tr>
          </table>
            <table width="100%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
              <tr>
                <td height="27" align="center">投票项目</td>
                <td align="center">票数</td>
                <td width="6%" align="center">删除</td>
              </tr>
<%
int ID=0;
String optionName="";
int poll=0;
while(rs.next()){
	ID=rs.getInt("ID");
	optionName=rs.getString("optionName");
	poll=rs.getInt("poll");
%>
              <tr style="padding:5px;">
                <td height="24" align="center"><%=optionName%></td>
                <td height="24" align="center"><%=poll%></td>
                <td align="center"><a href="poll_del.jsp?ID=<%=ID%>"><img src="../Images/del.gif" width="16" height="16"></a></td>
              </tr>
<%
}
%>
            </table>
		</td>
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
