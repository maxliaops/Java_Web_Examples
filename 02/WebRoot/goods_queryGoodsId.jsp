<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.form.GoodsForm"%>
<%@page import="com.form.CarForm"%>
<%@page import="com.form.CustomerForm"%>
<%@page import="com.form.LogForm"%>
<link href="css/style.css" type="text/css" rel="stylesheet">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>物流配货网——回执发货单确认</title>
</head>
<script language="javascript" type="text/javascript">
function checkEmpty(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
alert(form.elements[i].title);
return false;
}
}
}
</script>

<jsp:useBean id="carDao" class="com.dao.CarDao" scope="page"/>
<jsp:useBean id="customerDao" class="com.dao.CustomerDao" scope="page"/>
<jsp:useBean id="goodsAndLogDao" class="com.dao.GoodsAndLogDao" scope="page"/>
<body>
<jsp:include page="main_top.jsp"/>


<table border="0" cellpadding="0" cellspacing="0">
  <tr>
  <td width="57">&nbsp;</td>
    <td width="637" valign="top" align="center">
	<table width="615"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="25" valign="top">当前位置：首页  >>  回执发货单确认</td>
      </tr>
    </table>  
      <s:form action="goods_queryGoodsId" name="form" onsubmit="return checkEmpty(form)">
    <table width="305" height="23">     
      <tr>
        <td width="81" height="18">订单编号：</td>
        <td width="90"><s:textfield name="goods_id" title="请输入订单编号"/></td>
        <td width="118"  align="center">        <s:submit value="订单确认"/></td>
      </tr>      
    </table>
	</s:form>
	
	
	<%if(request.getAttribute("goodsForm")!=null){ 
		GoodsForm goodsForm=(GoodsForm)request.getAttribute("goodsForm");
		CarForm carForm=carDao.queryCarForm(goodsForm.getCar_id());	
		CustomerForm customerForm=customerDao.queryCustomerForm(Integer.valueOf(goodsForm.customer_id));
		LogForm logForm=goodsAndLogDao.queryCarLogForm(Integer.valueOf(goodsForm.getCar_id()));			
	%>
    <table width="529" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">
      <tr>
        <td width="80" height="30">车主姓名：</td>
        <td width="173" bgcolor="#FFFFFF"><%=carForm.getUsername()%></td>
        <td width="80">车牌号码：</td>
        <td width="176" bgcolor="#FFFFFF"><%=carForm.getCar_number()%></td>
      </tr>
      <tr>
        <td height="30">车主地址：</td>
        <td bgcolor="#FFFFFF"><%=carForm.getAddress()%></td>
        <td>车主电话：</td>
        <td bgcolor="#FFFFFF"><%=carForm.getTel()%></td>
      </tr>
      <tr>
        <td height="30">运输路线：</td>
        <td colspan="3" bgcolor="#FFFFFF"><%=carForm.getCar_road()%></td>
        </tr>
      
      <tr>
        <td height="30">发货人姓名：</td>
        <td bgcolor="#FFFFFF"><%=customerForm.getCustomer_user()%></td>
        <td>发货人电话：</td>
        <td bgcolor="#FFFFFF"><%=customerForm.getCustomer_tel()%></td>
      </tr>    
      <tr>
        <td height="30">发货人地址：</td>
        <td colspan="3" bgcolor="#FFFFFF"><%=customerForm.getCustomer_address()%></td>
        </tr>
      <tr>
        <td height="30">收货人姓名：</td>
        <td bgcolor="#FFFFFF"><%=goodsForm.getGoods_name()%></td>
        <td>收货人电话：</td>
        <td bgcolor="#FFFFFF"><%=goodsForm.getGoods_tel()%></td>
      </tr>
      <tr>
        <td height="30">收货人地址：</td>
        <td bgcolor="#FFFFFF" colspan="3"><%=goodsForm.getGoods_address()%></td>
        </tr>
      
      <%if(logForm!=null){ %>
      <tr>
        <td height="30">发货时间：</td>
        <td bgcolor="#FFFFFF"><%=logForm.getStartTime()%></td>
        <td>收货时间：</td>
        <td bgcolor="#FFFFFF"><%=logForm.getEndTime()%></td>
      </tr>
      <tr>
        <td height="30">发货单号：</td>
        <td bgcolor="#FFFFFF"><%=logForm.getGoods_id()%></td>
        <td>货物描述</td>
        <td bgcolor="#FFFFFF"><%=logForm.getDescribe()%></td>
      </tr>     
      <tr bgcolor="#FFFFFF">
        <td height="50" colspan="4" align="center"><input type="button" name="Submit" value=" 回执发货单确认 " onclick="javasrcipt:window.location.href='goods_changeOperation.action?goods_id=<%=logForm.getGoods_id()%>'"></td>
        </tr>
        <%}else{ %>
       <tr bgcolor="#FFFFFF">
        <td height="50" colspan="4" align="center">已经确认完毕</td>
        </tr>   
        <%} %>
        
    </table>
<br>
    <%} %>
  
    
    
    </td>
    <td width="115" valign="top">
	
	<jsp:include page="main_right.jsp"/>
	
	</td>
  </tr>
</table>


























<jsp:include page="main_down.jsp"/>
</body>
</html>
