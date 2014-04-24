<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
ResultSet rs_type=conn.executeQuery("select ID,supertype from V_Type group by ID,supertype order by supertype");
int id=-1;
String typename="";
%>
<table width="186" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/search_bg_top.JPG" width="186" height="44"></td>
      </tr>
      <tr>
        <td height="100" background="images/search_bg_bottom.JPG">
<table width="100%" height="23"  border="0" align="center" cellpadding="0" cellspacing="0">
<form name="form2" method="post" action="search_deal.jsp">
<tr>
  <td colspan="2" height="7"></td>
  </tr>
<tr>
  <td width="85%" height="27" align="center">请输入查询条件：
	<select name="type" class="textarea">
	  <option value="0" selected>全部分类</option>
	  <%
	  while(rs_type.next()){
		  id=rs_type.getInt(1);
		  typename=rs_type.getString(2);%>
		  <option value="<%=id%>"><%=typename%></option>
	  <%}%>
	</select>	</td>
	<tr><td height="27" align="center">
	<input name="key" type="text" class="txt_grey" size="26">
</td>
	</tr>
  <td width="15%" height="36" align="right"><input name="search" type="submit" class="btn_bg_search" value="搜 索">
    &nbsp;&nbsp;&nbsp;</td>
</tr>
</form>
</table>
 </td>
      </tr>
    </table>
