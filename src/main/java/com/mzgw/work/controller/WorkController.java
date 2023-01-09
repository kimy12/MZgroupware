package com.mzgw.work.controller;

import java.io.File;
import java.sql.SQLException;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mzgw.command.WorkModifyCommand;
import com.mzgw.command.WorkRegistCommand;
import com.mzgw.depart.service.DepartService;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.DeptVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.MailDeleteVO;
import com.mzgw.dto.WorkMemVO;
import com.mzgw.dto.WorkVO;
import com.mzgw.push.service.PushService;
import com.mzgw.util.Criteria;
import com.mzgw.util.GetAttachesByMultipartFileAdapter;
import com.mzgw.work.service.WorkService;

@Controller
@RequestMapping("/work")
public class WorkController {

	@Autowired
	private PushService pushService;

	@Autowired
	private WorkService workService;

	@Autowired
	DepartService departService;

	@RequestMapping("/main")
	public String workMain(Model model) throws Exception {
		String url = "/work/main";

		return url;
	}

	@RequestMapping("/registForm")
	public String regist(Model model) throws Exception {
		String url = "/work/regist";

		List<DeptVO> departList = departService.getDepartList();

		model.addAttribute("departList", departList);

		return url;
	}

	@Resource(name = "WorkpdsUploadPath")
	private String WorkpdsUploadPath;

	@RequestMapping(value = "/regist", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String regist(WorkRegistCommand registReq, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		String url = "redirect:/work/commonList";

		for (MultipartFile file : registReq.getUploadFile()) {
			System.out.println("ppp : " + file.getOriginalFilename());
			System.out.println("qqq : " + file.getSize());
		}
		;

		String savepath = this.WorkpdsUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(registReq.getUploadFile(), savepath);

		WorkVO work = registReq.toWorkVO();

		for (MultipartFile file : registReq.getUploadFile()) {
			if (file.getSize() == 0) {
				work.setAttachList(null);
			} else {
				work.setAttachList(attachList);
			}

			System.out.println("pppㅇㅇ : " + file.getOriginalFilename());
			System.out.println("qqqㅇㅇ : " + file.getSize());

			System.out.println("여기도 나오나요????????????????????");
		}
		;

		System.out.println(work.getJobBgnde());
		System.out.println(work.getJobEndde());
		System.out.println(work.getJobDept());

		workService.regist(work);

		pushService.registPushForWork(work);

		System.out.println(work + "담기나요");

		rttr.addFlashAttribute("from", "regist");

		return url;
	};

	@RequestMapping("/commonList")
	public void commonList(Model model, Criteria cri) throws Exception {
		Map<String, Object> dataMap = workService.getCommonWorkList(cri);

		dataMap.put("assignList", workService.getAssignList().get("assignList"));
		System.out.println(cri.getPage());
		System.out.println(cri.getPerPageNum());
		System.out.println(cri.getSearchType());
		System.out.println(cri.getKeyword());
		System.out.println(cri.getPerPageNum());

		model.addAllAttributes(dataMap);
	}

	@RequestMapping("/indivList")
	public void individualList(Model model, HttpServletRequest req, Criteria cri,
			@RequestParam(defaultValue = "desc") String nowSort) throws Exception {

		HttpSession session = req.getSession();

		EmpVO user = (EmpVO) session.getAttribute("loginEmp");

		Map<String, Object> dataMap = workService.getIndivWorkList(user, cri, nowSort);
		dataMap.put("assignList", workService.getAssignList().get("assignList"));

		model.addAllAttributes(dataMap);

		model.addAttribute("nowSort", nowSort);

	}

	@RequestMapping("/detail")
	public ModelAndView detail(int wno, ModelAndView mnv, HttpServletRequest request, Model model) throws Exception {
		String url = "/work/detail";

		WorkVO work = null;

		Map<String, Object> dataMap = workService.getAssignList();
		dataMap.put("upFileList", workService.getFileUploadList().get("upFileList"));

		work = workService.getWorkDetail(wno);

		model.addAllAttributes(dataMap);
		mnv.addObject("work", work);
		mnv.setViewName(url);

		return mnv;

	}

	@RequestMapping("/modifyForm")
	public ModelAndView modiefyForm(ModelAndView mnv, int wno, Model model) throws Exception {
		String url = "/work/modify";

		WorkVO work = workService.getWorkDetail(wno);

		List<DeptVO> departList = departService.getDepartList();

		Map<String, Object> dataMap = workService.getAssignList();
		dataMap.put("upFileList", workService.getFileUploadList().get("upFileList"));

		// 파일명 재정의
		if (work != null) {
			List<AttachVO> attachList = work.getAttachList();
			if (attachList != null) {
				for (AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					attach.setFileName(fileName);
				}
			}
		}

		model.addAttribute("departList", departList);
		model.addAllAttributes(dataMap);
		mnv.addObject("work", work);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/modify")
	public String modifyPOST(WorkModifyCommand modifyReq, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		// 파일 삭제
	 	System.out.println(modifyReq.getDeleteFile());
		if (modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for (String anoStr : modifyReq.getDeleteFile()) {

				int uni = Integer.parseInt(anoStr);

				AttachVO attach = workService.getAttachByUni(uni);

				File deleteFile = new File(attach.getUploadPath(), attach.getFileName());

				if (deleteFile.exists()) {
					deleteFile.delete(); // File 삭제
				}

				workService.removeAttachByUni(uni); // DB 삭제
			}
		}

		// 파일 저장
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(modifyReq.getUploadFile(),
				WorkpdsUploadPath);

		WorkVO work = modifyReq.toWorkVO();
		work.setAttachList(attachList);

		String url = "redirect:/work/detail.do?wno=" + work.getJobCode();

		System.out.println(work.getJobCode() + "번호있나요?");
		workService.modify(work);

		rttr.addFlashAttribute("from", "modify");
		rttr.addAttribute("jobCode", work.getJobCode());

		return url;
	}

	@RequestMapping(value = "/assdeleteMem", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> assdeleteMem(@RequestBody WorkMemVO wmv) throws SQLException {

		ResponseEntity<String> entity = null;

		System.out.println(wmv + "테이블");

		workService.assMemDelete(wmv);

		entity = new ResponseEntity<String>("success", HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/deleteWork", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteWorkCode(@RequestBody int workCode) throws SQLException {
		ResponseEntity<String> entity = null;

		workService.deleteWork(workCode);

		entity = new ResponseEntity<String>("success", HttpStatus.OK);

		return entity;
	}

	@RequestMapping("/download")
	public String download(AttachVO attach, Model model) throws Exception {
		String url = "downloadFile";
		AttachVO attachPds = workService.getAttach(attach);

		model.addAttribute("savedPath", attachPds.getUploadPath());
		model.addAttribute("fileName", attachPds.getFileName());

		return url;
	}

}
