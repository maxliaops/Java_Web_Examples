<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.string.Str"%>
<%@ page import="com.bwm.db.Condb"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>未入库成果详单</title>
<style type="text/css">
<!--
.style1 {color: #CC9933}
-->
</style>
</head>
<link href="../css/style.css" rel="stylesheet">
<script language="javascript">
function check(){
form1.submit();}
</script>
<body>
<%
	Condb con=new Condb();
	Str str1=new Str();
	String temp=str1.toChinese(request.getParameter("temp"));
	String sql="select * from tb_Result where Resultname='"+temp+"'";
	ResultSet rs=con.executeQuery(sql);
	if(rs.next()){
%>
<br>
<table width="610" height="369" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder">
  <form action="Rcheck.jsp" method="post" name="form1">
    <tr align="center" bgcolor="#D1E2D6">
      <td height="26" colspan="3" bgcolor="#F7F3EF"><font color="#FFFFFF" face="黑体" size="+1">&nbsp;
      </font>
        <center class="style1">
          <font size="+1" face="黑体">未入库成果申报详单
          </font>      
        </center></td>
    </tr>
    <tr>
      <td width="59" height="23">&nbsp;</td>
      <td width="86" height="23">成果形式:</td>
      <td width="555" height="23"><font color="#0000CC"><%=rs.getString(1)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">成果名称:</td>
      <td height="23"><font color="#0000CC"><%String str=rs.getString(2);out.println(str);%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">研究领域:</td>
      <td height="23"><font color="#0000CC"><%=rs.getString(3)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">成果字数:</td>
      <td height="23"><font color="#0000CC"><%=rs.getString(4)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">研究分类:</td>
      <td height="23"><font color="#0000CC"><%=rs.getString(5)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">成果类型:</td>
      <td height="23"><font color="#0000CC"><%=rs.getString(6)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">成果语言:</td>
      <td height="23"><font color="#0000CC"><%=rs.getString(7)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">发表时间:</td>
      <td height="23"><font color="#0000CC"><%=rs.getDate(8)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">作者姓名:</td>
      <td height="23" align="left"><font color="#0000CC"><%=rs.getString(9)%></font></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="43">内容摘要:</td>
      <td height="43"><font color="#0000CC"><%=rs.getString(10)%></font></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="45">备注:</td>
      <td height="45"><font color="#0000CC"><%=rs.getString(11)%></font></td>
    </tr>
    <tr align="center">
      <td height="24">&nbsp;</td>
      <td height="24" align="left">是否入库:</td>
      <td height="24" align="left">
	  <input type="checkbox" name="choose" 
	  <%
		int pat=rs.getInt(12);
		if(pat==1)
		out.println("checked");%>
	 	onClick="check()">
        <input name="Numbic" type="hidden" value="<%=str%>">
是/否</td>
    </tr>
    <tr align="center" bgcolor="#F7F3EF">
	
      <td height="22" colspan="3"><a href="lackresult.jsp">返回</a></td>
    </tr>
	<%
	}else{
	%>	
  </form>
</table>
<%
}
con.close();
%>
</body>
</html>
