package com.mzgw.feed.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.FeedLikeVO;
import com.mzgw.dto.FeedReplyVO;
import com.mzgw.dto.FeedVO;
import com.mzgw.dto.MailDeleteVO;
import com.mzgw.feed.service.FeedService;
import com.mzgw.util.GetAttachesByMultipartFileAdapter;
import com.mzgw.util.MakeFileName;


@Controller
@RequestMapping("/feed")
public class FeedController {

   @Autowired
   private FeedService feedService;
   
   
   @Resource(name = "feedUploadPath")
	private String feedUploadPath;
   
   @RequestMapping("/feedPage")
   public ModelAndView feedPage(@SessionAttribute("loginEmp") EmpVO loginEmp, Model model, ModelAndView mnv)throws Exception{
      String url = "/feed/feedPage";
      
      FeedVO feed = feedService.getFeedContent(loginEmp.getEmpl_no());
      List<FeedReplyVO> reply = feedService.getFeedReplyList(feed.getReplyNo());
      List<FeedVO> feedAddress = feedService.getFeedAdressList();
   
      Map<String, Object> dataMap = feedService.feedContentImgList(feed);
      
      System.out.println(feed.getUnity());
      System.out.println("시스오~~~~~~@@");
      
      FeedLikeVO like = new FeedLikeVO();
      like.setFeedEmp(feed.getEmpNo());
      like.setLikeEmp(loginEmp.getEmpl_no());
      
      System.out.println(feed.getEmpNo());
      System.out.println(loginEmp.getEmpl_no());
      
      like = feedService.selectLikeEmp(like);
      
      model.addAllAttributes(dataMap);
      mnv.addObject("feed", feed);
      mnv.addObject("reply", reply);
      mnv.addObject("like", like);
      mnv.addObject("feedAddress", feedAddress);
   
      mnv.setViewName(url);
      
      return mnv;
   }
   
   
   @RequestMapping(value = "/feedReplyInsert", method = RequestMethod.POST)
   @ResponseBody
   public ResponseEntity<Integer> feedReplyInsert(@RequestBody FeedReplyVO rvo) throws Exception {
      
      ResponseEntity<Integer> entity = null;
      
      int data = feedService.getFeedSeqNext();
      
      rvo.setReplyNo(data);
      
      feedService.insertFeedReply(rvo);
      
      entity = new ResponseEntity<Integer>(data, HttpStatus.OK);
      
      return entity;
   }
   
   @RequestMapping(value = "/feedMessage", method = RequestMethod.POST)
   @ResponseBody
   public ResponseEntity<String> feedMessage(@RequestBody FeedVO fvo) throws SQLException {
      ResponseEntity<String> entity = null;
      
      feedService.messageUpdate(fvo);
      
      entity = new ResponseEntity<String>("success", HttpStatus.OK);
      
      return entity;
   }
   
   @RequestMapping(value = "/feedNicName", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
   @ResponseBody
   public ResponseEntity<String> nicName(@RequestBody FeedVO fvo) throws SQLException {
      ResponseEntity<String> entity = null;
      
      List<EmpVO> list = feedService.getEmpNicNameList();
      
      String msg = "";
      
      boolean chk = false;
      
	  for(EmpVO vo : list) {
		  if(chk || vo.getNcnm().equals(fvo.getNicName())) {
			  msg = "중복된 닉네임 입니다.";
		  }else {
			  msg = "변경 되었습니다.";
			  feedService.nicNameUpdate(fvo);
		  }
	  }
      
      
      entity = new ResponseEntity<String>(msg, HttpStatus.OK);
      
      return entity;
   }
   
   @RequestMapping(value = "/replyModify", method = RequestMethod.POST)
   @ResponseBody
   public ResponseEntity<List<FeedReplyVO>> replyModify(@RequestBody FeedReplyVO rvo) throws SQLException {
      ResponseEntity<List<FeedReplyVO>> entity = null;
      
      feedService.updateFeedReply(rvo);
      
      List<FeedReplyVO> reply = feedService.getFeedReplyList(rvo.getReplyType());
      
      entity = new ResponseEntity<List<FeedReplyVO>>(reply, HttpStatus.OK);
      return entity;
   }
   
   @RequestMapping(value = "/deleteReply", method = RequestMethod.POST)
   @ResponseBody
   public ResponseEntity<List<FeedReplyVO>> replyDelete(@RequestBody FeedReplyVO rvo) throws SQLException {
      ResponseEntity<List<FeedReplyVO>> entity = null;
      
      feedService.deleteFeedReply(rvo);
      
      List<FeedReplyVO> reply = feedService.getFeedReplyList(rvo.getReplyType());
      
      
      entity = new ResponseEntity<List<FeedReplyVO>>(reply, HttpStatus.OK);
      return entity;
   }
   
   @RequestMapping(value = "/deleteFeedCon", method = RequestMethod.POST)
   @ResponseBody
   public ResponseEntity<String> replyDelete(@RequestBody AttachVO avo) throws Exception {
	      ResponseEntity<String> entity = null;
	      
	      feedService.deleteFeedContent(avo);
	      
	      entity = new ResponseEntity<String>("success", HttpStatus.OK);
	      return entity;
	   }
   

   @RequestMapping(value = "/like", method = RequestMethod.POST)
   @ResponseBody
   public ResponseEntity<Integer> getLike(@RequestBody FeedLikeVO likeTo, HttpServletRequest req) throws Exception{
      ResponseEntity<Integer> entity = null;
      
      HttpSession session = req.getSession();
      EmpVO user = (EmpVO) session.getAttribute("loginEmp");
      likeTo.setLikeEmp(user.getEmpl_no());
      
      FeedVO feed = new FeedVO();
      feed.setEmpNo(likeTo.getFeedEmp());
      
      
      int likeCheck = likeTo.getLikeCheck();

      System.out.println(likeCheck);
      
      if(likeCheck == 1) {
         feedService.insertLike(likeTo);
         feedService.feedLikeup(likeTo);
      }else {
         feedService.deleteLike(likeTo);
         feedService.feedLikedown(likeTo);
      }
      
      feed = feedService.getFeedContent(likeTo.getFeedEmp());
      
      
      int likeCount = feed.getLikeGoob();
      
      System.out.println(likeCount + "!!!!!!!!!!!!!!!!!!!!!!");
      
      entity = new ResponseEntity<Integer>(likeCount, HttpStatus.OK);
      
      return entity;
   }
   
   @RequestMapping("/feedMove")
   public ModelAndView feedMove(@SessionAttribute("loginEmp") EmpVO loginEmp, String empNo, ModelAndView mnv, HttpServletRequest request, Model model)throws Exception{
      
      String url = "/feed/feedPage";
      
      FeedVO feed = feedService.getFeedContent(empNo);
      List<FeedReplyVO> reply = feedService.getFeedReplyList(feed.getReplyNo());
      List<FeedVO> feedAddress = feedService.getFeedAdressList();
      Map<String, Object> dataMap = feedService.feedContentImgList(feed);
      
      FeedLikeVO like = new FeedLikeVO();
      like.setFeedEmp(empNo);
      like.setLikeEmp(loginEmp.getEmpl_no());
      
      like = feedService.selectLikeEmp(like);
      
      model.addAllAttributes(dataMap);
      mnv.addObject("feed", feed);
      mnv.addObject("reply", reply);
      mnv.addObject("like", like);
      mnv.addObject("feedAddress", feedAddress);
      mnv.setViewName(url);
      
      return mnv;
   }
   
   @SuppressWarnings("unused")
   private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = null;

		/* 파일유무확인 */
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {

			/* 파일저장폴더설정 */
			String uploadPath = feedUploadPath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);

			storeFile.mkdirs();

			// local HDD 에 저장.
			multi.transferTo(storeFile);

			if (oldPicture != null && !oldPicture.isEmpty()) {
				File oldFile = new File(uploadPath, oldPicture);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		return fileName;
	}
   
   @RequestMapping(value = "/regist", method = RequestMethod.POST)
   public String regist(@SessionAttribute("loginEmp") EmpVO loginEmp, FeedVO fvo) throws Exception, IOException {
		String url = "redirect:/feed/feedPage";	

		fvo.setEmpNo(loginEmp.getEmpl_no());
		
		FeedVO member = fvo;
		
		feedService.regist(member);

		return url;
	}
   
   @RequestMapping(value = "/proregist", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
   public String proregist(@SessionAttribute("loginEmp") EmpVO loginEmp, FeedVO fvo) throws Exception, IOException {
		String url = "redirect:/feed/feedPage";	

		fvo.setEmpNo(loginEmp.getEmpl_no());
		
		FeedVO member = fvo;
		
		feedService.profile(member);

		return url;
	}
   
   @RequestMapping(value = "/feedImgContent", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
   public String imgContent(@SessionAttribute("loginEmp") EmpVO loginEmp, HttpServletRequest request, FeedVO fvo)throws Exception{
	   String url = "redirect:/feed/feedPage";	
	   
	   
	   for (MultipartFile file : fvo.getUploadFile()) {
			System.out.println("ppp : " + file.getOriginalFilename());
			System.out.println("qqq : " +file.getSize());
		}
	   
	   String savepath = this.feedUploadPath;
	   List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(fvo.getUploadFile(), savepath);
	 
	   
	   	
	   
	   fvo.setAttachList(attachList);
	   fvo.setEmpNo(loginEmp.getEmpl_no());
	   feedService.selectInsertFeedImgContent(fvo);
	   
	   return url;
   };
   
   @RequestMapping(value = "/feedDeleteContent", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
   @ResponseBody
   public ResponseEntity<String> feedDeleteContent(@RequestBody AttachVO avo) throws Exception {
	   ResponseEntity<String> entity = null;
	   
	   
	   System.out.println(avo.getUnityatchmnflno());
	   System.out.println(avo.getAno());
	   System.out.println("컨트롤러 확인하기~");
		
	   feedService.deleteFeedContent(avo);
	   
	   
	   entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
   }
   
   
}
