<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="electric.electricUtils.*"%>
<%@ page import="electric.dbs.*"%>

<%
  String pageAction=ParamUtils.getEscapeHTMLParameter(request,"pageaction","goback");
  String responsePage=ParamUtils.getEscapeHTMLParameter(request,"responsepage","");
  pageAction=pageAction.trim().toUpperCase();
  if(pageAction.equals("CREATE"))
  {
        Dbproduct product=new Dbproduct(request);
  }
  else if(pageAction.equals("MODIFY"))
  {
	int id=ParamUtils.getIntParameter(request,"Id",0);
	if(id>0)
        {
	    Dbproduct product1=new Dbproduct(id);
            product1.modify(request);
        }

  }
  else if(pageAction.equals("DELETE"))
  {
	int id2=ParamUtils.getIntParameter(request,"id",0);
        if(id2>0)
        {
             Dbproduct product2=new Dbproduct(id2);
             product2.setStatus(1);
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

