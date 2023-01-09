package com.mzgw.setle.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mzgw.dto.SetleEvlVO;
import com.mzgw.setle.service.SetleEvlService;
import com.mzgw.util.Criteria;

@RestController
@RequestMapping("/setleEvl")
public class SetleEvlController {

	@Autowired
	private SetleEvlService setleEvlService;
	
	@RequestMapping("/regist")
	public ResponseEntity<String> registevl(SetleEvlVO evl) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		setleEvlService.registSetleEvl(evl);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/remove")
	public ResponseEntity<String> removeevl(SetleEvlVO evl) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		setleEvlService.removeSetleEvl(evl);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/modify")
	public ResponseEntity<String> modifyevl(SetleEvlVO evl) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		setleEvlService.modifySetleEvl(evl);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}

	@RequestMapping("/list")
	public Map<String, Object> getevlList(SetleEvlVO evl, Criteria cri) throws Exception{
		
		cri.setPerPageNum(2);
	
		Map<String, Object> map = setleEvlService.getSetleEvlListBySetleNo(evl.getSetleNo(), cri);
		
		
		return map;
	}
	
}
