package com.mr.webiter;

import java.io.UnsupportedEncodingException;

public class A {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String account= new String("sdfsdf ");
		try {
			account = new String(account.getBytes("ISO8859_1"),"gbk");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
