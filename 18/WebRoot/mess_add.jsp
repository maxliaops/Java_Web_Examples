<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="electric.electricUtils.*"%>
<%@ page import="electric.dbs.Dbmess"%>

<%
  String pageAction=ParamUtils.getEscapeHTMLParameter(request,"pageaction","goback");
  String responsePage=ParamUtils.getEscapeHTMLParameter(request,"responsepage","");
  pageAction=pageAction.trim().toUpperCase();
  if(pageAction.equals("CREATE"))
  {
        Dbmess mess=new Dbmess(request);
  }
  else if(pageAction.equals("MODIFY"))
  {
	int id=ParamUtils.getIntParameter(request,"Id",0);
  }
  else if(pageAction.equals("DELETE"))
  {
	int id2=ParamUtils.getIntParameter(request,"id",0);
        if(id2>0)
        {
             Dbmess messb=new Dbmess(id2);
             messb.setStatus(1);
        }
  }
  if(!responsePage.trim().equals(""))
  {
       response.sendRedirect(responsePage);
  }
  else
  {
      %>
      <SCRIPT Language="JavaScript">
      <!--
		  history.go(-1);
      //-->
      </SCRIPT>
      <%
  }
%>