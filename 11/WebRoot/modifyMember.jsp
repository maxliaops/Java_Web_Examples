<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/><%
String username=(String)session.getAttribute("username");
if(username!=null && username!=""){
	String sql="select * from tb_member where username='"+username+"'";
	ResultSet rs=conn.executeQuery(sql);
	int id=-1;
	String truename="";
	String PWD="";
	String city="";
	String address="";
	String postcode="";
	String cardNO="";
	String cardType="";
	String tel="";
	String email="";
	if(rs.next()){
		id=rs.getInt(1);
		truename=rs.getString(3);
		PWD=rs.getString(4);
		city=rs.getString(5);
		address=rs.getString(6);
		postcode=rs.getString(7);
		cardNO=rs.getString(8);
		cardType=rs.getString(9);
		tel=rs.getString(12);
		email=rs.getString(13);		
	}
%>
<html>
<head>
<title>MR网络购物中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<script src="JS/check.js"></script>
</head>
<body>
<jsp:include page="navigation.jsp"/>
<jsp:include page="login_u.jsp"/>
<jsp:include page="ad.jsp"/>
<table width="788" height="236"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="193" height="182" valign="top" bgcolor="#FFFFFF">
	<jsp:include page="search.jsp"/>
    <jsp:include page="goodsType.jsp"/>
	</td>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="45" valign="top" background="images/sub_memberModify.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="top">&nbsp;</td>
        </tr>
            <tr valign="top">
              <td height="134" align="center">
		  <form action="modifyMember_deal.jsp" method="post" name="myform">
		  <table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="18%" height="30" align="center">用 户 名：</td>
              <td width="82%" class="word_grey"><input name="username" type="text" value="<%=username%>" maxlength="20">
                <span class="word_orange">(用户名不可修改)
                <input name="ID" type="hidden" value="<%=id%>">
                </span></td>
            </tr>
            <tr>
              <td height="2" align="center">真实姓名：</td>
              <td height="28"><input name="truename" type="text" value="<%=truename%>" maxlength="10">
                <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="28" align="center"> 原 密 码：</td>
              <td height="28"><input name="oldpwd" type="password" size="20" maxlength="20">                  
                <input name="holdpwd" type="hidden" value="<%=PWD%>"></td></tr>
            <tr>
              <td height="28" align="center">新 密&nbsp;码：</td>
              <td height="28"><input name="pwd" type="password" size="20" maxlength="20">
                <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="28" align="center">确认新密码：</td>
              <td height="28"><input name="pwd1" type="password" size="20" maxlength="20">
                <span class="word_orange">*</span> </td>
            </tr>
            <tr>
              <td height="28" align="center">所在城市：</td>
              <td><input name="city" type="text" value="<%=city%>"></td>
            </tr>
            <tr>
              <td height="28" align="center">联系地址：</td>
              <td class="word_grey"><input name="address" type="text" value="<%=address%>"size="50"></td>
            </tr>
            <tr>
              <td height="28" align="center">邮政编码：</td>
              <td class="word_grey"><input name="postcode" type="text" value="<%=postcode%>" size="20"></td>
            </tr>
            <tr>
              <td height="28" align="center">证件号码：</td>
              <td><input name="cardno" type="text" value="<%=cardNO%>">
              <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="28" align="center">证件类别：</td>
              <td><input name="cardtype" type="radio" class="noborder" value="身份证" <%if(cardType.equals("身份证")) out.print("checked");%>>
      身份证&nbsp;
      <input name="cardtype" type="radio" class="noborder" value="军官证" <%if(cardType.equals("军官证")) out.print("checked");%>>
      军官证
      <input name="cardtype" type="radio" class="noborder" value="学生证" <%if(cardType.equals("学生证")) out.print("checked");%>>
      学生证</td>
            </tr>
            <tr>
              <td height="28" align="center">联系电话：</td>
              <td><input name="tel" type="text" value="<%=tel%>"></td>
            </tr>
            <tr>
              <td height="28" align="center" style="padding-left:10px">Email：</td>
              <td class="word_grey"><input name="email" type="text" value="<%=email%>" size="50">
                <span class="word_orange">*</span></td>
            </tr>

            <tr>
              <td height="34">&nbsp;</td>
              <td class="word_grey"><input name="Button" type="button" class="btn_bg_long1" value="确定保存" onClick="check_modi()">
                  <input name="Submit2" type="reset" class="btn_bg_long1" value="重新填写">
                  <input name="Submit22" type="button" class="btn_bg_short" value="返回" onClick="window.location.href='index.jsp'">
              </td>
            </tr>
          </table>
		  </form>
	  
	  
	  </td>
        </tr>
    </table></td>
  </tr>
</table>
 <jsp:include page="copyright.jsp"/>
</body>
</html>
<%conn.close();
}else{
	out.println("<script lanage='javascript'>alert('请先登录，再修改个人信息!');window.location.href='index.jsp';</script>");
}%>
