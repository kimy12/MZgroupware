package com.mzgw.mail.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mzgw.command.MailRegistCommand;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.MailDeleteVO;
import com.mzgw.dto.MailVO;
import com.mzgw.dto.ReceVO;
import com.mzgw.dto.RefeVO;
import com.mzgw.mail.service.MailService;
import com.mzgw.push.service.PushService;
import com.mzgw.util.Criteria;
import com.mzgw.util.GetAttachesByMultipartFileAdapter;
import com.mzgw.util.MakeFileToZip;
import com.mzgw.util.RESTFileDownloadResolver;


@Controller
@RequestMapping("/mail")
public class MailController {
	@Autowired
	private PushService pushService;
	
	@Autowired
	private MailService mailService;
	
	@Resource(name = "MailpdsUploadPath")
	private String MailpdsUploadPath;
	
	@RequestMapping("/main")
	public String mailMain(@SessionAttribute("loginEmp") EmpVO loginEmp,Model model)throws Exception {
		String url = "/mail/main";
		
		model.addAllAttributes(mailService.getMailListCount(loginEmp));
		
		return url;
	}
	

	@RequestMapping("/sendMail")
	public void sendMailList(Model model, HttpServletRequest req, Criteria cri ,@RequestParam(defaultValue = "desc") String nowSort)throws Exception {
		
		HttpSession session = req.getSession();
		
		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		
		Map<String, Object> dataMap = mailService.getSendMailList(user, cri, nowSort);
	
		
		model.addAllAttributes(dataMap);
		model.addAllAttributes(mailService.getMailListCount(user));
		model.addAttribute("nowSort", nowSort);	
				
	}

	
	@RequestMapping("/receivedMail")
	public void receivedMailList(Model model, HttpServletRequest req, Criteria cri ,@RequestParam(defaultValue = "desc") String nowSort)throws Exception {
		
		HttpSession session = req.getSession();
		
		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		
		Map<String, Object> dataMap = mailService.getReceMailList(user, cri, nowSort);
		
		model.addAllAttributes(dataMap);
		model.addAllAttributes(mailService.getMailListCount(user));
		model.addAttribute("nowSort", nowSort);	
	
	}
	
	@RequestMapping("/modify")
	public String modifyMail()throws Exception {
		String url = "mail/modify";
		
		return url;
	
	}
	
	@RequestMapping("/storageMail")
	public void storageMailList(Model model, HttpServletRequest req, Criteria cri ,@RequestParam(defaultValue = "desc") String nowSort)throws Exception   {
		
		HttpSession session = req.getSession();
		
		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		
		Map<String, Object> dataMap = mailService.getStorageMailList(user, cri, nowSort);
		
		model.addAllAttributes(dataMap);
		model.addAllAttributes(mailService.getMailListCount(user));
		model.addAttribute("nowSort", nowSort);	
	}
	
	@RequestMapping("/removeMail")
	public void removeMailList(@SessionAttribute("loginEmp") EmpVO loginEmp, Model model)throws Exception {
		Map<String, Object> dataMap = mailService.getRemoveMailList(loginEmp);
		
		
		model.addAttribute("dataMap", dataMap);
	}
	
	
	@RequestMapping("/detail")
	public ModelAndView detail(int eno, ModelAndView mnv, HttpServletRequest request, Model model)throws Exception {
		String url = "mail/detail";
		
		MailVO mail = null;
		
		Map<String, Object> dataMap = mailService.getReceEmpList();
		dataMap.put("referEmpList", mailService.getRefeEmpList().get("refeEmpList"));
		dataMap.put("upFileList", mailService.getfileUploadList().get("upFileList"));
		
	
		System.out.println("eno 객체 찍히는지 확인 " + eno);
		
		mail = mailService.getMailDetail(eno);
		
		model.addAllAttributes(dataMap);
		mnv.addObject("mail", mail);
		mnv.setViewName(url);
	
		return mnv;
	}

	
	@RequestMapping("/registForm")
	public String registMail(@SessionAttribute("loginEmp") EmpVO loginEmp, Model model)throws Exception {
		String url ="mail/regist";
		
		Map<String, Object> dataMap = mailService.getEmpMailList();
		
		dataMap.put("recentlyList",mailService.getRecentlyList(loginEmp).get("recentlyList"));
		model.addAllAttributes(dataMap);
		
		return url;
	}
	
	
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public String regist(MailRegistCommand registReq, 
						@RequestParam String empList,
						@RequestParam String mailList,
						@RequestParam String rmailList,
						@RequestParam String refList, 
						@RequestParam String tempor,
						@RequestParam String mailSize,
						HttpServletRequest request, 
						RedirectAttributes rttr)throws Exception {
		
		String url = "";
		
		for (MultipartFile file : registReq.getUploadFile()) {
			System.out.println("ppp : " + file.getOriginalFilename());
			System.out.println("qqq : " +file.getSize());
		}
		
		String savepath = this.MailpdsUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(registReq.getUploadFile(), savepath);
		
		
		MailVO mail = registReq.toMailVO();
		
		System.out.println(mail.getEmailSj());
		
		registReq.setMailList(mailList);
		registReq.setRefeMailList(rmailList);
		
		
		List<ReceVO> resultList = registReq.toReceEmpList();
		List<RefeVO> rfeResultList = registReq.toRefeEmpList();
		
		
		for (MultipartFile file : registReq.getUploadFile()) {
			if(file.getSize() == 0) {
				mail.setAttachList(null);
			}else {
				mail.setAttachList(attachList);
			}
			System.out.println("pppㅇㅇ : " + file.getOriginalFilename());
			System.out.println("qqqㅇㅇ : " +file.getSize());
			
			System.out.println("여기도 나오나요????????????????????");
		}
		
		if(mail.getEmailSj().isEmpty()) {
			mail.setEmailSj("제목없음");
		}
	
		mailService.regist(mail, resultList, rfeResultList, tempor);
		
		pushService.registPushForMail(mail, resultList);
		
		System.out.println(resultList + "찍히는거 확인!!!!!!!!!!!!!!!!!!");
		
		rttr.addFlashAttribute("from", "regist");

		if(tempor.equals("1")) {
			url = "redirect:/mail/storageMail";	
		}else if(tempor.equals("0")){
			url = "redirect:/mail/sendMail";	
		}
		
		return url;
	}
	
	
	@RequestMapping(value = "/receRemoveCode", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> receRemoveCode(@RequestBody List<Integer> receCkArr) throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		for(int no : receCkArr) {
			System.out.println(no);
		}
		
		mailService.ReceUpdateRemoveCode(receCkArr);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	
	@RequestMapping(value = "/sendRemoveCode", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> sendRemoveCode(@RequestBody List<Integer> receCkArr) throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		for(int no : receCkArr) {
			System.out.println(no);
		}
		
		mailService.SendUpdateRemoveCode(receCkArr);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/stateUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> stateCodeUpdate(@RequestBody List<Integer> stateUpdateList) throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		for(int no : stateUpdateList) {
			System.out.println(no);
		}
		
		mailService.StateUpdate(stateUpdateList);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}

	
	@RequestMapping(value = "/deleteMail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteMailCode(@RequestBody List<MailDeleteVO> allArray) throws SQLException {
	//public ResponseEntity<String> deleteMailCode(String[] emailNo, String[] tableCode) throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		//System.out.println(allArray + "테이블");
		
		mailService.deleteMail(allArray);
		
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/storageSend")
	public String storageSend(int eno, ModelAndView mnv, HttpServletRequest request, Model model)throws Exception {
		String url = "redirect:/mail/sendMail";	
		
		mailService.storageSendMail(eno);
		
		return url;
	}

	@RequestMapping(value = "/returnMail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> returnMailCode(@RequestBody MailDeleteVO allArray) throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		System.out.println(allArray + "테이블");
		
		mailService.returnMail(allArray);
		
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/download")
	public String download(AttachVO attach, Model model)throws Exception {
		String url = "downloadFile";
		AttachVO attachPds = mailService.getAttach(attach);
		
		model.addAttribute("savedPath", attachPds.getUploadPath());
		model.addAttribute("fileName", attachPds.getFileName());
		
		return url;
	}
	
	@RequestMapping("/zipDownload")
	@ResponseStatus(HttpStatus.OK)
	public void zipDownload(@RequestBody List<AttachVO> attach, HttpServletRequest req, HttpServletResponse resp)throws Exception {
		
		List<String> attachList = mailService.downloadAttachList(attach);
		
		MakeFileToZip.makeZip(attachList, "MailFile.zip", req, resp);
                      
	}

}
