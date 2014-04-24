<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page import="com.bwm.db.Condb"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>课题成果统计页</title>
</head>

<body>
<%
	Condb con=new Condb();
	String sql="select * from tb_Con where GroupID='"+session.getAttribute("groupid")+"'";
	ResultSet rs=con.executeQuery(sql);
	int tem=0;
	int temp=0;
	int num=0;
	int tnum=0;
	int ttem=0;
	int ttemp=0;
	while(rs.next()){
		tnum++;
		String result=rs.getString(2);
		String strr="select * from tb_Result where Resultname='"+result+"'";
		String strt="select * from tb_Task where Taskname='"+result+"'";
		ResultSet rst=con.executeQuery(strt);
		while(rst.next()){
			int wether1=rst.getInt("Whether");
			if(wether1==0){
				ttem++;//统计课题未入库数
			}else{
				ttemp++;//统计课题已入库数
			}
		}
		ResultSet rss=con.executeQuery(strr);
		while(rss.next()){
			num++;//统计数据库中你所审报的所有成果数
			int wether=rss.getInt(12);
			if(wether==0){
				tem++;//统计数据库你所审报的未入库成果数
			}else{
				temp++;//统计数据库你所审报的已入库成果数
			}
			
		}
	}
con.close();
%>
<div align="left">&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/kyw_net.gif" width="521" height="241" align="texttop">
</div>

<table width="548" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr>
    <td width="548" height="31" align="center"><font color="#0000CC" size="4" face="黑体">您已申报了课题<%=(tnum-num)%>项</font></td>
  </tr>
  <tr>
    <td align="center"><font color="#0000CC" size="4" face="黑体">您已申报了成果<%=num%>项</font></td>
  </tr>
  <tr>
    <td align="center"><font color="#0000CC" size="4" face="黑体">已入库课题数<%=ttemp%>项</font></td>
  </tr>
  <tr>
    <td align="center"><font color="#0000CC" size="4" face="黑体">未入库课题数<%=ttem%>项</font></td>
  </tr>
  <tr>
    <td align="center"><font color="#0000CC" size="4" face="黑体">已入库成果数<%=temp%>项</font></td>
  </tr>
  <tr>
    <td align="center"><font color="#0000CC" size="4" face="黑体">未入库成果数<%=tem%>项</font></td>
  </tr>
  <tr>
    <td align="center"><font color="#0000CC" size="+1" face="黑体">&nbsp;</font></td>
  </tr>
</table>
</body>
</html>
