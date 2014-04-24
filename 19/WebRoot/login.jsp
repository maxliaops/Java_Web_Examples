<%@ page contentType="text/html; charset=GB2312" %>
<jsp:useBean id="data" class="com.bwm.db.Data" scope="page"/>
<jsp:useBean id="show" class="com.bwm.page.Show" scope="page"/>
<html>
<head>
<title>
login
</title>
</head>
<body>
<%
String strUserName=(String)request.getParameter("username");
String strPassword=(String)request.getParameter("password");
String strSelect=(String)request.getParameter("select");
int intT=0;
if(strSelect!=null&&strSelect.equals("student")){
        intT=data.getRowCount("tb_student WHERE sname='"+strUserName+"' AND password='"+strPassword+"'");
        if(intT>0){
            session.setAttribute("name",strUserName);
                session.setAttribute("use","student");
            response.sendRedirect("student/login.jsp");
        }else{
                out.print(show.errorBox("检查你的用户名或密码！","验证错误"));
                return;
        }
}else if(strSelect!=null&&strSelect.equals("company")){
        intT=data.getRowCount("tb_company WHERE cname='"+strUserName+"' AND password='"+strPassword+"'");
        if(intT>0){
            session.setAttribute("name",strUserName);
                session.setAttribute("use","company");
            response.sendRedirect("company/login.jsp");
        }else{
            out.print(show.errorBox("检查你的用户名或密码！","验证错误"));
            return;
        }
}else{
        out.print(show.errorBox("检查你的用户名或密码！","验证错误"));
        return;
}
%>
</body>
</html>
