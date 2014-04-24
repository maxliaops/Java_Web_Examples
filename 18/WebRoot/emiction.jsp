<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%
 String Ayear = ParamUtils.getEscapeHTMLParameter(request, "Ayear","2000");
 String Amonth = ParamUtils.getEscapeHTMLParameter(request, "Amonth","01");
 String Aday = ParamUtils.getEscapeHTMLParameter(request, "Aday","01");
 String Byear = ParamUtils.getEscapeHTMLParameter(request, "Byear","2000");
 String Bmonth = ParamUtils.getEscapeHTMLParameter(request, "Bmonth","01");
 String Bday = ParamUtils.getEscapeHTMLParameter(request, "Bday","01");
 String Atime=Ayear+Amonth+Aday;
 String Btime=Byear+Bmonth+Bday;
 int Proid = ParamUtils.getIntParameter(request, "Proid",-1);
 String sql="";
 if(Proid==-1){
         sql=" SELECT SUM(PRONUMBER)AS PRONUMBER,SHOPID FROM SELL WHERE PTIME BETWEEN '"+Atime+"' AND '" +Btime+"' GROUP BY SHOPID  ORDER BY PRONUMBER DESC";
 }else{
         sql=" SELECT SUM(PRONUMBER)AS PRONUMBER,SHOPID FROM SELL WHERE PTIME BETWEEN '"+Atime+"' AND '" +Btime+"' AND PRODUCTID=" + Proid + " GROUP BY SHOPID ORDER BY PRONUMBER DESC";
     }
	int i=0;
  	shop pt=(shop)session.getAttribute("USERPO");
    if(pt==null){
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head>
<title>销售排行</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>
<body>
<table width="777" height="172"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="Images/tiring-room/tiring-room_01.gif" width="777" height="125"></td>
      </tr>
      <tr>
        <td height="47" valign="top" background="Images/tiring-room/tiring-room_02.gif"><jsp:include page="H_navigation.jsp"/></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="44" height="380" valign="top"><img src="Images/tiring-room/tiring-room_03.gif" width="44" height="248"></td>
    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="68" colspan="2" background="Images/tiring-room/h_sort.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
<table width="100%" border="0" cellspacing="-2" cellpadding="-2" height="30">
                    <tr>
                      <td width="87%">
                        <form method="POST" action="emiction.jsp" name="form1">
                          <table border="0" width="100%">
                            <tr>
                              <td width="52%" align="center">售货日期
                                  <select size="1" name="Ayear">
								  <%for(i=2000;i<2015;i++){
								  out.print("<option value="+i+">"+i+"</option>");}%>
                                  </select>
                                  年
                                  <select size="1" name="Amonth">
								  <%String a;
								  for(i=1;i<13;i++){
								  if(i<10){a="0"+String.valueOf(i);}else{a=String.valueOf(i);}
								  out.print("<option value="+a+">"+a+"</option>");
								  }%>
                                  </select>
                                  月
                                  <select size="1" name="Aday">
								  <%for(i=1;i<32;i++){
								  a="";
								  if(i<10){a="0"+String.valueOf(i);}else{a=String.valueOf(i);}
								  out.print("<option value="+a+">"+a+"</option>");}%>
                                  </select>
                                日</td>
                              <td width="48%">至
                                  <select size="1" name="Byear">
								  <%for(i=2000;i<2015;i++){out.print("<option value="+i+">"+i+"</option>");}%>
                                  </select>
                                  年
                                  <select size="1" name="Bmonth">
								  <%
								  for(i=1;i<13;i++){
								  a="";
								  if(i<10){a="0"+String.valueOf(i);}else{a=String.valueOf(i);}
								  out.print("<option value="+a+">"+a+"</option>");}%>
                                  </select>
                                  月
                                  <select size="1" name="Bday">
								  <%
								  for(i=1;i<32;i++){
								  a="";
								  if(i<10){a="0"+String.valueOf(i);}else{a=String.valueOf(i);}
								  out.print("<option value="+a+">"+a+"</option>");}%>
                                  </select>日</td>
                            </tr>
                            <tr>
                              <td width="52%" align="center">请选择商品
                                  <select size="1" name="Proid">
								  <%out.print("<option value=-1>所有商品</option>");%>
                                    <%
                             waredb waredb=new waredb();
                        	 Collection col=waredb.select(5000,1);
                        	 if (col == null || col.isEmpty()) {
            					out.println("无记录");
        				} else {
            				Iterator itl = col.iterator();
            				while (itl.hasNext()) {
                				ware b3 = (ware) itl.next();
                                  out.print("<option value="+b3.getId()+">"+b3.getPname()+"</option>");
                                    }}%>
                                  </select>
                              </td>
                              <td width="48%"><input name="B1" type="submit" class="btn_grey" value="查询"></td>
                            </tr>
                          </table>
                        </form>
                    <tr>
                      <td width="52%" align="center">&nbsp;&nbsp;<%=Atime.substring(0,4)%>.<%=Atime.substring(4,6)%>.<%=Atime.substring(6,8)%>--<%=Btime.substring(0,4)%>.<%=Btime.substring(4,6)%>.<%=Btime.substring(6,8)%>
                      <%
                      if(Proid==-1)
                      {
                         out.print("所有商品");
                      }
                      else
                      {
                         Dbware dbware=new Dbware(Proid);
                         out.print(dbware.getPname());

                      }
                      %>
                      </td>
                    </tr>
            </table>
                  <table width="90%" height="74"  border="1" cellpadding="0" cellspacing="0"
				 bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#82664F" align="center">
        <td width="126" height="20" align="center"> 排名</td>
            <td width="122" height="20" align="center"> 销售总量</td>
            <td height="20" width="135" align="center"> 连锁店</td>
            <%
                    ResultSet rs=null;
                    Connection con = null;
                    PreparedStatement pstmt = null;
                    try {
                           con = DbConnectionManager.getConnection();
                           pstmt = con.prepareStatement(sql);
                           rs = pstmt.executeQuery();
                        }
                    catch (SQLException sqle) {
                          System.err.println("错误位置: Dbchfph-" + sqle);
                          sqle.printStackTrace();
                        }
                        int j=0;
                          while(rs.next())
                       {
                          j=j+1;

                      %>
        <tr>
          <td height="20" align="center" width="126">第<%=j%>名</td>
          <td height="20" align="center" width="122"><%=rs.getInt(1)%></td>
          <td height="20" align="center" width="135">
            <%int userid=rs.getInt(2);
						   Dbshop dbshop=new Dbshop(userid);
						   out.print(dbshop.getShopname());%></td>
        </tr>
        <%}%>
            </table>
		  </td>
      </tr>
    </table></td>
    <td width="35" valign="top"><img src="Images/tiring-room/tiring-room_05.gif" width="35" height="248"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>
