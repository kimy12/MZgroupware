package com.mzgw.security;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.mzgw.dto.EmpVO;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	
	private String savePath = "c:\\mzgw";
	private String saveFileName = "loginUser_log.csv";
	
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		User user = (User)authentication.getDetails();
		EmpVO loginEmp = user.getEmpVO();
		
		if(loginEmp == null) {
			return;
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("loginEmp", loginEmp);
		session.setMaxInactiveInterval(60*60);
		
		String tag = "[login:emp]";
		String log = tag 
					+ loginEmp.getId()+","
					+ loginEmp.getPhone()+","
					+ loginEmp.getEmail()+","
					+ request.getRemoteAddr()+","
					+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		
		File file = new File(savePath);
		file.mkdirs();
		
		String logFilePath = savePath + File.separator + saveFileName;
 
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		

		out.write(log);
		out.newLine();
		out.close();
		 
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
	
}
