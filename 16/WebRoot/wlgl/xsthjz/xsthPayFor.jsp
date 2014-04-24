<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<%
   request.setCharacterEncoding("gb2312");//防止中文乱码
   String id=request.getParameter("jkph");
   String thph=request.getParameter("thph");
   String khname=request.getParameter("khname");
   String bcjk=request.getParameter("bcjk");
   String ye=request.getParameter("ye");
   String jkdate=request.getParameter("jkdate");
   String czy=request.getParameter("czy1");
   String jsr=request.getParameter("jsr1");
   String whether="";//判断是否结帐完成，如果是否还有未付款
   if(ye.equals("0")||ye=="0"){
     whether="是";
   }
   else{
     whether="否";
   }
   //保存入库退货结帐信息
   String strInsert="insert into tb_thjz_xs values('"+id+"','"+thph+"','"+khname+"',"+
       ""+bcjk+","+ye+",'"+jkdate+"','"+czy+"','"+jsr+"')";
   //更新入库退货票号数据表(tb_thph_rk)
   String strUpdate="update tb_thph_xs set sf=sf+"+bcjk+", wf="+ye+", whether='"+whether+
       "' where thph='"+thph+"'";
   rst.doExecute(strInsert);
   rst.doExecute(strUpdate);
%>
<script language="javascript">
   alert("商品结账成功");window.location.href='../main.jsp';
</script>








