package com.mzgw.work.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;
import com.mzgw.work.service.WorkService;

@RestController
@RequestMapping("/workMain")
public class WorkRestController {

	@Autowired
	WorkService workService;
	
	@RequestMapping("/newList")
	public ResponseEntity<Map<String, Object>> myList(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		
		Map<String, Object> dataMap = workService.getWorkBySttus(0, loginEmp);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	
	@RequestMapping("/proList")
	public ResponseEntity<Map<String, Object>> processList(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		
		Map<String, Object> dataMap = workService.getWorkBySttus(1, loginEmp);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	@RequestMapping("/comList")
	public ResponseEntity<Map<String, Object>> completeList(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		
		Map<String, Object> dataMap = workService.getWorkBySttus(2, loginEmp);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	@RequestMapping("/stoList")
	public ResponseEntity<Map<String, Object>> stopList(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		
		Map<String, Object> dataMap = workService.getWorkBySttus(3, loginEmp);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	
	
}
