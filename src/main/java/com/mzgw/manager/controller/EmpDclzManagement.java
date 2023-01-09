package com.mzgw.manager.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mzgw.depart.service.DepartService;
import com.mzgw.dto.DclzManagerVO;
import com.mzgw.dto.DclzMeditationVO;
import com.mzgw.dto.DclzVO;
import com.mzgw.manager.service.DclzManagerService;
import com.mzgw.util.Criteria;

@Controller
@RequestMapping("/dclzmanager")
public class EmpDclzManagement {
	@Autowired
	private DclzManagerService dclzManagerService;
	@Autowired 
	private DepartService departService;

	@RequestMapping("/list")
	public ModelAndView empDclzStatus(DclzVO dclz, Criteria cri, ModelAndView mnv) throws Exception {
		String url = "manager/empDclzStatus";
		
		System.out.println(cri.getKeyword());
		System.out.println(cri.getSearchType());
		
		
		Map<String, Object> dataMap = null;
		dataMap = dclzManagerService.getDclzManagerList(cri,dclz);
		dataMap.put("departList",departService.getDepartList());
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(method = RequestMethod.POST, value="") 
	@ResponseBody
	public ResponseEntity<Map<String, Object>>getDclzInfoToJSON (@RequestBody DclzManagerVO dmv,Criteria cri) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		System.out.println("cri="+cri.getPerPageNum());
		System.out.println("cri="+cri.getPage());
		
		Map<String, Object> dataMap = dclzManagerService.getDclzWeekList(dmv);
		entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}

	@RequestMapping("/mdatReqst")
	public ModelAndView mdatReqst(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "manager/mdatReqst";
		
		Map<String,Object> dataMap = dclzManagerService.getManagerDclzMediationList(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modifyDclzMed")
	@ResponseBody
	public ResponseEntity<String>modifyDclzMed (@RequestBody DclzMeditationVO dclzmed) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		dclzManagerService.modifyDclzMediation(dclzmed);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	
	@RequestMapping("/empAnnualStatus")
	public ModelAndView empAnnualStatus(Criteria cri, ModelAndView mnv)throws Exception {
		String url = "manager/empAnnualStatus";
		
		Map<String,Object> dataMap = dclzManagerService.getManagerAnnualList(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/removeDclzMed")
	@ResponseBody
	public ResponseEntity<String>removeDclzMed (@RequestBody DclzMeditationVO dclzmed) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		dclzManagerService.removeDclzMediation(dclzmed);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
}
