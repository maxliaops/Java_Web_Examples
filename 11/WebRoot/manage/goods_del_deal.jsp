<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="del_goods" scope="page" class="com.dao.GoodsDaoImpl"/>
<jsp:useBean id="goods" scope="page" class="com.model.Goods">
<jsp:setProperty name="goods" property="*"/>
</jsp:useBean>
<jsp:include page="safe.jsp"/>
<%
Integer id=goods.getID();
ResultSet rs=conn.executeQuery("select * from tb_goods where ID="+id);
if (!rs.next()){
	out.println("<script language='javascript'>alert('您的操作有误！');window.location.href='index.jsp';</script>");
}else{
	int ret=0;
        ret=del_goods.delete(goods);
	if (ret!=0){
          out.println("<script language='javascript'>alert('商品信息删除成功！');window.location.href='index.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('该商品信息不能删除！');window.location.href='index.jsp';</script>");
        }
}

%>
