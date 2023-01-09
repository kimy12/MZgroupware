package com.mzgw.setle.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mzgw.dto.EmpVO;
import com.mzgw.dto.SetleVO;
import com.mzgw.setle.service.SetleService;
import com.mzgw.util.Criteria;

@RestController
@RequestMapping("/setleMain")
public class SetleRestController {
	
	@Autowired
	SetleService setleService;
	
	@RequestMapping("/myList")
	public ResponseEntity<Map<String, Object>> myList(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Criteria cri = new Criteria();
		
		cri.setPerPageNum(5);
		cri.setPage(1);
		
		Map<String, Object> dataMap = setleService.getSetleListByWriterNo(cri, "desc",loginEmp,-1);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	
	@RequestMapping("/trash")
	public ResponseEntity<Map<String, Object>> trash(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Criteria cri = new Criteria();
		
		cri.setPerPageNum(5);
		cri.setPage(1);
		
		Map<String, Object> dataMap = setleService.getDeleteSetleListByWriterNo(cri, "desc", loginEmp);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	
	@RequestMapping("/depart")
	public ResponseEntity<Map<String, Object>> depart(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Criteria cri = new Criteria();
		
		cri.setPerPageNum(5);
		cri.setPage(1);
		
		Map<String, Object> dataMap = setleService.getSetleListByDepart(cri, "desc", loginEmp);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	
	@RequestMapping("/acceptList")
	public ResponseEntity<Map<String, Object>> acceptList(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Criteria cri = new Criteria();
		
		cri.setPerPageNum(5);
		cri.setPage(1);
		
		Map<String, Object> dataMap = setleService.getSetleLisBySetleEmpSetleNo(cri, "desc", loginEmp);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	
}
