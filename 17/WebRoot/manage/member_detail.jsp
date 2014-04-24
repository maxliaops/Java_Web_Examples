<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
if (request.getParameter("ID")!=null){
	int ID=Integer.parseInt(request.getParameter("ID"));
	ResultSet rs=connDB.executeQuery("select * from tb_member where ID="+ID);
	String username="";
	String Truename="";
	String city="";
	String address="";
	String postcode="";
	String CardNO="";
	String CardType="";	  
	float Amount=0;
	String Tel="";
	String Email=""; 
	if(!rs.next()){
		out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='memberManage.jsp';</script>");
	}else{
		username=rs.getString("username");
		Truename=rs.getString("Truename");
		city=rs.getString("city");
		address=rs.getString("address");
		postcode=rs.getString("postcode");
		CardNO=rs.getString("CardNO");
		CardType=rs.getString("CardType");	  
		Amount=rs.getFloat("Amount");
		Tel=rs.getString("Tel");	
		Email=rs.getString("Email");	 
	}
%>
<html>
<head>
<title>网上书店</title>
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
        <td height="30" align="center" bgcolor="#eeeeee">≡≡≡ 会员管理 ≡≡≡</td>
      </tr>
    </table>
	<table width="100%" height="396"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" height="395" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="../Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">会员详细信息</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey" style="line-height:200%;"><ul>
                  <li>会员信息冻结/解冻：会员信息可以被冻结或解冻，但不可以添加、修改和删除。</li>
                  <li>会员信息查看：可以查看会员的基本信息，但不可以查看会员密码。</li>
                  </ul></td>
            </tr>
            <tr align="center">
              <td colspan="2" valign="middle" class="word_grey"></td>
            </tr>
          </table></td>
          <td width="5" valign="top" background="../Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="56"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">&nbsp;</td>
            </tr>
            <tr>
              <td align="center">
			  <form action="book_modify_deal.jsp" method="post" name="form1">
			    <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="19%" height="27" align="center">&nbsp;用 户 名：</td>
                    <td height="13"> &nbsp;<%=username%>                    </td>
                    </tr>
                  <tr>
                    <td height="27" align="center">&nbsp;真实姓名：</td>
                    <td height="14">&nbsp;<%=Truename%></td>
                    </tr>
                  <tr>
                    <td height="27" align="center">&nbsp;城&nbsp;&nbsp;&nbsp;&nbsp;市：</td>
                    <td>&nbsp;<%=city%>
                    </td>
                    </tr>
                  <tr>
                    <td height="27" align="center">&nbsp;地&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
                    <td height="14">&nbsp;<%=address%></td>
                    </tr>
                  <tr>
                    <td height="27" align="center">&nbsp;邮政编码：</td>
                    <td width="81%" height="27">&nbsp;<%=postcode%>
                    </td>
                    </tr>
                  <tr>
                    <td height="27" align="center">&nbsp;证件类型：</td>
                    <td height="14">&nbsp;<%=CardType%> </td>
                    </tr>
                  <tr>
                    <td height="27" align="center">&nbsp;证件号码：</td>
                    <td>&nbsp;<%=CardNO%>
                    </td>
                    </tr>
                  <tr>
                    <td height="27" align="center">&nbsp;电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
                    <td>&nbsp;<%=Tel%></td>
                    </tr>
                  <tr>
                    <td height="27" align="center">&nbsp;Email：</td>
                    <td>&nbsp;<%=Email%></td>
                    </tr>
                  <tr>
                    <td height="27" align="center">&nbsp;消 费 额：</td>
                    <td>&nbsp;<%=Amount%> (元)</td>
                    </tr>
                  <tr>
                    <td height="38" colspan="2" align="center">

                        <input name="Submit3" type="button" class="btn_grey" value="返回" onClick="JScript:history.back()">                    </td>
                  </tr>
                </table>
			  </form>
			  </td>
            </tr>
          </table></td>
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
<%
}else{
	out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='index.jsp';</script>");
}%>