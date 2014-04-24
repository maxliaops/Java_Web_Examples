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
    int Dqid=0;
 	Dqid = ParamUtils.getIntParameter(request, "Dqid",0);
 	int Proid = ParamUtils.getIntParameter(request, "Proid",0);
  	String Atime=Ayear+Amonth+Aday;
  	String Btime=Byear+Bmonth+Bday;
  	String sql="";
	if((Dqid==0) && (Proid==0)){
     	sql="SELECT * FROM SELL WHERE STATUS<>"+new Integer(1).toString()+" AND PTIME BETWEEN '"+Atime+"'AND'"+Btime+"' order by Ptime";
 	}
 	if((Dqid==0) && (Proid!=0)){
 		 sql="SELECT * FROM SELL WHERE STATUS<>"+new Integer(1).toString()+" AND PTIME BETWEEN '"+Atime+"'AND'"+Btime+"' AND PRODUCTID="+Proid+"  order by Ptime";
 	}
	 if((Dqid!=0) && (Proid==0)){
	 	 sql="SELECT * FROM SELL WHERE STATUS<>"+new Integer(1).toString()+" AND PTIME BETWEEN '"+Atime+"'AND'"+Btime+"' AND SHOPID="+Dqid+"  order by Ptime";
 	}
	if((Dqid!=0) && (Proid!=0)){
	    sql="SELECT * FROM SELL WHERE STATUS<>"+new Integer(1).toString()+" AND PTIME BETWEEN '"+Atime+"'AND'"+Btime+"' AND SHOPID="+Dqid+" AND PRODUCTID="+Proid+"  order by Ptime";
 	}
	shop pt=(shop)session.getAttribute("USERPO");
    if(pt==null){
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head>
<title>销售查询</title>
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
        <td height="68" colspan="2" background="Images/tiring-room/h_sellquery.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
				<table width="100%" border="0" cellspacing="-2" cellpadding="-2" height="30">
  			<tr>
			 <td width="87%">
		  			<form method="POST" action="checksell.jsp">
                  <table border="0" width="100%">
                    <tr>
                      <td width="52%" align="center">售货日期:<select size="1" name="Ayear"> 
                                                                    <option value=2010>2010</option>
                                                                    <option value=2011>2011</option>
                                                                    <option value=2012>2012</option>
                                                                    <option value=2013>2013</option>
                                                                    <option value=2014>2014</option>
                                                                    <option value=2015>2015</option>
                                                                    <option value=2016>2016</option>
                                                                    <option value=2017>2017</option>
                                                                    <option value=2018>2018</option>
                                                                    <option value=2019>2019</option>
                                                                    <option value=2020>2020</option>
                                                                  </select>年<select size="1" name="Amonth">
                                                                    <option value=01>01</option>
                                                                    <option value=02>02</option>
                                                                    <option value=03>03</option>
                                                                    <option value=04>04</option>
                                                                    <option value=05>05</option>
                                                                    <option value=06>06</option>
                                                                    <option value=07>07</option>
                                                                    <option value=08>08</option>
                                                                    <option value=09>09</option>
                                                                    <option value=10>10</option>
                                                                    <option value=11>11</option>
                                                                    <option value=12>12</option>
                                                                  </select>月<select size="1" name="Aday">
                                                                    <option value=01>01</option>
                                                                    <option value=02>02</option>
                                                                    <option value=03>03</option>
                                                                    <option value=04>04</option>
                                                                    <option value=05>05</option>
                                                                    <option value=06>06</option>
                                                                    <option value=06>07</option>
                                                                    <option value=07>08</option>
                                                                    <option value=08>09</option>
                                                                    <option value=10>10</option>
                                                                    <option value=11>11</option>
                                                                    <option value=12>12</option>
                                                                    <option value=13>13</option>
                                                                    <option value=14>14</option>
                                                                    <option value=15>15</option>
                                                                    <option value=16>16</option>
                                                                    <option value=17>17</option>
                                                                    <option value=18>18</option>
                                                                    <option value=19>19</option>
                                                                    <option value=20>20</option>
                                                                    <option value=21>21</option>
                                                                    <option value=22>22</option>
                                                                    <option value=23>23</option>
                                                                    <option value=24>24</option>
                                                                    <option value=25>25</option>
                                                                    <option value=26>26</option>
                                                                    <option value=27>27</option>
                                                                    <option value=28>28</option>
                                                                    <option value=29>29</option>
                                                                    <option value=30>30</option>
                                                                    <option value=31>31</option>
                                                                  </select>日</td><td width="48%" align="left">至<select size="1" name="Byear"> 
                                                                     <option value=2010>2010</option>
                                                                    <option value=2011>2011</option>
                                                                    <option value=2012>2012</option>
                                                                    <option value=2013>2013</option>
                                                                    <option value=2014>2014</option>
                                                                    <option value=2015>2015</option>
                                                                    <option value=2016>2016</option>
                                                                    <option value=2017>2017</option>
                                                                    <option value=2018>2018</option>
                                                                    <option value=2019>2019</option>
                                                                    <option value=2020>2020</option>
                                                                  </select>年<select size="1" name="Bmonth">
                                                                    <option value=01>01</option>
                                                                    <option value=02>02</option>
                                                                    <option value=03>03</option>
                                                                    <option value=04>04</option>
                                                                    <option value=05>05</option>
                                                                    <option value=06>06</option>
                                                                    <option value=07>07</option>
                                                                    <option value=08>08</option>
                                                                    <option value=09>09</option>
                                                                    <option value=10>10</option>
                                                                    <option value=11>11</option>
                                                                    <option value=12>12</option>
                                                                  </select>月<select size="1" name="Bday">
                                                                    <option value=01>01</option>
                                                                    <option value=02>02</option>
                                                                    <option value=03>03</option>
                                                                    <option value=04>04</option>
                                                                    <option value=05>05</option>
                                                                    <option value=06>06</option>
                                                                    <option value=06>07</option>
                                                                    <option value=07>08</option>
                                                                    <option value=08>09</option>
                                                                    <option value=10>10</option>
                                                                    <option value=11>11</option>
                                                                    <option value=12>12</option>
                                                                    <option value=13>13</option>
                                                                    <option value=14>14</option>
                                                                    <option value=15>15</option>
                                                                    <option value=16>16</option>
                                                                    <option value=17>17</option>
                                                                    <option value=18>18</option>
                                                                    <option value=19>19</option>
                                                                    <option value=20>20</option>
                                                                    <option value=21>21</option>
                                                                    <option value=22>22</option>
                                                                    <option value=23>23</option>
                                                                    <option value=24>24</option>
                                                                    <option value=25>25</option>
                                                                    <option value=26>26</option>
                                                                    <option value=27>27</option>
                                                                    <option value=28>28</option>
                                                                    <option value=29>29</option>
                                                                    <option value=30>30</option>
                                                                    <option value=31>31</option>
                                                                  </select>日</td></tr>
																  <tr>
																  	<td width="52%" align="center">请选择连锁店：<SELECT  name="Dqid" size="1" >
											                         	<OPTION value="0">所有连锁店</OPTION>
                         	     											<%
                                           										Shopdb shopdb2=new Shopdb();
														                        Collection coll=shopdb2.select(50000,1);
														                        if (coll == null || coll.isEmpty()) {
            																		out.println("没有连锁店");
																		        } else {
																				    Iterator it = coll.iterator();
																					while (it.hasNext()) {
																					     shop b2 = (shop) it.next();
																						 String s=b2.getShopname();
																						 if(!s.equals("无"))
																			%><OPTION value="<%=b2.getId()%>"> <%
																			           out.print(s);
																            %></OPTION> <%}}%></SELECT> </td><td align="left">请选择商品:
                         	     											  <select size="1" name="Proid">
                                                                                <option value="0">所有商品</option>
                                                                                <%
                             waredb waredb=new waredb();
                        	 Collection col=waredb.select(5000,1);
                        	 if (col == null || col.isEmpty()) {
            					out.println("无商品");
     						   } else {
            							Iterator itl = col.iterator();
            							while (itl.hasNext()) {
                							ware b3 = (ware) itl.next();
                        %>
                                                                                <option value="<%=b3.getId()%>"><%=b3.getPname()%></option>
                                                                                <%}}%>
                                                                              </select>
                         	     											  <input name="B1" type="submit" class="btn_grey" value="查询"></td>
							</tr>
                  </table>
                </form>
				</td>
   			 <td width="6%">
			 </td>
  			</tr>
			</table><%=Atime.substring(0,4)%>.<%=Atime.substring(4,6)%>.<%=Atime.substring(6,8)%>--<%=Btime.substring(0,4)%>.<%=Btime.substring(4,6)%>.<%=Btime.substring(6,8)%>
               <% 
                      Dbshop dbs=new Dbshop(Dqid);
                      if(Dqid==0){
                         out.print("所有连锁店  ");
                      }else{
                      	out.print(dbs.getShopname());
                      }if(Proid==0){
                         out.print("所有商品");
                      }else{
                         Dbware dbware=new Dbware(Proid);
                         out.print(dbware.getPname());
                      }
                      %>的销售情况如下： 
				<table width="560" height="74"  border="1" cellpadding="0" cellspacing="0"
				 bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#82664F">
                    <td width="141" height="20" align="center">售货时间</td>
                    <td width="132" height="20" align="center">售货数量</td> 
                    <td width="114" height="20" align="center">购买者</td>
                    <td height="20" width="163" align="center">出货店</td>
                      <%
                           Connection con = null;
                           PreparedStatement pstmt = null;
                           con = DbConnectionManager.getConnection();
                           pstmt = con.prepareStatement(sql);
                           ResultSet rs = pstmt.executeQuery();
                           while (rs.next())
                               {
                      %>
						<tr>
						  <td height="20" align="center" width="141"><%=rs.getString(8).substring(0,4)%>年<%=rs.getString(8).substring(4,6)%>月<%=rs.getString(8).substring(6,8)%>日</td>
						  <td height="20" align="center" width="132"><%=rs.getString(6)%></td>
						  <td height="20" align="center" width="114">
						  <%
						  	String gmz="无";
							if(rs.getInt(5)==1){
								gmz="个人";
							}else if(rs.getInt(5)==2){
								gmz="私营企业";
							}else if(rs.getInt(5)==3){
								gmz="国有企业";
							}else if(rs.getInt(5)==4){
								gmz="合资企业";
							}else{
								gmz="外资企业";
							}
						  %><%=gmz%></td>
						  <td height="20" align="center" width="163">
  							<%int userid=rs.getInt(2);
						   Dbshop dbshop=new Dbshop(userid);
						   out.print(dbshop.getShopname());%>
						  </td>
						</tr>
					  <%
                                   }
					  %>
                </table>
				<table width="100%" border="0" cellspacing="-2" cellpadding="-2" height="20">
  			<tr>
			 <td width="20%">&nbsp;</td>
 		 	</tr>
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