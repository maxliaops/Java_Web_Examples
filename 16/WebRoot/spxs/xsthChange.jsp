 <%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page import="com.mingri.dbconn.DBResult"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="calendar" scope="page" class="com.mingri.showtime.CalendarBean"/>
<%
   request.setCharacterEncoding("gb2312");//解决表单提交中的中文乱码问题
   //获取表单数据
   String jc=(String)session.getAttribute("jc"); String spname=(String)session.getAttribute("spname");
   String gg=(String)session.getAttribute("gg"); String xsid=(String)session.getAttribute("xsthph");
   String bz=(String)session.getAttribute("bz");
   String cd=(String)session.getAttribute("cd"); String spid=(String)session.getAttribute("spid");
   String dw=(String)session.getAttribute("dw");
   String sl=(String)request.getParameter("sl"); String czy=(String)request.getParameter("czy");
   String je=(String)request.getParameter("je"); String jsr=(String)request.getParameter("jsr");
   String dj=(String)request.getParameter("dj"); String xsdate=(String)request.getParameter("xsdate");
   String ys=(String)request.getParameter("ys"); String jsfs=(String)request.getParameter("jsfs");
   String ss=(String)request.getParameter("ss"); String ws=(String)request.getParameter("ws");
   String xskhname=(String)request.getParameter("xskhname");
   String whether="";
   if(ws.equals("0")){
     whether="是";
     }else{
       whether="否";
     }
%>
<%
   //保存销售退货信息
   String xsSql="insert into tb_sellth values('"+xsid+"','"+spid+"','"+spname+"',"+
       "'"+jc+"','"+cd+"','"+gg+"','"+bz+"','"+dw+"',"+dj+",'"+sl+"',"+je+","+
       "'"+xskhname+"','"+xsdate+"','"+czy+"','"+jsr+"','"+jsfs+"')";
   //保存销售退货票号信息
   String xsphSql="insert into tb_thph_xs values('"+xsid+"','"+sl+"',"+ys+","+ss+","+
      ""+ws+",'"+xskhname+"','"+xsdate+"','"+czy+"','"+jsr+"','"+jsfs+"','"+whether+"')";

   //更新库存信息
   //String rkkcSql="update tb_kucun set kcsl=kcsl-"+sl+",dj="+dj+","+
        //"kcje=(kcsl+"+sl+")*"+dj+" where id='"+spid+"'";
	String rkkcSql="update tb_kucun set kcsl=kcsl+"+sl+","+
        "kcje=(kcsl+"+sl+")* dj  where id='"+spid+"'";
   rst.getResult(rkkcSql);rst.getResult(xsSql);rst.getResult(xsphSql);
   out.println("<script language='javascript'>alert('商品销售操作成功');window.location.href='spxs.jsp';</script>");
%>
