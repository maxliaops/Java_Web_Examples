package com.core;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class GetTime {
    //获取系统日期
    public Date getDate(){
        Date dateU = new Date();
        java.sql.Date date = new java.sql.Date(dateU.getTime());
        System.out.println(date);
        return date;
    }
    //获取系统日期和时间
    public String getDateTime(){
        SimpleDateFormat format;
        Date date=null;
        Calendar myDate=Calendar.getInstance();
        myDate.setTime(new java.util.Date());
        date=myDate.getTime();
        format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String rtnStr=format.format(date);
//        String rtnStr=new java.util.Date().toLocaleString();
        return rtnStr;
    }
    //格式化日期时间为“年-月-日 时：分：秒”的格式
    public String formatTime(Date date){
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String str=format.format(date);
        return str;
    }
}
