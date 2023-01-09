package com.mzgw.board.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mzgw.board.service.BReplyService;
import com.mzgw.board.service.BoardService;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.BReplyVO;
import com.mzgw.dto.BoardVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.GetAttachesByMultipartFileAdapter;

@Controller
@RequestMapping("/noticeboard")
public class NoticeboardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private BReplyService bReplyService;
	
	
	@RequestMapping("/main")
	public String noticeMain(Model model)throws Exception {
		String url = "/noticeboard/main";
		
		return url;
	}
	
	@RequestMapping("/list")
	public void noticeboardList(Criteria cri, @RequestParam(defaultValue = "1") int btno, @RequestParam(defaultValue = "desc") String nowSort, Model model, BoardVO board) throws Exception {		
		Map<String, Object> dataMap = boardService.searchBoardByBtno(btno, nowSort, cri);

		model.addAllAttributes(dataMap);
		
	}
	
	@RequestMapping("/detail")
	public ModelAndView noticeboardDetail(BoardVO board, 
			 							  @RequestParam(defaultValue = "") String from,
										  @RequestParam(defaultValue = "1") int btno,
										  @RequestParam(defaultValue = "-1") int unityno,
										  @RequestParam int boardno,
										  ModelAndView mnv) throws SQLException {

		String url = "noticeboard/noticeboarddetail";	
		board.setBoardtype_no(btno);
		board.setBoard_no(boardno);		
		board.setUnityatchmnflno(unityno);		
		
		Map<String, Object> dataMap = null;		
		if (from.equals("list")) {
			dataMap = boardService.getNotice(board);	
			url = "redirect:/noticeboard/detail?btno=" + board.getBoardtype_no() + "&boardno="
					+ board.getBoard_no() + "&unityno=" + board.getUnityatchmnflno();
		} else {
			dataMap = boardService.getNoticeForModify(board);			
		}
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping(value = "/registform")
	public ModelAndView noticeRegistForm(@RequestParam(defaultValue="1")int btno, ModelAndView mnv) throws Exception {
		String url = "noticeboard/noticeboardregist";
		
		int popupCount = boardService.getPopupCount();
		int pinCount = boardService.pinTotalCount(btno);
		
		mnv.addObject("popupCount",popupCount);
		mnv.addObject("pinCount",pinCount);
		mnv.setViewName(url);

		return mnv;
	}

	@Resource(name = "fileUploadPath")
	private String fileUploadPath;
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String noticeboardRegist(List<MultipartFile> uploadFile, BoardVO board, RedirectAttributes rttr) throws Exception {	
		
		String url = "redirect:/noticeboard/list?btno=1";
		board.setBoardtype_no(1);
		List<AttachVO> attachList = null;
		
		rttr.addFlashAttribute("from", "regist");
		
		for(MultipartFile f : uploadFile) {
			if(f.getOriginalFilename() == "") {
				boardService.insertNoticeBoard(board,attachList);
				
				return url;
			}
		}
		
		attachList = GetAttachesByMultipartFileAdapter.save(uploadFile, fileUploadPath);	
		boardService.insertNoticeBoard(board,attachList);
		
		return url;
		
	}

	@RequestMapping("/modify")
	public String modifyForm(List<MultipartFile> uploadFile, BoardVO board, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/noticeboard/detail?btno=" + board.getBoardtype_no() + "&boardno="
				+ board.getBoard_no() + "&unityno=" + board.getUnityatchmnflno();
		
		List<AttachVO> attachList = null;
		
		for(MultipartFile f : uploadFile) {
			if(f.getOriginalFilename() == "") {
				boardService.noticeAndFileModify(board,attachList);
				
				rttr.addFlashAttribute("from","modify");
				return url;
			}
		}
		
		attachList = GetAttachesByMultipartFileAdapter.save(uploadFile, fileUploadPath);
		boardService.noticeAndFileModify(board,attachList);
		rttr.addFlashAttribute("from","modify");
		

		return url;
	}

	@RequestMapping("/modifyform")
	public ModelAndView noticeboardModify(BoardVO board, 
										  @RequestParam(defaultValue = "1") int btno,
										  @RequestParam(defaultValue = "-1") int unityno,
										  @RequestParam int boardno,
										  ModelAndView mnv)throws Exception {

		String url = "noticeboard/noticeboardmodify";
		
		board.setBoardtype_no(btno);
		board.setBoard_no(boardno);		
		board.setUnityatchmnflno(unityno);		
		
		Map<String, Object> dataMap = boardService.getNoticeForModify(board);
		int pinCount = boardService.pinTotalCount(btno);
		int popupCount = boardService.getPopupCount();
		
		mnv.addObject("popupCount",popupCount);
		mnv.addObject("pinCount",pinCount);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(BoardVO board, RedirectAttributes rttr) throws Exception {

		String url = "redirect:/noticeboard/list?btno=" + board.getBoardtype_no();

		boardService.deleteNoticeBoard(board);

		rttr.addFlashAttribute("from", "remove");

		return url;

	}
	
	
	@RequestMapping(value = "/removeFiles")
	@ResponseBody
	public ResponseEntity<String> removeFiles(@RequestBody AttachVO attach) throws Exception {
		
	    boardService.removeFilesInNoticeModify(attach);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}


	
	

	@ResponseBody
	@RequestMapping(value = "/popupCount", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Integer>> getPopupCount() throws Exception {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("popupCount", boardService.getPopupCount());
		return new ResponseEntity<Map<String, Integer>>(map, HttpStatus.OK);

	}

	
	@ResponseBody
	@RequestMapping(value = "/registBreply", method = RequestMethod.POST)
	public ResponseEntity<String> registBreply(@RequestBody BReplyVO breply, HttpSession session) throws Exception {
		EmpVO loginEmp = (EmpVO) session.getAttribute("loginEmp");
		breply.setEmpl_no(loginEmp.getEmpl_no());
		bReplyService.insertReply(breply);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping(value = "/modifyBreply", method = RequestMethod.POST)
	public ResponseEntity<String> modifyBreply(@RequestBody BReplyVO breply, HttpSession session) throws Exception {
		EmpVO loginEmp = (EmpVO) session.getAttribute("loginEmp");
		breply.setEmpl_no(loginEmp.getEmpl_no());
		bReplyService.updateReply(breply);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	@RequestMapping(value = "/removeBreply", method = RequestMethod.GET)
	public String remove(BoardVO board, int breply_no, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/noticeboard/detail?board_no=" + board.getBoard_no() + "&boardtype_no="
				+ board.getBoardtype_no();
		BReplyVO breply = new BReplyVO();
		breply.setBreply_no(breply_no);
		bReplyService.deleteReply(breply_no);

		rttr.addFlashAttribute("from", "remove");

		return url;
	}
}
