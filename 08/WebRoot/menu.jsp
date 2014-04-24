<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*,com.hiernate.persistence.Menu"%>

<table width="100%"  border="0" cellpadding="0" cellspacing="0">
<%  
		      List listfather = (List)session.getAttribute("menulist");     //获得主菜单集合
			  if(listfather.isEmpty()){                                     //判断主菜单是否为空
%>
<tr>
			<td align="center">暂无功能分类信息!</td>
		</tr>
		   <%}
		     else{                                                           //如果主菜单不为空，进行以下操作
			   int m=1;                                  
			   for(int j=0;j<listfather.size();j++){
			     Menu menufather = (Menu)listfather.get(j);
			     List listsun = (List)session.getAttribute("menuNameid"+j+"");//获得子菜单集合
			%>
		<tr>
			<td height="27" valign="top">
				<%
				  if(listsun.isEmpty()){
					 for(int i=1;i<listsun.size();i++){
				%>
				&nbsp;
				<img src="Images/jian_null.gif" width="38" height="16" border="0">
				<%=menufather.getMenuName()%>                                <!-- 如果子菜单集合为空，显示主菜单项 -->
				<%}}
				else{%>
				&nbsp;                                                      <!-- 如果子菜单集合不为空，采用数状导航图 -->
				<a href="Javascript:ShowTR(img<%=m%>,OpenRep<%=m%>)"><img
						src="Images/jia.gif" border="0" alt="展开" id="img<%=m%>">
				</a>
				<a href="Javascript:ShowTR(img<%=m%>,OpenRep<%=m%>)">
					<%=menufather.getMenuName()%>                            <!-- 将主菜单项显示在页面上 -->
				</a>
				<%}%>
		  </td>
				<%
				  if(listsun.size()>0){                                 // 判断子菜单集合的长度是否大于０
				%>
  <tr id="OpenRep<%=m%>" style="display:none;">                         <!-- 数状导航图显示子菜单 -->
			<td colspan="6">
				<% for(int k=0;k<listsun.size();k++){
				    Menu menusun = (Menu)listsun.get(k);                   //利用循环将子菜单显示在页面上
				  %>
				<table width="94%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="25" align="center">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="7%" align="left">
										&nbsp;&nbsp;&nbsp;
										<img src="Images/folder.gif" width="16" height="16" border="0">
									</td>
									<td width="93%" align="left">
										&nbsp;
										<a href="<%=menusun.getLinkurl()%>" target="mainFrame"> <!-- 得到超联接地址 -->
										<%=menusun.getMenuName()%>                  <!-- 得到子菜单名字 -->
										</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<%m=m+1;}%>
			</td>
			<%}%>
		</tr>
		<%}}%>
		</table>
 <script language="javascript">
  ShowTR(img1,OpenRep1)  //设置第1个结点为展开状态
  function ShowTR(objImg,objTr)             //应用javascript完成页面显示效果
    {
	if(objTr.style.display == "block")
	{
		objTr.style.display = "none";
		objImg.src = "Images/jia.gif";
		objImg.alt = "展开";		
	}
	else
	{
		objTr.style.display = "block";
		objImg.src = "Images/jian.gif";
		objImg.alt = "折叠";		
	}
    }
</script>