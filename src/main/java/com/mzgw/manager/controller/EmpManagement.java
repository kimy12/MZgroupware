package com.mzgw.manager.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mzgw.dto.EmpVO;
import com.mzgw.manager.service.ManagerService;
import com.mzgw.util.Criteria;

@Controller
@RequestMapping("/manager")
public class EmpManagement {
	
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("/list")
	public ModelAndView empList(Criteria cri, ModelAndView mnv)throws Exception {
		String url = "manager/empManagement";
		
		Map<String,Object> dataMap = null;
		dataMap = managerService.getEmpList(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(method = RequestMethod.POST, value="/regist")
	public ResponseEntity<String> empRegist(@RequestBody EmpVO emp) throws Exception{
		ResponseEntity<String> entity = null;
		
		managerService.registEmp(emp);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);	
		
		return entity;
	}
	
}
