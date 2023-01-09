//package com.mzgw.board.controller;
//
//import java.sql.SQLException;
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.mzgw.attach.dao.AttachDAO;
//import com.mzgw.board.service.BReplyService;
//import com.mzgw.board.service.BoardService;
//import com.mzgw.dto.AttachVO;
//import com.mzgw.dto.BoardVO;
//import com.mzgw.dto.EmpVO;
//import com.mzgw.emp.service.EmpService;
//import com.mzgw.util.Criteria;
//import com.mzgw.util.GetAttachesByMultipartFileAdapter;
//
//@Controller
//@RequestMapping("/eventboard")
//public class EventboardController {
//	
//	@Autowired
//	private BoardService boardService;
//	@Autowired
//	private EmpService empService;
//	
//	@Autowired
//	AttachDAO attachDAO;
//	
//	//application contex에 등록한 경로 아이디
//	//나중에 경로 윈도우 경로로 바꿔야함
//	@Resource(name = "boardUploadPath")
//	private String boardUploadPath;
//	
//	@RequestMapping("/list")
//	public void eventboardList(Criteria cri,int btno, Model model,BoardVO board)throws Exception {
//	
//		board.setBoardtype_no(btno);
//		//Map<String, Object> dataMap = boardService.searchBoardByBtno(btno,cri);
//		Map<String, Object> getPinlist = boardService.getPinlist(board);
//		
//		//model.addAllAttributes(dataMap);
//		model.addAttribute("btno", btno);
//		model.addAllAttributes(getPinlist);
//	}
//
//	@RequestMapping(value="/registform", method = RequestMethod.GET)
//	public String eventboardRegistForm() {
//		String url = "eventboard/eboardregist";
//
//		return url;
//	}
//
//	@RequestMapping(value="/regist", method = RequestMethod.POST)
//	public String eventboardRegist(@RequestParam("uploadFile")List<MultipartFile> uploadFile, BoardVO board, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
//		
//		String url = "redirect:/eventboard/list?btno=4";
//		board.setBoardtype_no(4);
//		
//		List<AttachVO> attachList = null;
//		
//		rttr.addFlashAttribute("from", "regist");
//		
//		for(MultipartFile f : uploadFile) {
//			if(f.getOriginalFilename() == "") {
//				boardService.insertEventBoard(board,attachList);
//				
//				return url;
//			}
//		}
//			
//		attachList = GetAttachesByMultipartFileAdapter.save(uploadFile, boardUploadPath);
//		
//		boardService.insertEventBoard(board,attachList);
//		
//		return url;
//	}
//	
//	@RequestMapping("/modify")
//	public String eventboardmodifyForm(BoardVO board) throws Exception{
//		String url="redirect:/eventboard/list?btno=4";
//		
//		System.out.println(board.getBoard_cont());
//		System.out.println(board.getBoard_title());
//		
//		boardService.updateEventBoard(board);
//		
//		return url;
//		
//		
//	}
//	
//	@RequestMapping("/modifyform")
//	public ModelAndView eventboardModify(BoardVO board, @RequestParam(defaultValue = "") String from,
//			HttpServletRequest request, ModelAndView mnv, RedirectAttributes rttr,Model model) throws SQLException{
//		
//		String url = "eventboard/eboardmodify";
//		
//		BoardVO eboard=null;
//		EmpVO writer = null;
//		BoardVO cboard = boardService.getBoardForModify(board);
//		if(!from.equals("list")) {
//			eboard = boardService.getCEventBoard(board);
//			writer = empService.getEmpByEmplNo(eboard.getBoard_writer());
//			cboard = boardService.getBoardForModify(board);
//			
//		}else {
//			eboard = boardService.getEventBoard(board);
//			writer = empService.getEmpByEmplNo(eboard.getBoard_writer());
//			url="redirect:/eventboard/modifyform?board_no="+board.getBoard_no()+"&boardtype_no="+board.getBoardtype_no();
//			rttr.addFlashAttribute("from", "modify");
//		}
//		
//		mnv.addObject("upFileList", boardService.getfileUploadList(eboard.getUnityatchmnflno()).get("upFileList"));
//	
//		mnv.addObject("cboard",cboard);	
//		mnv.addObject("eboard", eboard);
//		mnv.addObject("writer", writer.getName());		
//		
//		mnv.setViewName(url);
//		
//		return mnv;
//	}
//	
//	@RequestMapping(value="/remove", method=RequestMethod.GET)
//	public String remove(BoardVO board, RedirectAttributes rttr)throws Exception {
//		
//		String url = "redirect:/eventboard/list?btno="+board.getBoardtype_no();
//		
//		boardService.deleteEventBoard(board);
//		
//		rttr.addFlashAttribute("from", "remove");
//		
//		return url;
//	}
//	
//	@RequestMapping("/detail")
//	public ModelAndView evantboardDetail(BoardVO board,
//										@RequestParam(defaultValue = "" ) String from,
//										HttpServletRequest request, ModelAndView mnv
//										,Model model) throws SQLException{
//		String url = "eventboard/eboarddetail";
//		
//		BoardVO eboard = null;
//		EmpVO writer = null;
//		BoardVO cboard = null;
//		if(!from.equals("list")) {
//			eboard = boardService.getCEventBoard(board);
//			cboard = boardService.getBoardForModify(board);
//			writer = empService.getEmpByEmplNo(eboard.getBoard_writer());
//		}else {
//			eboard = boardService.getEventBoard(board);
//			writer = empService.getEmpByEmplNo(eboard.getBoard_writer());
//			
//			url="redirect:/eventboard/detail?board_no"+board.getBoard_no()+"&boardtype_no="+board.getBoardtype_no();
//		}
//		
//		mnv.addObject("upFileList", boardService.getfileUploadList(eboard.getUnityatchmnflno()).get("upFileList"));
//		mnv.addObject("eboard", eboard);
//		mnv.addObject("writer", writer.getName());
//		
//		mnv.setViewName(url);
//		
//		return mnv;
//		
//		
//	}
//
//}
