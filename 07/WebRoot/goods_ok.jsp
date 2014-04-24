<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>操作成功!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%int para=Integer.parseInt(request.getParameter("para"));
switch(para){
	case 1:
	%>
		<script language="javascript">
		alert("物资信息添加成功!");
		window.location.href="goods.do?action=goodsRequest";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("物资信息修改成功!");
		window.location.href="goods.do?action=goodsRequest";
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("物资信息删除/恢复成功!");
		window.location.href="goods.do?action=goodsRequest";
		</script>		
	<%	break;
}
%>
</body>
</html>