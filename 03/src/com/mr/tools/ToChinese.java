package com.mr.tools;



public class ToChinese {
    public static String toChinese(String strvalue) {
        try {
            if (strvalue == null) {
                return "";
            } else {
                strvalue = new String(strvalue.getBytes("ISO8859_1"), "gb2312");
                return strvalue;
            }
        } catch (Exception e) {
            return "";
        }
    }

}
