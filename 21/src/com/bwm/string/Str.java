/*
 * Created on 2004-9-18
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.bwm.string;

import java.io.UnsupportedEncodingException;

/**
 *class explain:String deal with<br>
 *set up name:	crazyadept<br>
 *set up time:	11/25/2004
 */
public class Str {

	/**
	 *method explain:initialization Str<br>
	 *set up name:	 crazyadept<br>
	 *set up time:	 11/25/2004<br>
	 */
	public Str() {
	}

	/**
	 *return :		GB2312<br>
	 *parameter:	iso-8859-1<br>
	 *set up name:	crazyadept<br>
	 *change time:	11/25/2004
	 */
	public String toChinese(String str){
		if(str==null||str.length()<1){
			
			str="";
		}else{
			try {
				str=(new String(str.getBytes("iso-8859-1"),"GB2312"));
			} catch (UnsupportedEncodingException e) {
				System.err.print(e.getMessage());
				e.printStackTrace();
				return str;
			}
		}
		return str;
	}

	/**
	 *return :		it's not have "'"<br>
	 *parameter:	it's have "'" <br>
	 *set up name:	crazyadept<br>
	 *change time:	11/25/2004
	 */
	public String dbEncode(String str){
		if(str==null){
			str="";
		}else{
			try{
				str=str.replace('\'',(char)1).trim();
			}catch(Exception e){
				System.err.print(e.getMessage());
				e.printStackTrace();
				return str;
			}
		}
		return str;
	}

	/**
	 *return :		it's have " ' "<br>
	 *parameter:	it's not have " ' " <br>
	 *set up name:	crazyadept<br>
	 *change time:	11/25/2004
	 */
	public String dbDecode(String str){
		if(str==null){
			str="";
		}else{
			try{
				str=str.replace((char)1,'\'').trim();
			}catch(Exception e){
				System.err.print(e.getMessage());
				e.printStackTrace();
				return str;
			}
		}
		return str;
	}

	/***************************************************
		*return :		it's have "&gt;,&lt;"<br>
		*parameter:		it's have "<,>"<br>
		*set up name:	crazyadept<br>
		*change time:	11/30/2004
	****************************************************/
	public String htmlEncode(String str){
		str=this.replace(str,">","&gt;");
		str=this.replace(str,"<","&lt;");
		return str;
	}

	/***************************************************
		*return :		include str2<br>
		*parameter:		include str1<br>
		*set up name:	crazyadept<br>
		*change time:	11/30/2004
	****************************************************/
	public String replace(String str,String str1,String str2){
		String str3="";
		if(str.indexOf(str1)==-1){
			return str;
		}else{
			int i,j;
			for(i=0;(j=str.indexOf(str1,i))!=-1;i=j+str1.length()){
				str3=str3+str.substring(i,j);
				str3=str3+str2;
			}
			str3=str3+str.substring(i,str.length());
			return str3;
		}
	}

	/***************************************************
		*return :		get data type<br>
		*parameter:		data type<br>
		*set up name:	crazyadept<br>
		*change time:	12/01/2004
	****************************************************/
	public String getData(String str)
	{
		if(str.indexOf("int")!=-1||str.indexOf("bit")!=-1){
			str="getInt";
		}else if(str.indexOf("char")!=-1){
			str="getString";
		}else if(str.indexOf("date")!=-1){
			str="getDate";
		}else{
			str="getObject";
		}
		return str;
	}
}
