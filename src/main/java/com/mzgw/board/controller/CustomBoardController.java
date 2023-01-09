package com.mzgw.board.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mzgw.board.service.BReplyService;
import com.mzgw.board.service.CustomBoardService;
import com.mzgw.command.BoardModifyCommand;
import com.mzgw.command.BoardRegistCommand;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.BReplyVO;
import com.mzgw.dto.BoardTypeVO;
import com.mzgw.dto.BoardVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.LikeToVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.GetAttachesByMultipartFileAdapter;

@Controller
@RequestMapping("/customBoard")
public class CustomBoardController {

	@Autowired
	private CustomBoardService service;
	@Autowired
	private BReplyService bReplyService;
	
	
	@Resource(name = "boardUploadPath")
	private String boardUploadPath;
	
	@RequestMapping("/{btno}")
	public ModelAndView customBoardList(@PathVariable("btno") int btno, ModelAndView mnv ,Criteria cri ,@RequestParam(defaultValue = "desc") String nowSort) throws Exception {
		String url = "customBoard/list";
		System.out.println(btno);
		System.out.println(nowSort);
		System.out.println(cri.getKeyword());
		Map<String, Object> dataMap = service.getCustomBoardList(btno,cri,nowSort);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping(value="/registform/{btno}")
	public String customBoardRegistForm(@PathVariable("btno") int btno,Model model) throws Exception {
		String url = "customBoard/customboardregist";
		BoardTypeVO boardName1=service.selectCustomBoard(btno);
		String boardName=boardName1.getBoardName();
		model.addAttribute("boardName",boardName);
		model.addAttribute("btno",btno);
		System.out.println("폼까진 옴");
		return url;
	}
	
	@RequestMapping(value="/regist/{btno}", method = RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public String regist(@PathVariable("btno") int boardtype_no, BoardRegistCommand boardReq,
			RedirectAttributes rttr) throws Exception{
		String url = "redirect:/customBoard/"+boardtype_no;
		
		for (MultipartFile file : boardReq.getUploadFile()) {
			System.out.println("ppp : " + file.getOriginalFilename());
			System.out.println("qqq : " +file.getSize());
		}
		
		//file 저장 -> List<AttachVO>	
		String savepath = this.boardUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(boardReq.getUploadFile(), savepath);
		
		BoardVO board = boardReq.toBoardVO();
		
		for (MultipartFile file : boardReq.getUploadFile()) {
			if(file.getSize() == 0) {
				board.setAttachList(null);
			}else {
				board.setAttachList(attachList);
			}
			System.out.println("pppㅇㅇ : " + file.getOriginalFilename());
			System.out.println("qqqㅇㅇ : " +file.getSize());
			
			System.out.println("여기도 나오나요????????????????????");
		}
		
		board.setBoardtype_no(boardtype_no);
		service.registCustomBoard(board);
		
		rttr.addFlashAttribute("from", "regist");
		
		return url;
	}
	
	@RequestMapping("/detail")
	public ModelAndView freeboardDetail(BoardVO board, String from,
		 ModelAndView mnv,HttpServletRequest req) throws Exception{
		
		String url = "customBoard/customboarddetail";
		HttpSession session = req.getSession();
		
		BoardVO cboard = null;
		if(from!=null && from.equals("list")) {
			
			cboard = service.getCustomBoard(board);
			url="redirect:/customBoard/detail?board_no="+board.getBoard_no()+"&boardtype_no="+board.getBoardtype_no();
		}else {

			cboard = service.getCustomBoardForModify(board);
		}
		
		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		LikeToVO like= new LikeToVO();
		like.setBoard_no(board.getBoard_no());
		like.setBoardtype_no(board.getBoardtype_no());
		like.setEmpl_no(user.getEmpl_no());
		like=service.selectLikeEmp(like);
		
		
		
		EmpVO emp = service.selectEmpByBno(board);
		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("cboard", cboard);
		dataMap.put("emp", emp);
		dataMap.put("like", like);
		dataMap.put("upFileList", service.getfileUploadList(board));
		
		//view에 전달할 값
		mnv.addObject("dataMap", dataMap);
		
		
		List<BReplyVO> breplies = bReplyService.selectBReplyList(board.getBoard_no());
		mnv.addObject("breplies", breplies);
		
		
		//view 이름
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String freeboardModify(BoardModifyCommand boardReq,RedirectAttributes rttr) throws Exception{
			 	System.out.println("여기가 모디파이입니다~");
			 	System.out.println(boardReq.getDeleteFile());
			
			// 파일 저장
			List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(boardReq.getUploadFile(), boardUploadPath);
			//BoardVO setting
			BoardVO board = boardReq.toBoardVO();
			board.setAttachList(attachList);
			
			String url="redirect:/customBoard/detail?board_no="+board.getBoard_no()+"&boardtype_no="+board.getBoardtype_no();	
			// DB 저장
			System.out.println(board.getBoard_no());
			System.out.println(board.getBoardtype_no());
			System.out.println(board.getUnityatchmnflno());
			
			service.modifyAttachByUni(board);
			
			rttr.addFlashAttribute("from","modify");
			rttr.addAttribute("board_no",board.getBoard_no());
			return url;	
	} 
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(BoardVO board,ModelAndView mnv)throws Exception{
		
		String url="customBoard/customboardmodify";
		
		BoardVO cboard = service.getCustomBoardForModify(board);
		BoardTypeVO boardName1=service.selectCustomBoard(board.getBoardtype_no());
		String boardName=boardName1.getBoardName();
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("upFileList", service.getfileUploadList(board));
		
		// 파일명 재정의
		if (cboard != null) {
			List<AttachVO> attachList = cboard.getAttachList();
			if (attachList != null) {
				for (AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					attach.setFileName(fileName);
				}
			}
		}
		
		mnv.addObject("dataMap",dataMap);		
		mnv.addObject("cboard",cboard);		
		mnv.addObject("boardName",boardName);		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping("/remove")
	public String remove(BoardVO board,RedirectAttributes rttr) throws Exception{
		String url = "redirect:/customBoard/"+board.getBoardtype_no();
		service.remove(board);		
		
		rttr.addFlashAttribute("from","remove");
		return url;		
	}
	
	
	
//	좋아요 기능
	@RequestMapping(value="/like", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> getLike(@RequestBody LikeToVO likeTo, HttpServletRequest req) throws Exception{
		
		ResponseEntity<Integer> entity = null;
		
		HttpSession session = req.getSession();
		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		likeTo.setEmpl_no(user.getEmpl_no());
		
		
		BoardVO board=new BoardVO();
		board.setBoard_no(likeTo.getBoard_no());
		board.setBoardtype_no(likeTo.getBoardtype_no());
		
		int likeCheck=likeTo.getLikeCheck();
		
		if(likeCheck==1) {
//			System.out.println("하트가 있습니다");
			
			service.insertLike(likeTo);
			service.boardLikeup(likeTo);
		}else {
			service.boardLikedown(likeTo);
			service.deleteLike(likeTo);
			
//			System.out.println("하트가 없습니다");
		}
		
		board= service.getCustomBoardForModify(board);
		
		int likeNum=board.getBoard_like();
		
		entity = new ResponseEntity<Integer>(likeNum, HttpStatus.OK);
		
		return entity;

		
		
	}
	
}	
