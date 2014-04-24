package com.toolsBean;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Change {
	public static String htmlSetChange(String source){
		String changeStr="";
		changeStr=source.replace("&","&amp;");
		changeStr=changeStr.replace(" ","&nbsp;");
		changeStr=changeStr.replace("<","&lt;");
		changeStr=changeStr.replace(">","&gt;");		
		changeStr=changeStr.replace("\r\n","<br>");
		return changeStr;
	}
	public static String toChinese(String source){
		if(source==null)
			source="";
		try {
			source=new String(source.getBytes("ISO-8859-1"),"gb2312");
		} catch (UnsupportedEncodingException e) {
			source="";
			e.printStackTrace();
		}
		return source;
	}
	public static String dateTimeChange(Date date){
		String strDate="";
		if(date!=null){
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			strDate=format.format(date);		
		}
		return strDate;
	}
	public static String getSerial(Date date){
		String strDate="";
		if(date!=null){
			SimpleDateFormat format=new SimpleDateFormat("MMddyyyyHHmmss");
			strDate=format.format(date);		
		}
		return strDate;
	}
	public static int strToInt(String src){
		if(src==null||src.equals(""))
			src="-1";
		int result=-1;
		try{
			result=Integer.parseInt(src);
		}catch(NumberFormatException e){			
			e.printStackTrace();
		}
		return result;
	}
}