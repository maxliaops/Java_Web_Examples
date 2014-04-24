<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
if (request.getParameter("ISBN")!=null){
	String ISBN=request.getParameter("ISBN");
	ResultSet rs=connDB.executeQuery("select * from tb_bookinfo where ISBN='"+ISBN+"'");
	String bookname="";
	String Type="";
	String TPI="";
	String author="";
	String intro="";
	String pDate="";
	String cover="";
	float price=0;
	String commend="";
	String newbook="";
	if(!rs.next()){
		out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='inde.jsp';</script>");
	}else{
		bookname=rs.getString("bookname");
		Type=rs.getString("Type");
		TPI=rs.getString("publisher");
		author=rs.getString("writer");
		intro=rs.getString("introduce");		
		price=rs.getFloat("Price");				
		pDate=rs.getString("pDate");
		cover=rs.getString("cover");
	    newbook=rs.getInt("newbook")==0 ? "否":"是";
	    commend=rs.getInt("commend")==0 ? "否":"是"; 
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
        <td height="30" align="center" bgcolor="#eeeeee">≡≡≡ <a href="index.jsp">图书管理</a> ≡≡≡</td>
      </tr>
    </table>
	<table width="100%" height="396"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" height="395" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="../Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">图书详细信息</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey"><ul>
                  <li> 书号：图书的ISBN，请务必输入正确，此项不能修改。</li>
                  <li>发行日期：请输入该书首次发行的日期，如2005年10月。</li>
                  <li>封面文件：请先将图书的封面文件保存到站点的manage\cover文件夹下，再输入文件名即可，包括扩展名，如：JSPxxxtkfaljx.jpg。</li>
                  <li>是否推荐：选择“是”该图书信息将显示在网站的首页中。</li>
                  <li>是否新书：选择“是”该图书信息将显示在“新书上架”中。</li>
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
                    <td width="14%" height="27">&nbsp;书　　号：</td>
                    <td height="27">&nbsp; <%=ISBN%>
</td>
                    <td height="27">&nbsp;书　　名：</td>
                    <td height="27">&nbsp;<%=bookname%>
                    </td>
                  </tr>
                  <tr>
                    <td height="27">&nbsp;作　　者：</td>
                    <td width="25%" height="27">&nbsp;<%=author%>
                    </td>
                    <td width="15%" height="27"> &nbsp;类别名称：</td>
                    <td width="46%" height="27">&nbsp;<%=Type%>
                    </td>
                  </tr>
                  <tr>
                    <td height="27">&nbsp;出&nbsp;版&nbsp;社：</td>
                    <td height="27">&nbsp;<%=TPI%>
                    </td>
                    <td height="27">&nbsp;发行日期：</td>
                    <td height="27">&nbsp;<%=pDate%>
                   </td>
                  </tr>
                  <tr>
                    <td height="41">&nbsp;封面文件：</td>
                    <td height="41">&nbsp;<%=cover%>
                    </td>
                    <td height="41">&nbsp;价　　格：</td>
                    <td height="41">&nbsp;<%=price%>
      (元)</td>
                  </tr>
                  <tr>
                    <td height="45">&nbsp;是否推荐：</td>
                    <td>&nbsp;<%=commend%></td>
                    <td>&nbsp;是否新书：</td>
                    <td><%=newbook%></td>
                  </tr>
                  <tr>
                    <td height="103">&nbsp;图书简介：</td>
                    <td colspan="3"><%=chStr.convertStr(intro)%></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="4" align="center">

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
	out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='inde.jsp';</script>");
}%>