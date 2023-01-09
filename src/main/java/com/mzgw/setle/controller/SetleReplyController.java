package com.mzgw.setle.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mzgw.dto.SetleReplyVO;
import com.mzgw.setle.service.SetleReplyService;
import com.mzgw.setle.service.SetleReplyServiceImpl;
import com.mzgw.util.Criteria;

@RestController
@RequestMapping("/setleReply")
public class SetleReplyController {

	@Autowired
	private SetleReplyService setleReplyService;
	
	@RequestMapping("/regist")
	public ResponseEntity<String> registReply(SetleReplyVO reply) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		setleReplyService.registSetleReply(reply);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/remove")
	public ResponseEntity<String> removeReply(SetleReplyVO reply) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		setleReplyService.removeSetleReplyBySetleReplyNo(reply);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/modify")
	public ResponseEntity<String> modifyReply(SetleReplyVO reply) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		setleReplyService.modifySetleReplyBySetleReplyNo(reply);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}

	@RequestMapping("/list")
	public Map<String, Object> getReplyList(SetleReplyVO reply, Criteria cri) throws Exception{
		
		cri.setPerPageNum(3);
	
		Map<String, Object> map = setleReplyService.getSetleReplyListBySetleNo(reply, cri);
		
		
		return map;
	}
}
	
	
	

