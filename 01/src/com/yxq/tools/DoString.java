package com.yxq.tools;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DoString {
	public static String HTMLChange(String source){
		String changeStr="";
		changeStr=source.replaceAll("&","&amp;");
		changeStr=changeStr.replaceAll(" ","&nbsp;");
		changeStr=changeStr.replaceAll("<","&lt;");
		changeStr=changeStr.replaceAll(">","&gt;");		
		changeStr=changeStr.replaceAll("\r\n","<br>");
		return changeStr;
	}
	public static String dateTimeChange(Date source){
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String changeTime=format.format(source);		
		return changeTime;
	}
}
