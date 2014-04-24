package com.mingri.chinese;

import java.io.*;

public class ToChinese {
	public String trans(String str) {
		String result = null;
		byte temp[];
		try {
			temp = str.getBytes("iso-8859-1");
			result = new String(temp);
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
