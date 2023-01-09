package com.mzgw.push.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mzgw.dto.EmpVO;
import com.mzgw.dto.PushVO;
import com.mzgw.push.service.PushService;

@RestController
@RequestMapping("/push")
public class pushRestController {

	@Autowired
	private PushService pushService;
	
	@RequestMapping("/list")
	private ResponseEntity<List<PushVO>> sendPushList(@SessionAttribute("loginEmp") EmpVO loginEmp)throws Exception{
		
		ResponseEntity<List<PushVO>> entity = null;
				
		List<PushVO> unreadPushListByEmplNo = pushService.getUnreadPushListByEmplNo(loginEmp.getEmpl_no());
		
		
		entity = new ResponseEntity<List<PushVO>>(unreadPushListByEmplNo,HttpStatus.OK);
		
		return entity;
		
	}
	
	
	@RequestMapping("/newPush")
	private ResponseEntity<PushVO> sendNewPush(@SessionAttribute("loginEmp") EmpVO loginEmp)throws Exception{
		
		ResponseEntity<PushVO> entity = null;
		
		PushVO newPush = pushService.getNewPush(loginEmp);
		
		entity = new ResponseEntity<PushVO>(newPush, HttpStatus.OK);
		
		return null;
		
	}
	
	@RequestMapping("/read")
	private ResponseEntity<String> readPush(int pushNo)throws Exception{
		
		ResponseEntity<String> entity = null;
		
		pushService.changeRead(pushNo);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
}
