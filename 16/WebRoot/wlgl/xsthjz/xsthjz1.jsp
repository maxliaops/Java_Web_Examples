<%@ page contentType="text/html;charset=gb2312"%>
<%request.setCharacterEncoding("gb2312");%>
<html>
  <title>销售退货结账</title>
  <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
  <link href="../../CSS/style.css" rel="stylesheet" type="text/css">
  <style type="text/css">
<!--
.style1 {color: #FF3535}
.style2 {color: #333333}
-->
  </style>
<body >
<script language='JavaScript'>
function  check()
{
  if(form1.qvalue.value==0){
    alert("请输入查询关键字");form1.qvalue.focus();return;}
  form1.submit();
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> 当前位置：往来管理> </span> 销售退货结账 &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83">
      <table width="98%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr><td width="581" height="42" align="Top">
          <form name="form1" method="POST" action="xsthjz.jsp" target="MainFrame">
            <div align="center">请选择查询条件:
              <select name="cif">
                <option value="khname" selected>客户名称</option>
                <option value="thph">销售退货票号</option>
              </select>
              <select name="ccif">
                <option value="=" selected> 等于</option>
                <option value="LIKE">LIKE</option>
              </select>
              <input type="text" name="qvalue">
              <input name="submit1" type="button" class="btn_grey" value="查询" onClick="check()">
            </div>
          </form>
        </td></tr>
      </table>
    </td></tr>
</table>
</body>
</html>

