package com.mzgw.club.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mzgw.club.service.ClubBoardReplyService;
import com.mzgw.dto.ClubBoardReplyVO;
import com.mzgw.util.Criteria;

@RestController
@RequestMapping("/clubboardReply")
public class ClubBoardReplyController {

	@Autowired
	private ClubBoardReplyService clubBoardReplyService;

	@RequestMapping("/list")
	public Map<String, Object> getReplyList(ClubBoardReplyVO reply, Criteria cri) throws Exception {

		cri.setPerPageNum(3);
		
		Map<String, Object> map = clubBoardReplyService.getClubBoardReplyListByBoardNo(reply, cri);

		return map;
	}
	
	
	@RequestMapping("/regist")
	public ResponseEntity<String> registReply(ClubBoardReplyVO reply) throws Exception{
		
		System.out.println("댓글레지스트까지 옴");
		
		ResponseEntity<String> entity = null;
		
		clubBoardReplyService.registClubBoardReply(reply);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/modify")
	public ResponseEntity<String> modifyReply(ClubBoardReplyVO reply) throws Exception{
		
		System.out.println("댓글수정까진옴");
		ResponseEntity<String> entity = null;
		

		clubBoardReplyService.modifyClubBoardReply(reply);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/remove")
	public ResponseEntity<String> removeReply(ClubBoardReplyVO reply) throws Exception{
		
		System.out.println("댓글수정까진옴");
		ResponseEntity<String> entity = null;
		
		
		clubBoardReplyService.removeClubBoardReply(reply);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}
	

	
}