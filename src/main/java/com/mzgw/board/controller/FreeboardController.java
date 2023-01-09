package com.mzgw.board.controller;

import java.sql.SQLException;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mzgw.board.service.BoardService;
import com.mzgw.command.BoardModifyCommand;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.BoardVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.LikeToVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.GetAttachesByMultipartFileAdapter;

@Controller
@RequestMapping("/freeboard")
public class FreeboardController {
	
	@Autowired
	private BoardService boardService;
//	@Autowired
//	private BReplyService bReplyService;

	@RequestMapping("/list")
	public void freeboardList(Criteria cri, @RequestParam(defaultValue = "2") int btno, @RequestParam(defaultValue = "desc") String nowSort, Model model, BoardVO board)throws Exception {
		
		System.out.println(cri.getKeyword());
		Map<String, Object> dataMap = boardService.searchBoardByBtno(btno,nowSort,cri);
		model.addAllAttributes(dataMap);
	}

	@RequestMapping(value="/registform", method=RequestMethod.GET)
	public String freeboardRegistForm() {
		String url = "freeboard/freeboardregist";

		return url;
	}
	
	@Resource(name = "boardUploadPath")
	private String boardUploadPath;
	
	@RequestMapping(value="/regist", method = RequestMethod.POST)
	public String freeboardRegist(List<MultipartFile> uploadFile, BoardVO board, RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/freeboard/list?btno=2";
		board.setBoardtype_no(2);
		List<AttachVO> attachList = null;
		
		System.out.println(board.getBoardncnm());
		System.out.println(board.getBoard_head());
		
		
		rttr.addFlashAttribute("from", "regist");
		
		for(MultipartFile f : uploadFile) {
			if(f.getOriginalFilename() == "") {
				boardService.insertFreeBoard(board,attachList);
				
				return url;
			}
		}
		
		attachList = GetAttachesByMultipartFileAdapter.save(uploadFile, boardUploadPath);	
		boardService.insertFreeBoard(board,attachList);		
		return url;
		
	}
	
	@RequestMapping("/detail")
	public ModelAndView freeboardDetail(BoardVO board, String from,
			 ModelAndView mnv,HttpServletRequest req) throws Exception{
		
		String url = "freeboard/freeboarddetail";
		HttpSession session = req.getSession();
			
		BoardVO fboard = null;
		if(from!=null && from.equals("list")) {
			fboard = boardService.getFreeBoard(board);
			url="redirect:/freeboard/detail?board_no="+board.getBoard_no()+"&boardtype_no="+board.getBoardtype_no();
		}else {
			fboard=boardService.getFreeBoardForModify(board);
		}
		
		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		LikeToVO like= new LikeToVO();
		like.setBoard_no(board.getBoard_no());
		like.setBoardtype_no(board.getBoardtype_no());
		like.setEmpl_no(user.getEmpl_no());
		
		like=boardService.selectLikeEmp(like);

		
		Map<String, Object> dataMap = new HashMap<>();
		
		int unityatchmnflno = fboard.getUnityatchmnflno();
		dataMap.put("upFileList", boardService.getfileUploadList(unityatchmnflno));
		dataMap.put("fboard", fboard);
		dataMap.put("like", like);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyForm(BoardModifyCommand boardReq,RedirectAttributes rttr) throws Exception{
		
		// 파일 저장
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(boardReq.getUploadFile(), boardUploadPath);
		//BoardVO setting
		BoardVO board = boardReq.toBoardVO();
		board.setAttachList(attachList);
		
		
		System.out.println(board.getBoard_no());
		System.out.println(board.getBoardtype_no());
		String url="redirect:/freeboard/detail?board_no="+board.getBoard_no()+"&boardtype_no="+board.getBoardtype_no();
		
		boardService.FreeAndFileModify(board);
		
		rttr.addFlashAttribute("from","modify");
		rttr.addAttribute("board_no",board.getBoard_no());
			
		return url;
	}
	

	
	
	@RequestMapping("/modifyform")
	public ModelAndView freeboardModify(BoardVO board,
			
			 @RequestParam(defaultValue = "2") int btno,
			  @RequestParam int boardno,
			ModelAndView mnv) throws SQLException{
		
		String url = "freeboard/freeboardmodify";
		board.setBoardtype_no(btno);
		board.setBoard_no(boardno);		
		BoardVO fboard=boardService.getFreeBoardForModify(board);
		
		Map<String, Object> dataMap = new HashMap<>();
		int unityatchmnflno = fboard.getUnityatchmnflno();
		System.out.println("!!!!!!!!!!!!!"+unityatchmnflno);
		dataMap.put("upFileList", boardService.getfileUploadList(unityatchmnflno));
		dataMap.put("fboard", fboard);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	} 

	@RequestMapping("/remove")
	public String remove(BoardVO board, RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/freeboard/list?btno="+board.getBoardtype_no();
		
		boardService.deleteFreeBoard(board);
		
		rttr.addFlashAttribute("from", "remove");
	
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
			
			boardService.insertLike(likeTo);
			boardService.boardLikeup(likeTo);
		}else {
			boardService.boardLikedown(likeTo);
			boardService.deleteLike(likeTo);
			
//			System.out.println("하트가 없습니다");
		}
		
		board= boardService.getFreeBoardForModify(board);
		
		int likeNum=board.getBoard_like();
		
		entity = new ResponseEntity<Integer>(likeNum, HttpStatus.OK);
		
		return entity;

		
		
	}
	
}