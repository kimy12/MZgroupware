package com.mzgw.user.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.emp.service.EmpService;
import com.mzgw.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private EmpService empService;
	
	@RequestMapping("/myPage")
	public ModelAndView myPage(@SessionAttribute("loginEmp") EmpVO loginEmp, ModelAndView mnv)throws Exception{
		String url = "/user/myPage";
		
		EmpVO myInfo = empService.getEmp(loginEmp.getId());
		
		mnv.addObject("myInfo", myInfo);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/imgRegist", method = RequestMethod.POST)
	 public String imgRegist(@SessionAttribute("loginEmp") EmpVO loginEmp, EmpVO emp) throws Exception, IOException {
		
		String url = "redirect:/user/myPage";
		
		emp.setEmpl_no(loginEmp.getEmpl_no());
		
		EmpVO empVO = emp;
		
		userService.myPageImgUpdate(empVO);
		
		return url;
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String myPageRegist(@SessionAttribute("loginEmp") EmpVO loginEmp, EmpVO emp) throws Exception, IOException {
		String url = "redirect:/user/myPage";
		
		emp.setEmpl_no(loginEmp.getEmpl_no());
		
		EmpVO empVO = emp;
		
		userService.myPageInfoUpdate(empVO);
		
		return url;
	}
	
	 @RequestMapping(value = "/passUpdate", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	 @ResponseBody
	 public ResponseEntity<String> passworkUpdate(@SessionAttribute("loginEmp") EmpVO loginEmp, @RequestBody EmpVO emp) throws Exception {
		   ResponseEntity<String> entity = null;
			
		   emp.setEmpl_no(loginEmp.getEmpl_no());
			
		   EmpVO empVO = emp;
		   
		   System.out.println(empVO.getPassword());
		   System.out.println(empVO.getEmpl_no());
		   System.out.println("컨트롤ㄹ러");
			
		   userService.passworkUpdate(empVO);
		   
		   entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
			return entity;
	   }
}
