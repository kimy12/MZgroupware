package com.mzgw.util;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.mzgw.dto.EmpVO;

@ControllerAdvice
public class ExceptionControllerAdvisor {
private static final Logger logger = LoggerFactory.getLogger(ExceptionControllerAdvisor.class);
	
	@ExceptionHandler(SQLException.class)
	public String sqlExceptionPage(Exception e, Model model, HttpSession session) throws SQLException{
		String url = "error/sqlException";
		
		logger.error(e.toString());
		
		EmpVO loginEmp = (EmpVO)session.getAttribute("loginEmp");
		
		model.addAttribute("exception", e);
		model.addAttribute("user", loginEmp!=null ? loginEmp.getName()+"님" : "");
		
		return url;
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionPage(Exception e, Model model, HttpSession session) throws SQLException{
		String url = "error/exception";
		
		logger.error(e.toString());
		
		return url;
	}
}
