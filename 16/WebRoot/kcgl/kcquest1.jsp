<%@ page contentType="text/html;charset=gb2312"%>
<html>
  <title>商品信息查询</title>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <style type="text/css">
<!--
.style2{color: #333333}
-->
  </style>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> 当前位置：库存管理 > </span>库存查询 &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83">
      <table width="590" height="70" border="0" cellpadding="-2" cellspacing="-2">
        <tr><td width="590" height="43" align="Top">
          <form name="form1" method="POST" action="kcquest.jsp" target="MainFrame">
            <div align="center">请选择查询条件:
              <select name="cif">
                <option value="spname" selected>商品名称</option>
                <option value="jc">简称</option>
                <option value="cd">产地</option>
                <option value="kcsl">库存数量</option>
              </select>
              <select name="ccif">
                <option value="=" selected> 等于</option>
                <option value="小于">小于</option>
                <option value="LIKE">LIKE</option>
                <option value="ALL">ALL</option>
              </select>
              <%request.setCharacterEncoding("gb2312");%>
              <input type="text" name="qvalue">
              <input name="submit1" type="submit" class="btn_grey" value="查询" onClick="aa()">
              <input name="submit2" type="submit" class="btn_grey" value="显示全部数据" onClick="listall()">
            </div>
          </form>
        </td></tr>
      </table>
    </td></tr>
  </table>
</body>
</html>
<script language='JavaScript'>
function listall()
{
form1.ccif.value="ALL";
window.location.reload();
form1.submit();}
function  aa()
{
  window.location.reload();
  form1.submit();
}
</script>
