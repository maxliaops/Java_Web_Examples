<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page import="com.mingri.dbconn.DBResult"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="calendar" scope="page" class="com.mingri.showtime.CalendarBean"/>
<%
   request.setCharacterEncoding("gb2312");//解决表单提交中的中文乱码问题
   //获取表单数据
   String jc=(String)session.getAttribute("jc"); String spname=(String)session.getAttribute("spname");
   String gg=(String)session.getAttribute("gg"); String rkid=(String)session.getAttribute("rkbh");
   String bz=(String)session.getAttribute("bz"); String gysname=(String)session.getAttribute("gysname");
   String cd=(String)session.getAttribute("cd"); String spid=(String)session.getAttribute("spid");
   String dw=(String)session.getAttribute("dw");
   String sl=(String)request.getParameter("sl"); String czy=(String)request.getParameter("czy");
   String je=(String)request.getParameter("je"); String jsr=(String)request.getParameter("jsr");
   String dj=(String)request.getParameter("dj"); String rkdate=(String)request.getParameter("rkdate");
   String yf=(String)request.getParameter("yf"); String jsfs=(String)request.getParameter("jsfs");
   String sf=(String)request.getParameter("sf"); String wf=(String)request.getParameter("wf");
   String whether="";
   if(wf.equals("0")){//记录商品入库时是否有未付款
     whether="是";
     }else{
       whether="否";
     }
   String theMax="";
   //保存入库信息
   String rukuSql="insert into tb_ruku values('"+rkid+"','"+spid+"','"+spname+"',"+
       "'"+jc+"','"+cd+"','"+gg+"','"+bz+"','"+dw+"',"+dj+",'"+sl+"',"+je+","+
       "'"+gysname+"','"+rkdate+"','"+czy+"','"+jsr+"','"+jsfs+"')";
   //保存入库票号信息
   String rkphSql="insert into tb_rkph values('"+rkid+"','"+sl+"',"+yf+","+sf+","+
      ""+wf+",'"+gysname+"','"+rkdate+"','"+czy+"','"+jsr+"','"+jsfs+"','"+whether+"')";

   //保存或修改库存信息
   String rkkcSelect="select * from tb_kucun where id='"+spid+"'";
   ResultSet rkkc=rst.getResult(rkkcSelect);
   String rkkcSql="";
   //判断库存中是否有该商品，如果有则修改库存信息，否则插入库存记录。
   if(rkkc.next()){
     rkkcSql="update tb_kucun set kcsl=kcsl+"+sl+",dj="+dj+","+
        "kcje=(kcsl+"+sl+")*"+dj+" where id='"+spid+"'";
   }else{
     rkkcSql="insert into tb_kucun values('"+spid+"','"+spname+"','"+jc+"','"+cd+"',"+
         "'"+gg+"','"+bz+"','"+dw+"',"+dj+","+sl+","+je+")";
   }
   rst.getResult(rkkcSql);rst.getResult(rukuSql);rst.getResult(rkphSql);
    out.println("<script language='javascript'>alert('商品入库添加成功');"+
                "window.location.href='sprk.jsp';</script>");
%>
