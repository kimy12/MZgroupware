package com.mzgw.board.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mzgw.board.service.BoardService;
import com.mzgw.dto.BoardVO;
import com.mzgw.util.Criteria;

@Controller
@RequestMapping("/eventboard")
public class EboardController {
	
	@Autowired
	private BoardService boardService;
	
	//경조사게시판 목록
	@RequestMapping("/list")
	public void eboardList(Criteria cri,@RequestParam(defaultValue = "4") int btno, @RequestParam(defaultValue = "desc") String nowSort, Model model, BoardVO board)throws Exception{
		Map<String, Object> dataMap = boardService.searchBoardByBtno(btno, nowSort, cri);
		model.addAllAttributes(dataMap);
		
	}
	
	//경조사게시판 등록폼
	@RequestMapping("/registform")
	public String eboardRegistForm(){
		
		String url = "eventboard/eboardregist";
		
		return url;
	}
	
	//경조사게시판 등록
	@RequestMapping(value="/regist",method= RequestMethod.POST)
	public String eboardRegist(BoardVO board,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/eventboard/list?btno=4";
		board.setBoardtype_no(4);
		System.out.println("====================================왔다=================================");
		System.out.println(board.getBoard_no());
		System.out.println(board.getBoardtype_no());
		System.out.println(board.getBoard_writer());
		System.out.println(board.getBoard_title());
		System.out.println(board.getBoard_cont());
		System.out.println(board.getBoard_rgdt());
		System.out.println(board.getBoard_cnt());
		System.out.println(board.getEboard_status());
		System.out.println(board.getEboard_date());
		rttr.addFlashAttribute("from", "regist");
		
		boardService.insertEboard(board);
		return url;
		
		
	}
	
	//경조사게시판 상세
	@RequestMapping("/detail")
	public ModelAndView getEboardDetail(ModelAndView mnv,HttpServletRequest request,BoardVO board)throws Exception{
		
		String url = "eventboard/eboarddetail";
		
		
		BoardVO eboard = boardService.getEboardDetail(board);
		
		mnv.addObject("eboard", eboard);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modifyform")
	public ModelAndView getEboardModifyform(ModelAndView mnv,BoardVO board)throws Exception{
		
		String url="eventboard/eboardmodify";
		
		BoardVO eboard = boardService.getEboardDetail(board);
		
		mnv.addObject("eboard", eboard);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	@RequestMapping("/modify")
	public ModelAndView updateEboard(ModelAndView mnv,BoardVO board)throws Exception{
		
		String url="redirect:/eventboard/list?btno=4";
		
		boardService.updateEboard(board);
		
		
		
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	//글 번호만 가지고 와서 삭제하는거라 service, dao 에는 return 이 필요없어서 
	//void 타입으로 만들었는데 controller는 redirect해줄 url을 return 해줘야함
	//그래서 controller타입은 String으로 줌
	@RequestMapping("/remove")
	public String deleteEboard(int board_no)throws Exception{
		
		String url = "redirect:/eventboard/list?btno=4";
	boardService.deleteEboard(board_no);
		return url;
	}
	

}
