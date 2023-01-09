package com.mzgw.address.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mzgw.address.service.AddressService;
import com.mzgw.dto.AddressVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;

@Controller
@RequestMapping("/address")
public class AddressController {
	
	@Autowired
	AddressService addressService;
	
	/*
	 * @RequestMapping("/privateList") public String privateList() { String url =
	 * "address/privateList";
	 * 
	 * return url; }
	 */
	
	@RequestMapping("/deptList")
	public String deptList() {
		String url = "address/deptList";
		
		return url;
	}
	
	@RequestMapping("/publicList")
	public void publicList(Model model,Criteria cri,@RequestParam(defaultValue = "desc") String nowSort) throws Exception{
		cri.setPerPageNum(11);
		
		Map<String, Object> dataMap = addressService.getEmpList(cri, nowSort);
		
		model.addAllAttributes(dataMap);
	}
	
	@RequestMapping("/privateList")
	public void privateList(@SessionAttribute("loginEmp") EmpVO loginEmp, 
							Model model,
							Criteria cri,
							@RequestParam(defaultValue = "desc") String nowSort) throws Exception{
		cri.setPerPageNum(11);
		
		Map<String, Object> dataMap = addressService.getPrivateList(loginEmp, cri, nowSort);
		
		model.addAllAttributes(dataMap);
	}
	
	@RequestMapping(value = "/insertAddress", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> insertAddress(@RequestBody List<EmpVO> ncnm) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		addressService.insertAddress(ncnm);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/deleteAddress", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteAddress(@RequestBody List<AddressVO> name) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		addressService.deleteAddress(name);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/insertPrivate", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> insertPrivate(@RequestBody AddressVO vo) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		addressService.insertPrivate(vo);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/getPublicListByIndex", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getPublicListByIndex(@RequestBody Criteria cri) throws Exception {
		
		cri.setPerPageNum(11);
		System.out.println("===============================");
		System.out.println("===============================");
		System.out.println("===============================");
		System.out.println("===============================");
		System.out.println("===============================");
		System.out.println("===============================");
		System.out.println("===============================");
		System.out.println(cri.getFirstLetter());
		System.out.println(cri.getLastLetter());
		//System.out.println(cri);
		System.out.println("===============================");
		System.out.println("===============================");
		System.out.println("===============================");
		System.out.println("===============================");
		System.out.println("===============================");
		System.out.println("===============================");
		System.out.println("===============================");
		System.out.println("===============================");
		
		ResponseEntity<Map<String,Object>> entity = null;
		
		Map<String,Object> dataMap = addressService.getEmpListByIndex(cri);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/updatePrivate", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> updatePrivate(@RequestBody AddressVO vo) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		addressService.modifyPrivateAddress(vo);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
}
