package com.mzgw.work.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mzgw.dto.WorkReplyVO;
import com.mzgw.util.Criteria;
import com.mzgw.work.service.WorkReplyService;

@RestController
@RequestMapping("/workReply")
public class WorkdReplyController {

	@Autowired
	private WorkReplyService workReplyService;

	@RequestMapping("/list")
	public Map<String, Object> getReplyList(WorkReplyVO wreply, Criteria cri) throws Exception {

		cri.setPerPageNum(3);

		Map<String, Object> map = workReplyService.getWorkReplyListByJno(wreply, cri);

		return map;
	}

	@RequestMapping("/regist")
	public ResponseEntity<String> registReply(WorkReplyVO wreply) throws Exception {

		System.out.println("댓글레지스트까지 옴");

		ResponseEntity<String> entity = null;

		workReplyService.registWorkReply(wreply);

		entity = new ResponseEntity<String>("success", HttpStatus.OK);

		return entity;
	}

	@RequestMapping("/modify")
	public ResponseEntity<String> modifyReply(WorkReplyVO wreply) throws Exception {

		System.out.println("댓글수정까진옴");
		ResponseEntity<String> entity = null;

		System.out.println(wreply.getJob_reply_no());
		System.out.println(wreply.getJob_reply_cont());
		workReplyService.modifyWorkReply(wreply);

		entity = new ResponseEntity<String>("success", HttpStatus.OK);

		return entity;
	}

	@RequestMapping("/remove")
	public ResponseEntity<String> removeReply(WorkReplyVO wreply) throws Exception {

		System.out.println("댓글수정까진옴");
		ResponseEntity<String> entity = null;

		System.out.println(wreply.getJob_reply_no());

		workReplyService.removeWorkReply(wreply);

		entity = new ResponseEntity<String>("success", HttpStatus.OK);

		return entity;
	}

}