<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
if (request.getParameter("ID")!=null){
	int ID=Integer.parseInt(request.getParameter("ID"));
	ResultSet rs=conn.executeQuery("select * from tb_member where ID="+ID);
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
		out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='membermanage.jsp';</script>");
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
<title>MR网络购物中心——后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
<script src="onclock.JS"></script>
</head>
<body> 
<jsp:include page="banner.jsp"/>
<table width="788" height="288"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>

    <td align="center" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="right">&nbsp;</td>
        <td height="10" colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="29" align="right">&nbsp;</td>
        <td width="19" background="../images/manage_leftTitle_left.GIF">&nbsp;</td>
        <td width="588" align="center" background="../images/manage_leftTitle_mid.GIF" class="word_white"><b>会员详细信息</b></td>
        <td width="20" background="../images/manage_leftTitle_right.GIF">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
	<!---->
   <table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="13" align="center">&nbsp;</td>
            </tr>
          </table>
             <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
                  <tr>
                    <td width="19%" height="27" align="center" class="tableBorder_B_dashed">&nbsp;用 户 名：</td>
                    <td height="13" class="tableBorder_B_dashed"> &nbsp;<%=username%>                    </td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;真实姓名：</td>
                    <td height="14" class="tableBorder_B_dashed">&nbsp;<%=Truename%></td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;城&nbsp;&nbsp;&nbsp;&nbsp;市：</td>
                    <td class="tableBorder_B_dashed">&nbsp;<%=city%>
                    </td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;地&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
                    <td height="14" class="tableBorder_B_dashed">&nbsp;<%=address%></td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;邮政编码：</td>
                    <td width="81%" height="27" class="tableBorder_B_dashed">&nbsp;<%=postcode%>
                    </td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;证件类型：</td>
                    <td height="14" class="tableBorder_B_dashed">&nbsp;<%=CardType%> </td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;证件号码：</td>
                    <td class="tableBorder_B_dashed">&nbsp;<%=CardNO%>
                    </td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
                    <td class="tableBorder_B_dashed">&nbsp;<%=Tel%></td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;Email：</td>
                    <td class="tableBorder_B_dashed">&nbsp;<%=Email%></td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;消 费 额：</td>
                    <td class="tableBorder_B_dashed">&nbsp;<%=Amount%> (元)</td>
                    </tr>
                  <tr>
                    <td height="38" colspan="2" align="center">

                        <input name="Submit3" type="button" class="btn_bg_short" value="返回" onClick="JScript:history.back()">                    </td>
                  </tr>
                </table>
	 <!----> 
</td>
	  
	      <td width="182" valign="top"><table width="100%" height="431"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="199" valign="top" bgcolor="#FFFFFF"><jsp:include page="navigation.jsp"/></td>
      </tr>
    </table></td>	  
  </tr>
</table>
<jsp:include page="copyright.jsp"/>
</body>
</html>
<%
}else{
	out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='index.jsp';</script>");
}%>