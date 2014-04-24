<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.persistence.*"/>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title></title>
	<%
	List listWai = HibernateUtil.finwaichuId(Integer.parseInt(request.getParameter("id"))); //按条件查询外出登记人员
    if(!listWai.isEmpty() && listWai.size()>0){       //判断集合是否为空              
  	  for(int j=0;j<listWai.size();j++){                                                  
  		  Waichu waichu = (Waichu)listWai.get(j);      //返回list中指定位置元素
  		  waichu.setState(1);                          //将state属性设置为1
          HibernateUtil.updateWaichu(waichu);          //调用修改方法对外出登记进行修改.
            }
    }
    response.sendRedirect("waichu.jsp?currPage="+request.getParameter("currPage")); //信息修改后重定向致waichu.jsp页面
	%>
</head>