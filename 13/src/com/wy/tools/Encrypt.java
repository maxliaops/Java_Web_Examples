package com.wy.tools;

import java.security.*;
import java.text.DateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Encrypt {

	// 该方法将密码进行MD5的加密，这个方法为静态方法，可以通过类名进行直接访问
	public static String encode(String str) {
		if (str == null) // 当参数str为空，直接通过return关键字进行返回
			return null;
		StringBuilder sb = new StringBuilder();
		try {
			MessageDigest code = MessageDigest.getInstance("MD5");
			code.update(str.getBytes());
			byte[] bs = code.digest();
			for (int i = 0; i < bs.length; i++) {
				int v = bs[i] & 0xFF;
				if (v < 16)
					sb.append(0);
				sb.append(Integer.toHexString(v));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return sb.toString().toUpperCase();
	}

	// 该方法返回的系统的时间，也是静态方法
	public static String currentlyTime() {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL);
		return dateFormat.format(date);
	}
	// 该方法将参数内容进行转码，也是静态方法
	public static String toChinese(String strvalue) {
		try {
			if (strvalue == null) {
				return "";
			} else {
				strvalue = new String(strvalue.getBytes("ISO8859_1"), "GBK");
				return strvalue;
			}
		} catch (Exception e) {
			return "";
		}

	}

}
