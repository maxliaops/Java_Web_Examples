<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
ResultSet rs=connDB.executeQuery("select * from tb_bookinfo order by INTime Desc");
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
        <td height="30" align="center" bgcolor="#eeeeee">≡≡≡ <span class="word_grey"><a href="book_add.jsp">添加图书信息</a></span> ≡≡≡</td>
      </tr>
    </table>
	<table width="100%" height="396"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" height="395" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="../Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">图书管理</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey"><ul>
                <li> 添加图书信息：点击“添加图书信息”超链接可以进行图书信息的添加。</li>
                <li>修改图书信息：点击每条图书信息后面的“修改”按钮可以修改图书信息。</li>
                <li>删除图书信息：点击每条图书信息后面的“删除”按钮可以删除图书信息。</li>
                <li>推荐图书：如果想推荐图书，可以点击指定图书后的“修改”按钮。</li>
                <li>是否新书：如果想将图书信息发布到新书上架中，可以点击指定图书后的“修改”按钮。</li>
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
                <td width="18%" height="27" align="center">
                  书号</td>
                <td width="36%" align="center">名称</td>
                <td width="20%" align="center">出版社</td>
                <td width="8%" align="center">新书否</td>
                <td width="8%" align="center">推荐否</td>
                <td width="5%" align="center">修改</td>
                <td width="5%" align="center">删除</td>
              </tr>
<%
String str=(String)request.getParameter("Page");
if(str==null){
	str="0";
}
int pagesize=10;
rs.last();
int RecordCount=rs.getRow(); 
//out.println(String.valueOf(RecordCount));
int maxPage=0;
maxPage=(RecordCount%pagesize==0)?(RecordCount/pagesize):(RecordCount/pagesize+1);

int Page=Integer.parseInt(str);
if(Page<1){
	Page=1;
}else{
	if(Page>maxPage){
		Page=maxPage;
	}
}
rs.absolute((Page-1)*pagesize+1);
for(int i=1;i<=pagesize;i++){
	  String ISBN=rs.getString("ISBN");
	  String BookName=rs.getString("BookName");
	  String publisher=rs.getString("publisher");
	  String newbook=rs.getInt("newbook")==0 ? "否":"是";
	  String commend=rs.getInt("commend")==0 ? "否":"是"; 
	  %>

              <tr style="padding:5px;">
                <td height="24" align="center"><%=ISBN%></td>
                <td align="center"><a href="book_detail.jsp?ISBN=<%=ISBN%>"><%=BookName%></a></td>
                <td align="center"><%=publisher%></td>
                <td align="center"><%=newbook%></td>
                <td align="center"><%=commend%></td>
                <td align="center"><a href="book_modify.jsp?ISBN=<%=ISBN%>"><img src="../Images/modify.gif" width="15" height="15"></a></td>
                <td align="center"><a href="book_del.jsp?ISBN=<%=ISBN%>"><img src="../Images/del.gif" width="16" height="16"></a></td>
              </tr>
<%
	try{
		if(!rs.next()){break;}
		}catch(Exception e){}
}
%>
            </table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="right">当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
	<%if(Page>1){%>
	<a href="index.jsp?Page=1">第一页</a>　<a href="index.jsp?Page=<%=Page-1%>">上一页</a>
	<%
	}
	if(Page<maxPage){
	%>
	　<a href="index.jsp?Page=<%=Page+1%>">下一页</a>　<a href="index.jsp?Page=<%=maxPage%>">最后一页&nbsp;</a>
	<%}
	%>
	</td>
  </tr>
</table>			</td>
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
