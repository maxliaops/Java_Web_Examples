<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="data1" scope="page" class="cars.Bean1" />
<table width="164" height="564" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160" height="20" bgcolor="#FFCC99">&nbsp;管理信息</td>
      </tr>
      <tr>
        <td height="104" valign="top">
		<table width="160" height="80" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="20" colspan="2"><div align="center">未 处 理 信 息</div></td>
            </tr>
          <tr>
            <td width="91" height="25"><div align="right">在 线 订 单：</div></td>
            <td width="69" height="25">&nbsp;
			<%
			String sql1="select count(*) as counts from tb_OrderForm where Whether='未受理'";
			ResultSet rs1=data1.getrs(sql1);
			rs1.beforeFirst();
			if(rs1!=null&&rs1.next()){
			%>
			<%=rs1.getInt("counts")%> 份
			<%}%>
			</td>
          </tr>
          <tr>
            <td height="25"><div align="right">租 赁 申 请：</div></td>
            <td height="25">&nbsp;
						<%
			sql1="select count(*) as counts from tb_Tenancy where Whether='未受理'";
			ResultSet rs2=data1.getrs(sql1);
			rs2.beforeFirst();
			if(rs2!=null&&rs2.next()){
			%>
			<%=rs2.getInt("counts")%> 份
			<%}%>
			</td>
          </tr>
          <tr>
            <td height="25"><div align="right">置 换 申 请：</div></td>
            <td height="25">&nbsp;
						<%
			sql1="select count(*) as counts from tb_Permute where Whether='未受理'";
			ResultSet rs3=data1.getrs(sql1);
			rs3.beforeFirst();
			if(rs3!=null&&rs3.next()){
			%>
			<%=rs3.getInt("counts")%> 份
			<%}%>
			</td>
          </tr>
        </table>
		</td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;管理导航</td>
      </tr>
      <tr>
        <td valign="top"><table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="30">&nbsp;</td>
            <td width="120">&nbsp;</td>
          </tr>
          <tr>
            <td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
            <td width="120" height="36"> <a href="Manage_Cars.jsp" style="color:#000000 ">销售车辆管理</a></td>
          </tr>
          <tr>
            <td height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
            <td height="36"><a href="Manage_Destine.jsp" style="color:#000000 ">租赁车辆管理</a></td>
          </tr>
          <tr>
            <td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
            <td width="120" height="36"><a href="Manage_SparePart.jsp" style="color:#000000 ">备件数据管理</a></td>
          </tr>
                       <tr>
						<td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
						<td height="36"><a href="Manage_OrderForm.jsp" style="color:#000000 ">订单信息管理</a></td>
					  </tr>
					  <tr>
						<td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
						<td height="36"><a href="Manage_Tenancy.jsp" style="color:#000000 ">租赁信息管理</a></td>
					  </tr>
					  <tr>
						<td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
						<td height="36"><a href="Manage_Permute.jsp" style="color:#000000 ">置换信息管理</a></td>
					  </tr>
					<tr>
						<td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
						<td height="36"><a href="Manage_News.jsp" style="color:#000000 ">新闻信息管理</a></td>
				    </tr>
					  <tr>
						<td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
						<td height="36"><a href="Manage_About.jsp" style="color:#000000 ">集团信息管理</a></td>
					  </tr>
          <tr>
            <td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
            <td width="120" height="36"><a href="Manage_Record.jsp" style="color:#000000 ">客户投诉管理</a></td>
          </tr>
          <tr>
            <td height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
            <td height="36"><a href="Manage_Enterprise.jsp" style="color:#000000 ">连锁企业管理</a></td>
          </tr>
        </table></td>
      </tr>
    </table>