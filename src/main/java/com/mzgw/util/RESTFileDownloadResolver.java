package com.mzgw.util;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RESTFileDownloadResolver {

	
	public static void fileDownload(String uploadPath, String fileName, HttpServletRequest req, HttpServletResponse resp) throws Exception{
		File downloadFile = new File(uploadPath + File.separator + fileName);
		String browser = req.getHeader("User-Agent");
		String sendFileName = MakeFileName.parseFileNameFromUUID(downloadFile.getName(), "\\$\\$");
		
		 if(browser.contains("MSIE") || browser.contains("Chrome")){  		             
			 sendFileName = URLEncoder.encode(sendFileName, "UTF-8").replaceAll("\\+", "%20");
			              
	     }else{		             
	    	 sendFileName = new String(sendFileName.getBytes("UTF-8"), "ISO-8859-1");
	     }
		
		resp.setHeader("Content-Disposition", "attachment;filename=\"" + sendFileName +"\"");             
	    resp.setContentType("application/octer-stream");
	    resp.setHeader("Content-Transfer-Encoding", "binary;");
	    
	    try(FileInputStream fis = new FileInputStream(downloadFile);
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
