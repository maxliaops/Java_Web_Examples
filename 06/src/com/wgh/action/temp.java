package com.wgh.action;

import com.wgh.core.ChStr;

public class temp {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ChStr chStr=new ChStr();
		// TODO 自动生成方法存根
		long a=new java.util.Date().getTime();
		
		System.out.println(a);
		long sum=0;
		for(long i=0;i<1000000000;i++){
			sum=sum+i;
		}
		long b=new java.util.Date().getTime();
		System.out.println(b);
		System.out.println(b-a);
		int h=(int)Math.abs((b-a+10000)/3600000);
		String hour=chStr.formatNO(h,2);
		int m=(int)(b-a+10000)%3600000/60000;
		String minute=chStr.formatNO(m,2);
		int s=(int)((b-a+10000)%3600000)%60000/1000;
		String second=chStr.formatNO(s,2);
		
		System.out.println(hour+":"+minute+":"+second);
		
	}

}
