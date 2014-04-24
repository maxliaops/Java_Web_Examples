<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<%
	String sign = (String) request.getAttribute("sign");
    System.out.println("dfa:"+sign);
    if(sign==null||sign.equals("")){
    	session.invalidate();
    	out.println("<script language='javascript'>window.opener=null;window.close();</script>");
    }else{
	if (sign.equals("1")) {
		String result = (String) request.getAttribute("result");
		if (result.equals("")) {
			out.print("<script language=javascript>alert('您已经注册失败！');history.go(-1);</script>");
		} else {		
			out.print("<script language=javascript>alert('您已经注册成功！');window.location.href='"+path+"/index.jsp';</script>");
		}
	}
	if (sign.equals("2")) {
       session.setAttribute("admin",request.getAttribute("admin"));
       out.print("<script language=javascript>alert('您成功登录！');window.location.href='"+path+"/admin/main.jsp';</script>");
	}
	if(sign.equals("3")){
		 out.print("<script language=javascript>alert('您已经成功退出！');window.location.href='index.jsp';</script>");
	}
	if(sign.equals("4")){
		 out.print("<script language=javascript>alert('您已经成功退出后台管理！');window.location.href='index.jsp';</script>");
	}
	if(sign.equals("5")){
		if(null==request.getAttribute("pageCounter")){
			out.print("<script language=javascript>alert('该用户操作失败！');history.go(-1);</script>");
		}else{
			String result = "该用户操作成功！";
			if(null!=request.getAttribute("result")){
				result=(String)request.getAttribute("result");
			}
			Integer pageCounter = (Integer)request.getAttribute("pageCounter");
			out.print("<script language=javascript>alert('"+result+"');window.location.href='userInfo_queryUser.htm?count="+pageCounter+"';</script>");
		}
	}
	if(sign.equals("6")){		
		out.println("<script language='javascript'>alert('用户登录成功!');opener.location.reload();window.close();</script>");
	}
	if(sign.equals("7")){
		out.print("<script language=javascript>alert('该用户未被激活！');history.go(-1);</script>");
	}
	if(sign.equals("8")){
		out.print("<script language=javascript>window.location.href='userInfo_artType_query.htm';</script>");
	}
	if(sign.equals("9")){
		out.print("<script language=javascript>opener.location.href='userInfo_artType_query.htm';window.close();</script>");
	}
	if(sign.equals("10")){
		String result = (String)request.getAttribute("result");
	    out.print("<script language=javascript>alert('"+result+"');window.location.href='articleInfo_article_query.htm';</script>");
	}
	if(sign.equals("11")){		
		String result = (String)request.getAttribute("result");
	    out.print("<script language=javascript>alert('"+result+"');opener.location.reload();window.close();</script>");
	}
	if(sign.equals("12")){		
		Integer id=(Integer)request.getAttribute("id");
	    out.print("<script language=javascript>window.location.href='articleInfo_f_article_query.htm?count=1&id="+id+"';</script>");
	}
	if(sign.equals("13")){	
		System.out.print("321:"+sign);		
		out.print("<script language=javascript>window.location.href='userInfo_phtType_query.htm';</script>");
	}
	if(sign.equals("14")){		
		out.print("<script language=javascript>opener.location.href='"+path+"/userInfo_phtType_query.htm';window.close();</script>");
	}
	if(sign.equals("15")){		
		String result = (String)request.getAttribute("result");
		out.print("<script language=javascript>alert('"+result+"');opener.location.reload();history.go(-1);</script>");
	}
	if(sign.equals("16")){		
		String result = (String)request.getAttribute("result");
		out.print("<script language=javascript>alert('"+result+"');opener.location.reload();window.close();</script>");
	}
	if(sign.equals("17")){		
		String sign1=(String)request.getAttribute("sign1");
		String result = (String)request.getAttribute("result");
		out.print("<script language=javascript>alert('"+result+"');window.location.href='info_queryInfo.htm?sign="+sign1+"';</script>");
	}
	if(sign.equals("18")){			
		String result = (String)request.getAttribute("result");	
		String account1=(String)request.getAttribute("account1");
		out.print("<script language=javascript>alert('"+result+"');window.location.href='userInfo_goinUser.htm?account="+account1+"';</script>");
	}
	if(sign.equals("19")){		
		out.print("<script language=javascript>window.location.href='photoInfo_photo_query.htm';</script>");
	}	
	if(sign.equals("20")){
	System.out.print(sign);		
		out.print("<script language=javascript>window.location.href='photoInfo_admin_photoQuery.htm';</script>");
	}	
	if(sign.equals("21")){		
		out.print("<script language=javascript>window.location.href='userInfo_queryUser.htm';</script>");
	}	
    }
	
%>




