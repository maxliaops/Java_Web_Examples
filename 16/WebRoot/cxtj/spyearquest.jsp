<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation" %>
<%@ page import="org.jfree.chart.entity.StandardEntityCollection" %>
<%@ page import="org.jfree.chart.ChartRenderingInfo" %>
<%@ page import="org.jfree.chart.servlet.ServletUtilities" %>

<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>

<%
   String year=request.getParameter("year");
   //获得某年按月份分组的总销售额的SQL语句
 	String strSql="select * from (select sum(je) as sumje,month(xsdate) as xsmonth from tb_sell  where  year(xsdate)='"+
 			year+"' group by month(xsdate) union select 0,MonthName from GetMonth() where MonthName not in (select month(xsdate) as xsmonth from tb_sell where year(xsdate)='"+
 					year+"' group by month(xsdate))) temp order by temp.xsmonth";  
   ResultSet rs=rst.getResult(strSql);
   int counts=0;
   if(!rs.next()){
     out.println("<script language='javascript'>alert('"+year+"年没有销售记录');"+
                "window.location.href='main.jsp';</script>");
   }
%>


<%
DefaultCategoryDataset dataset1=new DefaultCategoryDataset();
for(int j=1;j<=12;j++){   //循环从1循环到12
	float sumje=Float.valueOf(rs.getString("sumje"));
	int y=rs.getInt("xsmonth");
	dataset1.addValue(sumje,y+"月",y+"月");
	rs.next();
}
//创建JFreeChart组件的图表对象
JFreeChart chart=ChartFactory.createBarChart3D(
									year+"年销售额分析图",		//图表标题
									"月份",					//x轴的显示标题
									"销量",					//y轴的显示标题
									dataset1,				//数据集
									PlotOrientation.VERTICAL,//图表方向(垂直)
									true,					//是否包含图例
									false,					//是否包含提示
									false					//是否包含URL
									);
//设置图表的文件名
// 固定用法
ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
String fileName=ServletUtilities.saveChartAsPNG(chart,500,300,info,session);
String url=request.getContextPath()+"/servlet/DisplayChart?filename="+fileName;

%>
<html>
<title>年销售额分析</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;<img src="<%=url %>"></td>
  </tr>
</table>
</body>
</html>
