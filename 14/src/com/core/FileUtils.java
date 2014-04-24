package com.core;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: MR</p>
 * @author wgh
 * @version 2.0
 */

public class FileUtils {
    public FileUtils() {
    }

    public static boolean FileDel(HttpServletRequest request ,String path) {
        if(path==null) return false;
        path=request.getSession().getServletContext().getRealPath(path);
        System.out.println(path+"  ]path");
        File f = new File(path);
        if (!f.exists()) {
            return false;
        } else {
            if (f.delete()) {
                return true;
            }
        }
        return false;
    }

    public static void main(String[] args) {
        FileUtils fileUtils1 = new FileUtils();
    }

}
