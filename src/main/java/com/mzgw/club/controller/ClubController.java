package com.mzgw.club.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.club.service.ClubBoardService;
import com.mzgw.club.service.ClubService;
import com.mzgw.command.ClubBoardModifyCommand;
import com.mzgw.command.ClubBoardRegistCommand;
import com.mzgw.command.ClubRegistCommand;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.ClubBoardVO;
import com.mzgw.dto.ClubConceptVO;
import com.mzgw.dto.ClubLikeToVO;
import com.mzgw.dto.ClubMemVO;
import com.mzgw.dto.ClubVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.GetAttachesByMultipartFileAdapter;

@Controller
@RequestMapping("/club")
public class ClubController {
	
	@Autowired 
	public ClubService clubService;
	
	@Autowired
	public AttachDAO attachDAO;
	
	@Autowired 
	public ClubBoardService clubBoardService;
	
	@Resource(name = "clubBoardUploadPath")
	private String clubBoardUploadPath;
	
	
	
	@RequestMapping("/list")
	public ModelAndView list(@SessionAttribute("loginEmp") EmpVO loginEmp,ModelAndView mnv) throws SQLException{
		String url ="club/list";
		
		Map<String, Object> dataMap = clubService.getClubList(loginEmp);
		mnv.addObject("dataMap",dataMap);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/galleryModify")
	public String galleryModify() throws SQLException{
		String url ="club/galleryModify";
		
		
		return url;
	}
	
	@RequestMapping(value="/regist")
	public String regist2() throws SQLException{
		String url ="club/regist";
		
		
		return url;
	}
	
	@RequestMapping("/{clubNo}")
	public ModelAndView detail(@PathVariable("clubNo") int clubNo, ModelAndView mnv) throws SQLException{
		String url ="club/detail";

		Map<String, Object> dataMap = clubService.getClubDetail(clubNo);
		//Map<String, Object> dataMapForConcept = clubService.getConceptListByClubNo(clubTypeNo);

		mnv.addObject("dataMap",dataMap);

		mnv.setViewName(url);
		System.out.println("나간다");
		return mnv;
	}
	
	@RequestMapping(value = "/joiningClub")
	@ResponseBody
	public ResponseEntity<String> joiningClub (@RequestBody ClubMemVO clubMem) throws SQLException {
		ResponseEntity<String> entity = null;
		clubService.inserClubMember(clubMem);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/countMem")
	@ResponseBody
	public ResponseEntity<Integer> countMem (@RequestBody ClubMemVO club_no) throws SQLException {
		ResponseEntity<Integer> entity = null;
		int count = clubService.countStaff(club_no);
		entity = new ResponseEntity<Integer>(count, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/updateStatus", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> updateStatus(@RequestBody ClubMemVO no) throws SQLException {
		ResponseEntity<String> entity = null;
		
		clubService.updateStatus(no);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value = "/deleteMem", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteMem(@RequestBody ClubMemVO no) throws SQLException {
		ResponseEntity<String> entity = null;
		
		clubService.deleteMem(no);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/clubregist")
	public String regist() {
		String url ="club/regist";
		
		return url;
	}
	
	@RequestMapping(value="/galleryDetail")
	public String galleryDetail(@RequestParam int clubboard_no, 
								@RequestParam int unityatchmnflno,
								AttachVO attach, 
								Model model) throws SQLException{
		String url ="club/galleryDetail";
		
		Map<String, Object> dataMap = clubBoardService.getGalleryImageList(attach);
		
		ClubBoardVO detail = clubBoardService.getGalleryDetail(clubboard_no);
		
		model.addAllAttributes(dataMap);
		model.addAttribute("detail", detail);
		model.addAttribute("unityatchmnflno", unityatchmnflno);
		model.addAttribute("clubboard_no", clubboard_no);
		
		
		return url;
	}
	
	@RequestMapping(value="/galleryRegist", method = RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public String galleryRegist(ClubBoardRegistCommand registReq,
								@RequestParam int club_no,
								@RequestParam int clubboardtype_no,
								RedirectAttributes rttr) throws Exception 
	{
		String url ="redirect:/club/"+club_no;
		String savepath= this.clubBoardUploadPath;
		
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(registReq.getUploadFile(), savepath);
		ClubBoardVO board =registReq.toClubBoardVO();
		registReq.setClub_no(club_no);
		registReq.setClubboardtype_no(clubboardtype_no);
		for(MultipartFile file : registReq.getUploadFile()) {
			if(file.getSize() == 0) {
				board.setAttachList(null);
			}else {
				board.setAttachList(attachList);
			}
		}
		clubBoardService.registClubBoard(board);
		rttr.addFlashAttribute("from","regist");
		return url;
	}
	
	@RequestMapping("/registform")
		public String clubBoardRegist(ClubBoardVO cbv,Model model) throws SQLException{
			String url="";
		
		int form=cbv.getClubboardtype_no();
		System.out.println("form="+form);
		if(form==1) {
			url="club/noticeRegist";
		}else if(form==2) {
			url="club/clubBoardRegist";
		}else if(form==3) {
			url="club/galleryRegist";
		}
		
		int pinCount = clubBoardService.pinTotalCount(form);
		
		model.addAttribute("pinCount",pinCount);
		model.addAttribute("clubboardtype_no",cbv.getClubboardtype_no());
		model.addAttribute("club_no",cbv.getClub_no());
		return url;
	}
	
	
	
	@RequestMapping(value="/regist/{club_no}", method = RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public String regist(@PathVariable("club_no") int club_no, ClubBoardRegistCommand clubBoardReq,
			RedirectAttributes rttr) throws Exception{
		
		System.out.println("regist옴!!!!!");
		System.out.println(club_no);
		System.out.println(clubBoardReq.getClubboardtype_no());
		System.out.println(clubBoardReq.getClubboard_cont());
		
		int pin = clubBoardReq.getPin();
		if(pin==1) {
			clubBoardReq.setPin(1);
		}else {
			clubBoardReq.setPin(0);
		}
		
		String url = "redirect:/club/"+club_no;
		
		for (MultipartFile file : clubBoardReq.getUploadFile()) {
			System.out.println("ppp : " + file.getOriginalFilename());
			System.out.println("qqq : " +file.getSize());
		}
		
		//file 저장 -> List<AttachVO>	
		String savepath = this.clubBoardUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(clubBoardReq.getUploadFile(), savepath);
		
		ClubBoardVO clubBoard = clubBoardReq.toClubBoardVO();
		
		for (MultipartFile file : clubBoardReq.getUploadFile()) {
			if(file.getSize() == 0) {
				clubBoard.setAttachList(null);
			}else {
				clubBoard.setAttachList(attachList);
			}
			System.out.println("pppㅇㅇ : " + file.getOriginalFilename());
			System.out.println("qqqㅇㅇ : " +file.getSize());
			
			System.out.println("여기도 나오나요????????????????????");
		}
		
		clubBoard.setClub_no(club_no);
		clubBoardService.registClubBoard(clubBoard);
		
		rttr.addFlashAttribute("from", "regist");
		
		return url;
	}
	
	
	@RequestMapping("/detail")
	public ModelAndView clubBoardDetail(ClubBoardVO clubBoard, String from,
		 ModelAndView mnv,HttpServletRequest req) throws Exception{
		
		int boardPage=(clubBoard.getClubboardtype_no());
		
		String url="";
		if(boardPage==1) {
			url = "club/clubNoticeDetail";
			
		}else if(boardPage==2) {
			url = "club/clubBoarddetail";
			
		}
		
//		HttpSession session = req.getSession();
		
		ClubBoardVO cboard = null;
		if(from!=null && from.equals("list")) {
			
			cboard = clubBoardService.getClubBoard(clubBoard);
			url="redirect:/club/detail?clubboard_no="+clubBoard.getClubboard_no()+"&clubboardtype_no="+clubBoard.getClubboardtype_no();
		
		}else {

			cboard = clubBoardService.getClubBoardForModify(clubBoard);
		}
		
		clubBoard.setUnityatchmnflno(cboard.getUnityatchmnflno());
		
		
		HttpSession session = req.getSession();
		
		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		ClubLikeToVO like= new ClubLikeToVO();
		like.setClubboard_no(clubBoard.getClubboard_no());
		like.setClubboardtype_no(clubBoard.getClubboardtype_no());
		
		like.setEmpl_no(user.getEmpl_no());
		

		like=clubBoardService.selectLikeEmp(like);
		
		
		
		EmpVO emp = clubBoardService.selectEmpByBno(clubBoard);
		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("cboard", cboard);
		dataMap.put("emp", emp);
		dataMap.put("like", like);
		
		dataMap.put("upFileList", clubBoardService.getfileUploadList(clubBoard));
		
		//view에 전달할 값
		mnv.addObject("dataMap", dataMap);
		
		
//		List<BReplyVO> breplies = bReplyService.selectBReplyList(board.getBoard_no());
//		mnv.addObject("breplies", breplies);
		
		
		//view 이름
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(ClubBoardVO clubBoard,ModelAndView mnv)throws Exception{
		
		System.out.println("모디폼");
		String url="club/clubBoardModify";
		
		ClubBoardVO cboard = clubBoardService.getClubBoardForModify(clubBoard);
		
		clubBoard.setUnityatchmnflno(cboard.getUnityatchmnflno());
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("upFileList", clubBoardService.getfileUploadList(clubBoard));
		
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
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String freeboardModify(ClubBoardModifyCommand boardReq, HttpServletRequest request, 
			 RedirectAttributes rttr) throws Exception{
			 	System.out.println("여기가 모디파이입니다~");
			 	System.out.println(boardReq.getDeleteFile());
			
				String savepath = this.clubBoardUploadPath;
			// 파일 저장
			List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(boardReq.getUploadFile(), savepath);
			//BoardVO setting
			ClubBoardVO clubBoard = boardReq.toClubBoardVO();
			clubBoard.setAttachList(attachList);
			
			String url="redirect:/club/detail?clubboard_no="+clubBoard.getClubboard_no()+"&clubboardtype_no="+clubBoard.getClubboardtype_no();
			// DB 저장
			System.out.println(clubBoard.getClubboard_no());
			System.out.println(clubBoard.getClubboardtype_no());
			System.out.println(clubBoard.getUnityatchmnflno());
			
			clubBoardService.modifyAttachByUnifromclub(clubBoard);
			
			rttr.addFlashAttribute("from","modify");
			rttr.addAttribute("clubboard_no",clubBoard.getClubboard_no());
			return url;	
	} 
	
	@RequestMapping("/remove")
	public String remove(ClubBoardVO clubBoard,RedirectAttributes rttr) throws Exception{
		String url = "redirect:/club/"+clubBoard.getClub_no();
		
		System.out.println("1111111111"+clubBoard.getClubboard_no());
		clubBoardService.remove(clubBoard);		
		
		rttr.addFlashAttribute("from","remove");
		return url;		
	}
	

	@RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(AttachVO atch) throws Exception {
		String picture = clubBoardService.getGalleryListImage(atch).getFileName();

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.clubBoardUploadPath;

		try {
			in = new FileInputStream(new File(imgPath, picture));

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);

		} finally {
			in.close();
		}
		return entity;
	}
	@RequestMapping(value = "/getGalleryDetailPic", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getGalleryDetailPic(AttachVO atch) throws Exception {
		
		String picture = clubBoardService.getGalleryImageForDetail(atch).getFileName();

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.clubBoardUploadPath;

		try {
			in = new FileInputStream(new File(imgPath, picture));

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);

		} finally {
			in.close();
		}
		return entity;
	}
	
	@RequestMapping(value = "/deleteGalleryDetail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteGalleryDetail(@RequestBody ClubBoardVO clubBoard) throws SQLException {
		ResponseEntity<String> entity = null;
		
		clubBoardService.deleteGalleryContent(clubBoard);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}

	@RequestMapping(value="/notice/{clubNo}/{page}/{nowSort}/{perPageNum}", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getNotice(@PathVariable("clubNo") int clubNo,Criteria cri, @PathVariable("page") int page, @PathVariable("nowSort") String nowSort,@PathVariable("perPageNum") int perPageNum) throws Exception{
		
		System.out.println("노티쓰옴");

		cri.setPerPageNum(perPageNum);
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> dataMap = clubBoardService.getClubNoticeList(clubNo,cri,nowSort);
		
		entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="/board/{clubNo}/{page}/{nowSort}/{perPageNum}", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getBoard(@PathVariable("clubNo") int clubNo,Criteria cri, @PathVariable("page") int page, @PathVariable("nowSort") String nowSort,@PathVariable("perPageNum") int perPageNum) throws Exception{
		
		System.out.println("보드옴");
		cri.setPerPageNum(perPageNum);
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> dataMap = clubBoardService.getClubFreeBoardList(clubNo, cri, nowSort);
		
		entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	
	
	
	
	
	@RequestMapping(value="/image/{clubNo}/{page}", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getImage(@PathVariable("clubNo") int clubNo,Criteria cri, @PathVariable("page") int page, @RequestParam(defaultValue = "desc") String nowSort) throws Exception{
		
		System.out.println("여기도옴!!!");
		
		System.out.println(clubNo);
		System.out.println(page);
		
		cri.setPerPageNum(4);
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> dataMap = clubBoardService.getClubBoardList(clubNo,cri,nowSort);
		
		entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
//	좋아요 기능
	@RequestMapping(value="/like", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> getLike(@RequestBody ClubLikeToVO likeTo, HttpServletRequest req) throws Exception{
		
		ResponseEntity<Integer> entity = null;
		
		HttpSession session = req.getSession();
		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		likeTo.setEmpl_no(user.getEmpl_no());
		
		
		ClubBoardVO board=new ClubBoardVO();
		
		board.setClubboard_no(likeTo.getClubboard_no());
		board.setClubboardtype_no(likeTo.getClubboardtype_no());
		
		int likeCheck=likeTo.getLikeCheck();
		System.out.println(likeCheck);
		if(likeCheck==1) {
//			System.out.println("하트가 있습니다");
			
			clubBoardService.insertLike(likeTo);
			clubBoardService.boardLikeup(likeTo);
		}else {
			clubBoardService.boardLikedown(likeTo);
			clubBoardService.deleteLike(likeTo);
			
//			System.out.println("하트가 없습니다");
		}
		
		board= clubBoardService.getClubBoardForModify(board);
		
		int likeNum=board.getClubboard_like();
		
		entity = new ResponseEntity<Integer>(likeNum, HttpStatus.OK);
		
		return entity;

		
		
	}
	
	@RequestMapping(value="/option/modify")
	@ResponseBody
	public ResponseEntity<String> changeClub(int club_no , ClubRegistCommand crcmd, List<MultipartFile> uploadPicture) throws Exception{
		
		System.out.println("노티쓰옴");

		ClubVO clubVO = crcmd.toClubVO();
		ResponseEntity<String> entity = null;
		System.out.println(crcmd.getMeetingtime());
		AttachVO attach = null;
		System.out.println(clubVO.getClub_unity());
		if(!uploadPicture.get(0).isEmpty()) {
			List<AttachVO> save = GetAttachesByMultipartFileAdapter.save(uploadPicture, clubBoardUploadPath);
			attach = save.get(0);
			attach.setUnityatchmnflno(attachDAO.selectUnitySeq());
			attach.setAno(1);
			attachDAO.insertAttach(attach);
		}
		
		if(attach != null) {
			clubVO.setClub_unity(attach.getUnityatchmnflno());
		}
		
		List<ClubConceptVO> clubConeptList = crcmd.toClubConeptList();		
		
		clubVO.setClub_no(club_no);
		
		clubService.updateClub(clubVO, clubConeptList);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		
		return entity;
	}
	
}
