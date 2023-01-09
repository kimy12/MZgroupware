package com.mzgw.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MakeFileToZip {
	
	public static void makeZip(List<String> attach, String zipName, HttpServletRequest req, HttpServletResponse resp) throws IOException { 
		File zipFile = new File(zipName);
		String browser = req.getHeader("User-Agent");
		
		if(browser.contains("MSIE") || browser.contains("Chrome")){
			zipName = URLEncoder.encode(zipName, "UTF-8").replaceAll("\\+", "%20");         
	     }else{		             
	    	 zipName = new String(zipName.getBytes("UTF-8"), "ISO-8859-1");
	     }	
		ZipOutputStream zos = new ZipOutputStream( new FileOutputStream( zipFile)); 
		byte[] buf = new byte[4096];
		FileInputStream in = null; 
		
		resp.setHeader("Content-Disposition", "attachment;filename=\"" + zipName +"\"");             
	    resp.setContentType("application/octer-stream");
	    resp.setHeader("Content-Transfer-Encoding", "binary;");
		
		for(String atch : attach) {
			File downloadFile = new File(atch);
			String sendFileName = MakeFileName.parseFileNameFromUUID(downloadFile.getName(), "\\$\\$");
			in = new FileInputStream(downloadFile); 
			zos.putNextEntry( new ZipEntry(sendFileName)); 
			int len; 
			while( (len = in.read(buf)) > 0) { 
				zos.write( buf, 0, len); 
			} 
			
		}
		
		zos.closeEntry(); 
		in.close(); 
		zos.close(); 
		
		try(FileInputStream fis = new FileInputStream(zipName);
	            ServletOutputStream sos = resp.getOutputStream();){

	          byte[] b = new byte[4096];
	          int data = 0;

	          while((data=(fis.read(b, 0, b.length))) != -1){		             
	            sos.write(b, 0, data);		             
	          }
	          sos.flush();
	          
	   } catch(Exception e) {
	          throw e;
	        }

	}
}
