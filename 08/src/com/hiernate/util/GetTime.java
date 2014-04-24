package com.hiernate.util;      	//将该类保存在com.hibernate.util包下
import java.text.DateFormat;		//导入java.text.DateFormat类
import java.text.ParseException;	//导入java.text.ParseException类
import java.text.SimpleDateFormat;	//导入java.text.SimpleDateFormat类
import java.util.Calendar;			//导入java.util.Calendar类
import java.util.Date;				//导入java.util.Date类
public class GetTime {
	
//	判断date1是否在date2之前
	public static boolean isDateBefore(String date1,String date) {
		boolean b = true;									//根据该方法的返回值设置变量
		DateFormat df = DateFormat.getDateTimeInstance();  //获得时间格式，为系统默认的格式
    try {
		  b=df.parse(date1).before(df.parse(date));        //判断date1是否在date2之前
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		return b;
	}
	//编写获得系统日期的方法．
	public static Date getDate(){								//以Date对象为返回值创建getDate()方法
		Date dateU = new Date();                                  //创建Date类对象
		java.sql.Date date= new java.sql.Date(dateU.getTime());   //getTime()方法可得到当前系统的日期
	    return date;
	}
	//编写获得日期和时间的方法．
	public static String  getDateTime(){						//该方法返回值为String类型
		SimpleDateFormat format;                                //simpleDateFormat类使得可以选择任何用户定义的日期-时间格式的模式
		Date date = null;
		Calendar myDate = Calendar.getInstance();               //Calendar 的方法 getInstance，以获得此类型的一个通用的对象
		myDate.setTime(new java.util.Date());                   //使用给定的 Date 设置此 Calendar 的时间
		date = myDate.getTime();                                //返回一个表示此 Calendar 时间值（从历元至现在的毫秒偏移量）的 Date 对象
		format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置时间格式为：年、月、日、时、分、秒
		String strRtn = format.format(date);                    //将给定的 Date 格式化为日期/时间字符串，并将结果赋值给　给定的 String
		return strRtn;
	}
}
