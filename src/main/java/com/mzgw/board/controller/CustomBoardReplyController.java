package com.mzgw.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mzgw.board.service.BoardReplyService;
import com.mzgw.dto.BReplyVO;
import com.mzgw.util.Criteria;

@RestController
@RequestMapping("/boardReply")
public class CustomBoardReplyController {

	@Autowired
	private BoardReplyService boardReplyservice;

	@RequestMapping("/list")
	public Map<String, Object> getReplyList(BReplyVO breply, Criteria cri) throws Exception {

		cri.setPerPageNum(3);
		
		Map<String, Object> map = boardReplyservice.getBoardReplyListByBoardNo(breply, cri);

		return map;
	}
	
	
	@RequestMapping("/regist")
	public ResponseEntity<String> registReply(BReplyVO breply) throws Exception{
		
		System.out.println("댓글레지스트까지 옴");
		
		ResponseEntity<String> entity = null;
		
		boardReplyservice.registBoardReply(breply);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/modify")
	public ResponseEntity<String> modifyReply(BReplyVO breply) throws Exception{
		
		System.out.println("댓글수정까진옴");
		ResponseEntity<String> entity = null;
		
		System.out.println(breply.getBreply_no());
		System.out.println(breply.getBreply_cont());
		boardReplyservice.modifyBoardReply(breply);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/remove")
	public ResponseEntity<String> removeReply(BReplyVO breply) throws Exception{
		
		System.out.println("댓글수정까진옴");
		ResponseEntity<String> entity = null;
		
		System.out.println(breply.getBreply_no());
		
		boardReplyservice.removeBoardReply(breply);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}
	
	
	
	
	
	
}