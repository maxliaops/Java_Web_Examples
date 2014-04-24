package com.core;

import javax.servlet.http.HttpServletRequest;

import com.jspsmart.upload.Request;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: MR</p>
 * @version 1.0
 */

public class ParamUtils {

    public static String getParameter(HttpServletRequest request,
                                      String paramName) {
        return getParameter(request, paramName, false);
    }
    //对空字符串进行处理
    public static String getParameter(HttpServletRequest request,
                                      String paramName, String defaultStr) {
        String temp = request.getParameter(paramName);

        if (temp != null) {
            if (temp.equals("")) {
                return defaultStr;
            } else {
                return nullToString(temp);
            }
        } else {
            return defaultStr;
        }

    }

    public static String getEscapeHTMLParameter(HttpServletRequest request,
                                                String paramName) {
        return nullToString(StringUtils.escapeHTMLTags(ParamUtils.getParameter(
            request, paramName, true)));
    }
    public static String getParameter(HttpServletRequest request,
                                      String paramName, boolean emptyStringsOK) {
        String temp = request.getParameter(paramName);
        if (temp != null) {
            if (temp.equals("") && !emptyStringsOK) {
                return "";
            } else {
                return temp;
            }
        } else {
            return "";
        }
    }

    public static int getIntParameter(HttpServletRequest request,
                                      String paramName, int defaultNum) {
        String temp = request.getParameter(paramName);
        if (temp != null && !temp.equals("")) {
            int num = defaultNum;
            try {
                num = Integer.parseInt(temp);
            } catch (Exception ignored) {}
            return num;
        } else {
            return defaultNum;
        }
    }

    public static int getIntParameter(HttpServletRequest request,
                                      String paramName) {
        return getIntParameter(request, paramName, 0);
    }

    public static String nullToString(String oldString) {
        if (oldString == null) {
            return "";
        }
        return oldString;
    }
    public static String nullToString(String oldString,String defaultValue) {
        oldString=nullToString(oldString);
        if("".equals(oldString)){
            return defaultValue;
        }
        return oldString;
    }
//修改使用的方法
    public static String getRequestString(HttpServletRequest request,String s){
        s=nullToString(s).trim();
        s=ParamUtils.getEscapeHTMLParameter(request, s);
        s=StringUtils.toChinese(s);
        s=StringUtils.toUnicode(s);
        s=StringUtils.StringtoSql(s);
        return s;
    }
//添加使用的方法
    public static String getRequestString(Request request, String s) {
        s=nullToString(s).trim();
        s=ParamUtils.getEscapeHTMLParameter(request, s);
        //转码
       // s=StringUtils.toChinese(s);
        s=StringUtils.toUnicode(s);
        s=StringUtils.StringtoSql(s);
        return s;
    }

    public static String getSqlString(String s){
        s=StringUtils.SqltoString(s);
        s=StringUtils.toChinese(s);
        s=nullToString(s).trim();
        return s;
    }

    public static String getEscapeHTMLParameter(Request request, String s) {
        return nullToString(StringUtils.escapeHTMLTags(request.getParameter(s)));
    }

    public static int getIntParameter(Request request, String s) {
        int defaultNum=0;
        String temp = request.getParameter(s);
        if (temp != null && !temp.equals("")) {
            int num = defaultNum;
            try {
                num = Integer.parseInt(temp);
            } catch (Exception ignored) {}
            return num;
        } else {
            return defaultNum;
        }
    }
}
