package com.core;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: MR</p>
 * @version 1.0
 */
//对字符串进行GBK编码
public class StringUtils {
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

//对输入的字符串进行一次编码转换，防止SQL注入
    public static String StringtoSql(String str) {
        str = nullToString(str, "");
        try {
            str = str.trim().replace('\'', (char) 1);
        } catch (Exception e) {
            return "";
        }
        return str;
    }

//对字符串进行二次编码转换，防止出库时异常
    public static String SqltoString(String str) {
        str = nullToString(str, "");
        try {
            str = str.replace( (char) 1, '\'').trim();
        } catch (Exception e) {
            return "";
        }
        return str;
    }

//对字符串进行Unicode编码
    public static String toUnicode(String strvalue) {
        try {
            if (strvalue == null) {
                return null;
            } else {
                strvalue = new String(strvalue.getBytes("GBK"), "ISO8859_1");
                return strvalue;
            }
        } catch (Exception e) {
            return "";
        }
    }

//判断是否为当前时间
    public static boolean compareNowTime(String date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date d = null;
        try {
            d = format.parse(date);  //返回一个Date类的实例
        } catch (ParseException ex) {
        }
        if (System.currentTimeMillis() - 259200000 < d.getTime()) {
            return true;
        }
        return false;
    }

//判断用户输入的是否是数字或字母
    public static boolean isID(String str) {
        if (str != null && str.length() > 0) {
            if (str.charAt(0) < 57 && str.charAt(0) > 48) {
                return false;
            }
            for (int i = 0; i < str.length(); i++) {
                if (str.charAt(i) < 65 && str.charAt(i) > 57 || str.charAt(i) > 90
                    && str.charAt(i) < 97 && str.charAt(i) != 95 || str.charAt(i) > 122 ||
                    str.charAt(i) < 48) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }

//对输入数据中的HTML字符进行转换
    public static final String escapeHTMLTags(String input) {
        if (input == null || input.length() == 0) {
            return input;
        }
        StringBuffer buf = new StringBuffer(input.length());
        char ch = ' ';
        for (int i = 0; i < input.length(); i++) {
            ch = input.charAt(i);
            if (ch == '<') {
                buf.append("&lt;");
            } else if (ch == '>') {
                buf.append("&gt;");
            } else {
                buf.append(ch);
            }
        }
        String str=buf.toString();
        str=str.replace(" ","&nbsp;");
        str=str.replace("\r\n","<br>");
        return str;
    }

//处理字符串中的空值
    public static final String nullToString(String v, String toV) {
        if (v == null) {
            v = toV;
        }
        return v;
    }

// 对SQL语句中输入的空值进行处理
    public static final String SqlToLink(String str) {
        str = StringUtils.nullToString(str, "");
        if ("".equals(str)) {
            str = " LIKE '%' ";
        } else {
            str = (" LIKE '%" + str + "%' ");
        }
        return str;
    }

//将整型值转换为字符串
    public static final String SqlToLink(int i) {
        String str = "";
        try {
            str = new Integer(i).toString();
        } catch (Exception e) {}
        if (i == -1) {
            str = "";
        }
        return StringUtils.SqlToLink(str);
    }
}
