package com.wgh.core;

import java.text.NumberFormat;

public class ChStr {
    public String formatNO(int str, int length) {
        float ver = Float.parseFloat(System.getProperty(
                "java.specification.version"));  //获取JDK的版本
        String laststr = "";
        if (ver < 1.5) {  //JDK1.5以下版本执行的语句
            try {
                NumberFormat formater = NumberFormat.getNumberInstance();	//声明并实例化NumberFormat的一个实例
                formater.setMinimumIntegerDigits(length);					//指定
                laststr = formater.format(str).toString().replace(",", "");
            } catch (Exception e) {
                System.out.println("格式化字符串时的错误信息：" + e.getMessage());	//输出异常信息
            }
        } else {  //JDK1.5版本执行的语句
        	Integer[] arr=new Integer[1];		//声明并初始化数组arr
			arr[0]=new Integer(str);	//将要格式化的数字str赋值给数组arr的第一个元素
            laststr = String.format("%0"+length+"d", arr);
        }
        return laststr;
    }
}
