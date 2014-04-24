package com.bwm.string;

import java.io.*;

/**
 *class explain:String deal with
 *set up name:  crazyadept
 *set up time:	11/25/2004
 */
public class Str {

    /**
     *output parameter: GB2312
     *input parameter:  iso-8859-1
     *modify time:      11/29/2004
     */
    public String toChinese(String str) {
        if (str == null || str.length() < 1) {
            str = "";
        } else {
            try {
                str = (new String(str.getBytes("iso-8859-1"), "GB2312"));
            } catch (UnsupportedEncodingException e) {
                System.err.print(e.getMessage());
                e.printStackTrace();
                return str;
            }
        }
        return str;
    }

    /**
     *output parameter: it's not have "'"
     *input parameter:  it's have "'"
     *modify time:      11/29/2004
     */
    public String dbEncode(String str) {
        if (str == null) {
            str = "";
        } else {
            try {
                str = str.replace('\'', (char) 1).trim();
            } catch (Exception e) {
                System.err.print(e.getMessage());
                e.printStackTrace();
                return str;
            }
        }
        return str;
    }
}
