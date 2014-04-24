// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   CalendarBean.java

package com.mingri.showtime;

import java.util.*;

public class CalendarBean
{

    Calendar calendar;

    public CalendarBean()
    {
        calendar = null;
        calendar = Calendar.getInstance(TimeZone.getTimeZone("PST"));
        Date date = new Date();
        calendar.setTime(date);
    }

    public int getYear()
    {
        return calendar.get(1);
    }

    public String getMonth()
    {
        int i = Integer.parseInt(getMonthInt());
        String as[] = {
            "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", 
            "November", "December"
        };
        if(i > 12)
            return "Unknown to Month";
        else
            return as[i - 1];
    }

    public String getMonthInt()
    {
        String s = "";
        int i = calendar.get(2) + 1;
        if(i < 10)
            return s = "0" + String.valueOf(i);
        else
            return String.valueOf(i);
    }

    public String getDay()
    {
        int i = getDayOfWeek();
        String as[] = {
            "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
        };
        if(i > 7)
            return "Unknown to Day";
        else
            return as[i - 1];
    }

    public int getDayOfWeek()
    {
        return calendar.get(7);
    }

    public String getDate()
    {
        return getYear() + "-" + getMonthInt() + "-" + getDayOfMonth();
    }

    public String getDayOfMonth()
    {
        String s = "";
        int i = calendar.get(5);
        if(i < 10)
        {
            String s1 = "0" + String.valueOf(i);
            return s1;
        } else
        {
            return String.valueOf(calendar.get(5));
        }
    }

    public String getTime()
    {
        return getHour() + ":" + getMinute() + ":" + getSecond();
    }

    public int getHour()
    {
        return calendar.get(11);
    }

    public int getMinute()
    {
        return calendar.get(12);
    }

    public String getSecond()
    {
        String s = "";
        int i = calendar.get(13);
        if(i < 10)
        {
            String s1 = "0" + String.valueOf(i);
            return s1;
        } else
        {
            return String.valueOf(i);
        }
    }

    public String getDateString()
    {
        return getYear() + getMonthInt() + getDayOfMonth();
    }
}
