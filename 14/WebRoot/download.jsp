<%@ page contentType="text/html; charset=GBK" language="java" import="com.jspsmart.upload.*"  import="com.core.*" import="com.model.*"%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" /><%
        int mid=ParamUtils.getIntParameter(request,"mid");
        int sfid=ParamUtils.getIntParameter(request,"sfid");
        BasetableFactory bf=BasetableFactory.getInstance();
        String name,path;
        String filename="";
        if(sfid<=0&&mid>0){
            Mend m=bf.SearchMend("WHERE mid="+mid);
            name=m.getName();
            filename=m.getPath().substring(1);
			path="upload"+m.getPath();
            m.setLoadnum(m.getLoadnum()+1);
		}else{
			Soft s=bf.SearchSoft("WHERE sfid="+sfid);
            name=s.getName();
            filename=s.getPath().substring(1);

			path="upload"+s.getPath();
			s.setLoadnum(s.getLoadnum()+1);
        }
        java.io.File f=new java.io.File(application.getRealPath(path));
    if(!f.exists()){
	    session.setAttribute("error","\u6587\u4EF6\u4E0D\u5B58\u5728");
        response.sendRedirect("error.jsp");
	    }else{
			response.reset();
			out.clear();
			out=pageContext.pushBody();
            mySmartUpload.initialize(pageContext);
            System.out.println(path+"]path "+name);
			mySmartUpload.setContentDisposition(null);
			System.out.println("FILENAME:"+filename);
			filename=new String(filename.getBytes("GBK"), "ISO-8859-1");
			 mySmartUpload.downloadFile(path,null,filename);//第一个参数为文件路径；第二个参数为类型；第3个参数为在下载对话框中显示的提示文件名
		}%>