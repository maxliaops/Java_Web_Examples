/*
 * Created on 2004-12-1
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.bwm.page;

/***************************************************
	*class explain:	String deal with<br>
	*set up name:	crazyadept<br>
	*set up time:	12/01/2004
****************************************************/
public class Show {

	/***************************************************
		*return :		Html page<br>
		*parameter:		message title and content<br>
		*set up name:	crazyadept<br>
		*set up time:	11/29/2004<br> 
		*change time:	11/30/2004
	****************************************************/
	public String errorBox(String str1, String str2)
	{
		String str="<p align=center style=margin-top:80><body bgcolor=#ffffff><div align=center>";
		str=str+"<table border=1 cellspacing=0 bordercolorlight=#000000 bordercolordark=#FFFFFF bgcolor=#E0E0E0>";
		str=str+"<tr><td><table border=0 bgcolor=677fa9 cellspacing=0 cellpadding=2 width=350><tr><td>";
		str=str+"<font face=Marlett>1</font><font color=#FFFFFF><b>"+str2+"</b></font></td></tr></table>";
		str=str+"<table border=0 width=350 cellpadding=4><tr><td width=52 height=64 align=center>";
		str=str+"<font face=\"MS Outlook\"color=#FF0000 style=\"font-size:30pt\">A</font></td><td>";
		str=str+"<p align=center>"+str1+"</p></td></tr><tr valign=top><td colspan=2 align=center>";
		str=str+"<input type=button name=ok value=\"\u3000\u786E \u5B9A\u3000\" onclick=\"javascript:history.back()\">";
		str=str+"</td></tr></table></td></tr></table></div></body>";
		return str;
	} 
}
