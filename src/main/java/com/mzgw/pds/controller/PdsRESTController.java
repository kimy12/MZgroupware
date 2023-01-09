package com.mzgw.pds.controller;

import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mzgw.depart.service.DepartService;
import com.mzgw.dto.DeptVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.pds.service.PdsDepService;
import com.mzgw.pds.service.PdsFavService;
import com.mzgw.pds.service.PdsPrivateService;
import com.mzgw.pds.service.PdsPublicService;
import com.mzgw.util.Criteria;

@RestController
@RequestMapping("/PdsRest")
public class PdsRESTController {
	
	@Resource(name="pdsPrivateService")
	private PdsPrivateService pdsPrivateService;
	
	@Resource(name="pdsPublicService")
	private PdsPublicService pdsPublicService;
	
	@Resource(name="pdsDepService")
	private PdsDepService pdsDepService;
	
	@Autowired 
	PdsFavService pdsFavService;

	@Autowired
	DepartService departService;
	
	@RequestMapping("/pdsFolders")
	public ResponseEntity<Map<String, Object>> pdsFolders(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Criteria cri = new Criteria();
		
		cri.setPerPageNum(5);
		cri.setPage(1);
		
		Map<String, Object> dataMap =  pdsPublicService.getPdsPublicService( cri, "desc");
		
		//Map<String, Object> dataMapForRefrn = pdsPrivateService.getRefrnList(loginEmp);
		
		List<DeptVO> departList = departService.getDepartList();
		dataMap.put("departList", departList);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	
	@RequestMapping("/pdsPrivateFolders")
	public ResponseEntity<Map<String, Object>> pdsPrivateFolders(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Criteria cri = new Criteria();
		
		cri.setPerPageNum(5);
		cri.setPage(1);
		
		Map<String, Object> dataMap = pdsPrivateService.getPdsPrivateService(loginEmp, cri, "desc");
		
		//Map<String, Object> dataMapForRefrn = pdsPrivateService.getRefrnList(loginEmp);
		
		List<DeptVO> departList = departService.getDepartList();
		dataMap.put("departList", departList);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	
	@RequestMapping("/pdsDepFolders")
	public ResponseEntity<Map<String, Object>> pdsDepFolders(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Criteria cri = new Criteria();
		
		cri.setPerPageNum(5);
		cri.setPage(1);
		
		Map<String, Object> dataMap = pdsDepService.getPdsDepService(loginEmp, cri, "desc");
		
		//Map<String, Object> dataMapForRefrn = pdsPrivateService.getRefrnList(loginEmp);
		
		List<DeptVO> departList = departService.getDepartList();
		dataMap.put("departList", departList);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}

	@RequestMapping("/fav")
	public ResponseEntity<Map<String, Object>> pdsFavList(@SessionAttribute("loginEmp") EmpVO loginEmp) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Criteria cri = new Criteria();
		
		cri.setPerPageNum(5);
		cri.setPage(1);
		
		Map<String, Object> dataMap = pdsFavService.MyFavListAll(loginEmp, cri, "desc");
		
		//Map<String, Object> dataMapForRefrn = pdsPrivateService.getRefrnList(loginEmp);
		
		List<DeptVO> departList = departService.getDepartList();
		dataMap.put("departList", departList);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
				
		return entity;
		
	}
	

	
	
}
