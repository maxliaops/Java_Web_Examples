<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>企业计划管理页面</title>
<%
      
    int link=Integer.parseInt(request.getParameter("link"));
    int currPage=Integer.parseInt(request.getParameter("currPage"));
   
    if(link==1){
   				 if(currPage!=1){
  				  currPage=currPage-1;
  			
   			 }}
  String strid = request.getParameter("id");
  List listbm = HibernateUtil.findbmid(Integer.parseInt(strid));  //利用条件查找方法查找部门对象
	  if(!listbm.isEmpty()&&listbm.size()>0){
		  for(int i=0; i<listbm.size();i++){
			  Bm bm = (Bm)listbm.get(i);
			  HibernateUtil.deleBm(bm);         //调用删除方法
		  }
	}
%>
 <script language="javascript">
 opener.location.reload();
{alert("部门计划信息删除成功!")}
</script>
<%
  response.sendRedirect("bm_index.jsp?currPage="+currPage); //重定向致部门计划首页
%>
</head>