<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="ins_goods" scope="page" class="com.dao.GoodsDaoImpl"/>
<jsp:useBean id="goods" scope="page" class="com.model.Goods">
<jsp:setProperty name="goods" property="*"/>
</jsp:useBean>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
String goodsName=chStr.chStr(goods.getGoodsName());
ResultSet rs=conn.executeQuery("select * from tb_goods where goodsname='"+goodsName+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('该商品信息已经添加！');window.location.href='goods_add.jsp';</script>");
}else{
	int ret=0;
        ret=ins_goods.insert(goods);
	if (ret!=0){
          out.println("<script language='javascript'>alert('商品信息添加成功！');window.location.href='index.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('商品信息添加失败！');//window.location.href='goods_add.jsp';</script>");
        }
}
%>