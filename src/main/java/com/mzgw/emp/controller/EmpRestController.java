package com.mzgw.emp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mzgw.dto.EmpVO;
import com.mzgw.emp.service.EmpService;

@RestController
@RequestMapping("/emp")
public class EmpRestController {
	
	@Autowired
	private EmpService empService;
	
	
	
	@RequestMapping("/idCheck")
	public ResponseEntity<String> idCheck(String id) throws Exception {
		ResponseEntity<String> entity = null;

		String checkId = empService.getCheckId(id);

		if (checkId != null) {
			entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("", HttpStatus.OK);
		}

		return entity;
	}
	
	@RequestMapping(method = RequestMethod.POST, value="/changeEmpInfo")
	public ResponseEntity<String> empRegist(@RequestBody EmpVO emp) throws Exception{
		ResponseEntity<String> entity = null;
		
		empService.modifyNewEmp(emp);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);	
		
		return entity;
	}
	
	@RequestMapping("/EmpListByDepart")
	public ResponseEntity<List<EmpVO>> empListByDepartName(String depart) throws Exception{
		ResponseEntity<List<EmpVO>> entity = null;
		
		List<EmpVO> empList = empService.getEmpListByDept(depart);
		
		entity = new ResponseEntity<List<EmpVO>>(empList,HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/updateLastCheck")
	public ResponseEntity<String> updateLastCheck(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception {
		ResponseEntity<String> entity = null;

		empService.updateLastCheck(loginEmp.getId());

		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		

		return entity;
	}
}
