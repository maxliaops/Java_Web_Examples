package com.mr.tools;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidateExpression {
	// 校验Email地址
	public static boolean checkemail(String email) {
		String regex = "[a-zA-Z][\\w_]+@\\w+(\\.\\w+)+";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(email);
		return m.matches();
	}
	// MD5加密
	public static String encodeMD5(String str) {
		if (str == null) {
			return null;
		}
		StringBuilder sb = new StringBuilder();
		try {
			MessageDigest code = MessageDigest.getInstance("MD5");
			code.update(str.getBytes());
			byte[] bs = code.digest();
			for (int i = 0; i < bs.length; i++) {
				int v = bs[i] & 0xFF;
				if (v < 16) {
					sb.append(0);
				}
				sb.append(Integer.toHexString(v));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return sb.toString().toUpperCase();
	}

	// 删除字符串中的指定内容
	public static String deleteString(String oldString, String del) {
		String oldStrings[] = oldString.split(",");
		String newStrings[] = new String[oldStrings.length - 1];
		int j = 0;
		for (int i = 0; i < oldStrings.length; i++) {
			if (!del.equals(oldStrings[i])) {
				newStrings[j] = oldStrings[i];
				j++;
			}
		}
		String sy = ",";
		String newString = "";
		for (int a = 0; a < newStrings.length; a++) {
			if (a == newStrings.length - 1) {
				sy = "";
			}

			newString = newString + newStrings[a] + sy;
		}

		return newString;
	}

	public static void main(String[] args) {
		String str1="明日,科技,编程词典,编程字典,编程理念";
		
		
		String regex="(^编程理念,)|(,编程理念,)|(,编程理念$)";
		String b=str1.replaceAll(regex,"");
		
		
		System.out.println(b);
		
	}
	
	
	
	

}
