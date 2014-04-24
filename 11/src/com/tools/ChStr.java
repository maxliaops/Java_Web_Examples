package com.tools;
public class ChStr {
        /***************************************************
                *method name:	chStr()
                *method function:解决输出中文乱码问题
                *return value:  String
        ****************************************************/
	public String chStr(String str){
	    if(str==null){ 									//当变量str为null时
	            str="";									//将变量str赋值为空
	    }else{
	        try{
	            str=(new String(str.getBytes("iso-8859-1"),"GBK")).trim();//将字符串转换为GBK编码
	        }catch(Exception e){
	             e.printStackTrace(System.err);			//输出异常信息
	        }
	    }
	    return str;										//返回转换后的输入变量str
	}

        /***************************************************
          *method name:convertStr()
          *method function:显示文本中的回车换行、空格及保证HTML标记的正常输出
          *return value:  String
          * author:wgh
        ****************************************************/
       public String convertStr(String str1){
           if(str1==null){
               str1="";
           }else{
               try{
                 //replaceAll(String str1,String str2)方法为JDK1.4.x的新方法，使用str2替换字符串中的所有str2字符串
                 str1=str1.replaceAll("<","&lt;");//替换字符串中的"<"和">"字符，保证HTML标记的正常输出
                 str1=str1.replaceAll(">","&gt;");
                 str1=str1.replaceAll(" ","&nbsp;");
                 str1=str1.replaceAll("\r\n","<br>");
               }catch(Exception e){
                       e.printStackTrace(System.err);
               }
           }
           return str1;
       }
}
