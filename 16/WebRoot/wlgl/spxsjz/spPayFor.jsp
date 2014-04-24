<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<%
   request.setCharacterEncoding("gb2312");//防止中文乱码
   String id=request.getParameter("jkph");
   String xsid=request.getParameter("xsid");
   String khname=request.getParameter("khname");
   String bcjk=request.getParameter("bcjk");
   String ye=request.getParameter("ye");
   String jkdate=request.getParameter("jkdate");
   String czy=request.getParameter("czy1");
   String jsr=request.getParameter("jsr1");
   String whether="";//判断是否结帐完成，即是否还有未付款
   if(ye.equals("0")||ye=="0"){
     whether="是";
   }
   else{
     whether="否";
   }
   //保存销售结帐信息
   String strInsert="insert into tb_selljz values('"+id+"','"+xsid+"','"+khname+"',"+
       ""+bcjk+","+ye+",'"+jkdate+"','"+czy+"','"+jsr+"')";
   //更新销售票号数据表(tb_sellph)
   String strUpdate="update tb_sellph set ss=ss+"+bcjk+", ws="+ye+", whether='"+whether+
       "' where xsph='"+xsid+"'";
   rst.doExecute(strInsert);
   rst.doExecute(strUpdate);
%>
<script language="javascript">
   alert("商品结账成功");window.location.href='../main.jsp';
</script>








