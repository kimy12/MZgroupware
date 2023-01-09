package com.mzgw.common.controller;




import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mzgw.board.service.BoardService;
import com.mzgw.dto.BoardTypeVO;
import com.mzgw.dto.BoardVO;
import com.mzgw.dto.CompanyTopbarVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.PopupVO;
import com.mzgw.emp.service.CertificationService;
import com.mzgw.emp.service.EmpService;
import com.mzgw.manager.service.ManagerService;

@Controller
public class CommonController {
	
	@Autowired
	private EmpService empService;
	@Autowired
	private CertificationService certificationService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ManagerService managerService;
	
	
	@RequestMapping("/common/findIdForm")
	public void findIdForm() {}	
	
	@RequestMapping("/common/findPwdForm")
	public void findPwdForm() {}	
	
	@RequestMapping("/security/accessDenied")
	public void accessDenied() {}
	
	@RequestMapping("/index")
	public String index(Model model) throws Exception {
		List<PopupVO> popups = boardService.mainPopUpList();
		
		
		model.addAttribute("popups", popups);	
		
		return "common/main";
	}
	
	@RequestMapping("/common/getCustom")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> boardMenuList() throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		
		Map<String,Object> dataMap = new HashMap<>();
		
		List<BoardTypeVO> boardMenuList = boardService.getBoardMenu();
		CompanyTopbarVO topbar = managerService.getTopbarColor();
		
		dataMap.put("boardMenuList", boardMenuList);
		dataMap.put("topbar", topbar);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/common/loginTimeOut")
	public String loginTimeOut(Model model)throws Exception{
		String url = "security/sessionOut";
		
		model.addAttribute("message", "세션이 만료되었습니다. \\n 다시 로그인 하세요!");
		return url;
	}
		
	@RequestMapping(method=RequestMethod.GET, value="/common/loginForm")
	public String loginForm(@RequestParam(defaultValue = "") String error, HttpServletResponse response, Model model) { 
		String url = "common/loginForm";
		
		if(error.equals("1")) {
			response.setStatus(302);
		}
		
		return url;
	}
	
	@RequestMapping("/common/findIdResult")
	public void findIdResult(String id, Model model) {
		model.addAttribute("id", id);
	}	
	
	@RequestMapping(method=RequestMethod.POST, value="/common/findId")
	public String findId(EmpVO emp, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/common/findIdResult";
		
		String id = empService.getFindId(emp);
			
		rttr.addAttribute("id", id);
		
		return url;
	}
	
	public String sendSMS(String phone) {
		Random random = new Random();
		String number = "";
		
		for(int i = 0; i < 4; i++) {
			String randomNumber = Integer.toString(random.nextInt(10));
			number += randomNumber;
		}

        certificationService.certifiedPhoneNumber(phone,number);
		
		return number;
	}
	
	@RequestMapping("/common/phoneCheck")
	@ResponseBody
	public ResponseEntity<String> phoneNumCheck(EmpVO emp) throws Exception{
		ResponseEntity<String> entity = null;
		
		String phone = empService.getPhoneNum(emp);
		String certificationNum = sendSMS(phone);
		
		if(phone != null) {
			entity = new ResponseEntity<String>(certificationNum, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("", HttpStatus.OK);			
		}
			
		return entity;
	}
	
	@RequestMapping("/common/findPwd")
	public String findPwd(String id, RedirectAttributes rttr) {
		String url = "redirect:/common/findPwdResult";
		
		rttr.addAttribute("msg","success");
		rttr.addAttribute("id",id);
		
		return url;
	}
	
	@RequestMapping("/common/findPwdResult")
	public void findPwdResult(String id, Model model) throws Exception {
		String pwd = empService.getPwd(id);
		
		model.addAttribute("pwd", pwd);
	}	
	
	
	
	
}
