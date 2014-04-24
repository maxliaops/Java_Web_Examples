package com.core;

public class ChStr {


	// 处理字符串中的空值
	public static final String nullToString(String v, String toV) {
	    if (v == null || "".equals(v)) {			//当输入变量v为空时
	        v = toV;						//将输入变量v赋值为输入变量toV
	    }
	    return v;							//返回转换后的输入变量v
	}
	//过滤危险字符
	public static final String filterStr(String str){
		str=str.replaceAll(";","");
		str=str.replaceAll("&","&amp;");
		str=str.replaceAll("<","&lt;");
		str=str.replaceAll(">","&gt;");
		str=str.replaceAll("'","");
		str=str.replaceAll("--"," ");
		str=str.replaceAll("/","");
		str=str.replaceAll("%","");
		return str;
	}
}
