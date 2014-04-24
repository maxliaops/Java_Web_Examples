/*
 * Created on 2004-12-10
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.bwm.string;

/**
 *class explain:	String deal with<br>
 *set up name:	crazyadept<br>
 *set up time:	12/10/2004
 */
public class Sql {
	
	/**
	 *return value:  select DataBase be use SQL<br>
	 *parameter 	:	str<br>
	 *set up name:	crazyadept<br>
	 *set up time:	08/26/2004<br>
	 */
	public String doubleStr(String str){
		if(str.equals("")){
			str=" LIKE '%' ";
		}else{
			str=(" LIKE '%"+str+"%' ");
		}
			return str;
	}

	/**
	 *return value:  select DataBase be use SQL,left have %<br>
	 *parameter 	:	str<br>
	 *set up name:	crazyadept<br>
	 *set up time:	08/26/2004<br>
	 */
	public String leftStr(String str){
		if(str.equals("")){
			str=" LIKE '%' ";
		}else{
			str=(" LIKE '%"+str+"' ");
		}
			return str;
	}

	/**
	 *return value: select DataBase be use SQL,right have %<br>
	 *parameter  :	str<br>
	 *set up name:	crazyadept<br>
	 *set up time:	08/26/2004<br>
	 */
	public String rightStr(String str){
		if(str.equals("")){
			str=" LIKE '%' ";
		}else{
			str=(" LIKE '"+str+"%' ");
		}
			return str;
	}
}