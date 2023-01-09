package com.mzgw.board.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mzgw.board.service.FaqService;
import com.mzgw.dto.FaqVO;

@Controller
@RequestMapping("/faqboard")
public class FaqboardController {
	
	@Autowired
	private FaqService faqService;


		
	@RequestMapping("/list")
	//reqeustparam->int faq(파라미터변수)에 옵션을 줌 required -> true면 parameter가 무조건 있어야 함, false면 parameter가 없어도 됨 
	//defaultValue->parameter에 값이 아무것도 안들어가면 faqType변수에 defaultvalue값(0)을 넣어준다.
	public ModelAndView faqboardList(@RequestParam(required = false, defaultValue = "0", name = "faq_type")int faqType,ModelAndView mnv ) throws Exception{
			
		String url = "/faqboard/FAQ";
		
		Map<String, Object> dataMap = faqService.selectAllFaqList(faqType);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
		
	}
		
		@RequestMapping(value="/regist", method = RequestMethod.POST)
		@ResponseBody
		public ResponseEntity<String> insertFaq(@RequestBody FaqVO insert) throws SQLException{
			
			ResponseEntity<String> entity=null;
			System.out.println("service전");
			faqService.insertFaq(insert);
			System.out.println("service후");
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
			return entity;
		}
		
		@RequestMapping(value="/modify", method = RequestMethod.POST)
		@ResponseBody
		public ResponseEntity<String> modifyFaq(@RequestBody FaqVO modify)throws SQLException{
			ResponseEntity<String> entity= null;
			
			faqService.updateFaq(modify);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
			return entity;
		}
	
		@RequestMapping(value="/remove", method= RequestMethod.GET)
		public String remove(int faq_no, RedirectAttributes rttr) throws Exception{
			String url="redirect:/faqboard/list";
			FaqVO faq = new FaqVO();
			faq.setFaq_no(faq_no);
			faqService.deleteFaq(faq);
			
			rttr.addFlashAttribute("from", "remove");
			
			return url;
		}

	
}
