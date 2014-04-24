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
		alert("部门报损信息添加成功!");
		window.location.href="damage.do?action=damageaddquery";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("物资借出审批成功!");
		window.location.href="ifDeal.do?action=loanApproveQuery";
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("物资借出归还成功!");
		window.location.href="ifDeal.do?action=loanBackQuery";
		</script>		
	<%	break;
}
%>
</body>
</html>