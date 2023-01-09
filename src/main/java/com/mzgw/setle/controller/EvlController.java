package com.mzgw.setle.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mzgw.dto.EvlVO;
import com.mzgw.setle.service.SetleEvlService;
import com.mzgw.util.Criteria;

@Controller
@RequestMapping("/evl")
public class EvlController {
	
	@Autowired 
	SetleEvlService setleEvlService;
	
	@RequestMapping("/result")
	public ModelAndView regist(Criteria cri,ModelAndView mnv) throws Exception{
		String url ="setle/evl";
		
		Map<String, Object> dataMap = setleEvlService.getEvlResultAll(cri);
		System.out.println("===========================");
		System.out.println("===========================");
		System.out.println("===========================");
		System.out.println("===========================");
		System.out.println("===========================");
		dataMap.get("evlListAll");
		System.out.println("===========================");
		System.out.println("===========================");
		System.out.println("===========================");
		System.out.println("===========================");
		System.out.println("===========================");
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
		
	}
}
