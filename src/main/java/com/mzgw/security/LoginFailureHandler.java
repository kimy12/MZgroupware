package com.mzgw.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String msg = exception.getMessage();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(msg.substring(0,2).equals("MZ")) {
			out.println("<script>");
			out.println("alert('"+msg+".');");
			out.println("location.href='"+ request.getContextPath() +"/common/loginForm?from=new'");
			out.println("</script>");						
		}else {	
			out.println("<script>");
			out.println("alert('"+msg+".');");
			out.println("location.href='"+ request.getContextPath() +"/common/loginForm'");
			out.println("</script>");			
		}
		
		
	}
	
	
}
