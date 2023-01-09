package com.mzgw.dclz.controller;

import java.net.InetAddress;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mzgw.dclz.service.DclzService;
import com.mzgw.dto.DclzMeditationVO;
import com.mzgw.dto.DclzVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;


@Controller
@RequestMapping("/dclz")
public class DclzStatusController {
	
	@Autowired
	private DclzService dclzService;
	

	@RequestMapping("/annualList")
	public ModelAndView annualList(@SessionAttribute("loginEmp") EmpVO emp, Criteria cri, ModelAndView mnv) throws Exception {
		String url = "dclz/annualList";
		
		Map<String,Object> dataMap = dclzService.getAnnualList(cri, emp);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/dclzStatus")
	public ModelAndView dclzStatus(@SessionAttribute("loginEmp") EmpVO emp, ModelAndView mnv) throws Exception {
		String url = "dclz/dclzStatus";
		List<DclzMeditationVO> dclzMediationList = dclzService.getDclzMediationList(emp);
		
		mnv.addObject("dclzMediationList", dclzMediationList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/getTotalTime")
	@ResponseBody
	public ResponseEntity<Map<String,String>> getTotalTime(String empl_no) throws Exception{
		
		ResponseEntity<Map<String,String>> entity = null;
		
		Map<String,String>dataMap = dclzService.getThisWeekAndMonthTime(empl_no);
		
		entity = new ResponseEntity<Map<String,String>>(dataMap, HttpStatus.OK);
	
		return entity;
	}
	
	@RequestMapping("/getWeekWorkTime")
	@ResponseBody
	public ResponseEntity<List<DclzVO>> getWeekWorkTime(@RequestBody DclzVO dclz) throws Exception{
		ResponseEntity<List<DclzVO>> entity = null;
		
		List<DclzVO> workWeekList = dclzService.getWeekWorkList(dclz);
		entity = new ResponseEntity<List<DclzVO>>(workWeekList, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/getWeek")
	@ResponseBody
	public ResponseEntity<List<DclzVO>> getWeek(@RequestBody List<DclzVO> weekList) throws Exception{		
		ResponseEntity<List<DclzVO>> entity = null;
		
		List<DclzVO> week = dclzService.getWeekTotalTime(weekList);
		
		entity = new ResponseEntity<List<DclzVO>>(week,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/getIpAddr")
	@ResponseBody
	public ResponseEntity<String> getIpAddr() throws Exception{		
		ResponseEntity<String> entity = null;
		
		InetAddress inetAddress = InetAddress.getLocalHost();
		String ipAddress = inetAddress.getHostAddress();
		
		entity = new ResponseEntity<String>(ipAddress,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/insertWorkTime")
	@ResponseBody
	public ResponseEntity<String> insertWorkTime(@RequestBody DclzVO dclz) throws Exception{		
		ResponseEntity<String> entity = null;
		
		dclzService.regWorkTime(dclz);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/insertWorkEnd")
	@ResponseBody
	public ResponseEntity<String> insertWorkEnd(@RequestBody DclzVO dclz) throws Exception{		
		ResponseEntity<String> entity = null;
		
		dclzService.modWorkEndTime(dclz);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/todayWorkTime")
	@ResponseBody
	public ResponseEntity<DclzVO> todayWorkTime(@RequestBody String empl_no) throws Exception{		
		ResponseEntity<DclzVO> entity = null;
		
		DclzVO workTime = dclzService.getTodayWorkTime(empl_no);
		
		entity = new ResponseEntity<DclzVO>(workTime,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/regDclzMed")
	@ResponseBody
	public ResponseEntity<String> regDclzMed(@RequestBody DclzMeditationVO dclzmed) throws Exception{		
		ResponseEntity<String> entity = null;
		
		dclzService.regWorkMediation(dclzmed);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/excelDownload")
	public String download(DclzVO dclz, Model model)throws Exception {
		String url = "excelFileDownload";
		
		List<DclzVO> dclzList = dclzService.getEmpMonthDclzList(dclz);
		
		SXSSFWorkbook workbook = dclzService.makeExcel(dclzList, "이번달근태현황");
		
		model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "이번달근태현황");
		
		
		return url;
	}

	
}