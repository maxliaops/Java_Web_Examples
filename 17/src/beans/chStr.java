// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   chStr.java

package beans;


public class chStr
{

    public chStr()
    {
    }

    public String chStr(String str)
    {
        if(str == null)
            str = "";
        else
            try
            {
                str = (new String(str.getBytes("iso-8859-1"), "GB2312")).trim();
            }
            catch(Exception e)
            {
                e.printStackTrace(System.err);
            }
        return str;
    }

    public String convertStr(String str1)
    {
        if(str1 == null)
            str1 = "";
        else
            try
            {
                str1 = str1.replaceAll(" ", "&nbsp;");
                str1 = str1.replaceAll("\r\n", "<br>");
            }
            catch(Exception e)
            {
                e.printStackTrace(System.err);
            }
        return str1;
    }
}
