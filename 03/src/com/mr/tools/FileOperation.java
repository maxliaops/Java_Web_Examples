package com.mr.tools;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class FileOperation {

	public static boolean buildJSP(String souPath, String desPath, String title) {        
		FileInputStream fileinputstream = null;
		byte[] bytes = null;
		try {			
			fileinputstream = new FileInputStream(souPath);
			bytes = new byte[1024 * 5];
			fileinputstream.read(bytes);
			fileinputstream.close();
			String templateContent = new String(bytes);			
			File file = new File(desPath);
			if(!file.exists()){
				file.mkdir();
			}
			desPath=desPath+"/index.jsp";				
			FileOutputStream fileoutputstream = new FileOutputStream(desPath);
			byte tag_bytes[] = templateContent.getBytes();
			fileoutputstream.write(tag_bytes);
			fileoutputstream.close();
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

}
