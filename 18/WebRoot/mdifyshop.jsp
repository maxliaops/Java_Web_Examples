<%@ page contentType="text/html; charset=GBK" %>


<p>新连锁店用户填加</p>
<form method="POST" action="shop_add.jsp">
<table border="0" width="100%">
  <tr>
    <td width="22%">&nbsp;&nbsp; 连锁店用户名：</td>
    <td width="78%"><input type="text" name="username" size="20"></td>
  </tr>
  <tr>
    <td width="22%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      密码：</td>
    <td width="78%"><input type="text" name="password" size="20"></td>
  </tr>
  <tr>
    <td width="22%">&nbsp;&nbsp;&nbsp;&nbsp; 连锁店名称：</td>
    <td width="78%"><input type="text" name="shopname" size="20"></td>
  </tr>
  <tr>
    <td width="22%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 所属地区：</td>
    <td width="78%"><input type="text" name="area" size="20"></td>
  </tr>
  <tr>
    <td width="22%">&nbsp;&nbsp; 连锁店负责人:</td>
    <td width="78%"> <input type="text" name="peopleman" size="20"></td>
  </tr>
  <tr>
    <td width="22%">&nbsp;&nbsp;&nbsp;&nbsp; 负责人电话:</td>
    <td width="78%"> <input type="text" name="mantel" size="20"></td>
    <input type="hidden" name="pageaction" value="create">
	<input type="hidden" name="responsepage" value="shopman.jsp">
  </tr>
  <tr>
    <td width="22%">&nbsp;&nbsp;&nbsp;&nbsp; 连锁店电话：</td>
    <td width="78%"><input type="text" name="shoptel" size="20"></td>
  </tr>
  <tr>
    <td width="22%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="提交" name="B1"></td> 
    <td width="78%"><input type="reset" value="全部重写" name="B2"></td>
  </tr>
</table>
<p>　</p>

</form>
<p>　</p>

