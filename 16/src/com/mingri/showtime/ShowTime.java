package com.mingri.showtime;

import java.util.*;

public class ShowTime {
	private Date date = null;
	private int yy; // 保存由Date类中getYear()方法返回的整型数值
	private int mm; // 保存由Date类中getMonth()方法返回的整型数值
	private int dd; // 保存由Date类中getDate()方法返回的整型数值
	private String sy;
	private String sm;
	private String sd;

	public ShowTime() {
		date = new Date();
		yy = date.getYear() + 1900; // 只有加上1900才是系统当前的年份
		mm = date.getMonth() + 1; // 只有加上1才是系统当前的月份
		dd = date.getDate();
		sy = String.valueOf(yy); // 将整型yy转化为字符串类型
		sm = String.valueOf(mm); // 将整型mm转化为字符串类型
		sd = String.valueOf(dd); // 将整型dd转化为字符串类型
		// 如果月份是1位数在前面加上"0"，即如果是1月份那么显示的就是"01"
		if (sm.length() == 1) {
			sm = "0" + sm;
		}
		if (sd.length() == 1) {
			sd = "0" + sd;
		}
	}

	public String getDateString() {
		return sy + sm + sd;
	}

	public String getDate() {
		return sy + "-" + sm + "-" + sd;
	}
}
