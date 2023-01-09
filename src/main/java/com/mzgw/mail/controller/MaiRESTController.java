package com.mzgw.mail.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mzgw.dto.EmpVO;
import com.mzgw.mail.service.MailService;
import com.mzgw.util.Criteria;

@RestController
@RequestMapping("/mailMain")
public class MaiRESTController {
	
	@Autowired
	private MailService mailService;

	@RequestMapping("/sendMail")
	public ResponseEntity<Map<String, Object>> sendList(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Criteria cri = new Criteria();
		
		cri.setPerPageNum(5);
		cri.setPage(1);
		
		Map<String, Object> dataMap = mailService.getSendMailList(loginEmp, cri, "desc");
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	
	@RequestMapping("/receivedMail")
	public ResponseEntity<Map<String, Object>> receivedMail(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Criteria cri = new Criteria();
		
		cri.setPerPageNum(5);
		cri.setPage(1);
		
		Map<String, Object> dataMap = mailService.getReceMailList(loginEmp, cri, "desc");
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	
	@RequestMapping("/getdashboardAll")
	public ResponseEntity<Map<String, Object>> getdashboardAll(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> dataMap = mailService.getdashboardAll(loginEmp);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	
	
	@RequestMapping("/getdashboardTrash")
	public ResponseEntity<Map<String, Object>> getdashboardTrash(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> dataMap = mailService.getdashboardTrash(loginEmp);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
}
