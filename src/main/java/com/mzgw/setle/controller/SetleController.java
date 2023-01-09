package com.mzgw.setle.controller;

import static org.junit.Assert.fail;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.command.SelteRegistCommand;
import com.mzgw.depart.service.DepartService;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.DeptVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.SetleEmpVO;
import com.mzgw.dto.SetleFormVO;
import com.mzgw.dto.SetleVO;
import com.mzgw.emp.service.EmpService;
import com.mzgw.push.service.PushService;
import com.mzgw.setle.dao.SetleFormDAO;
import com.mzgw.setle.service.SetleService;
import com.mzgw.util.Criteria;
import com.mzgw.util.GetAttachesByMultipartFileAdapter;


@Controller
@RequestMapping("/setle")
public class SetleController {

	@Autowired
	DepartService departService;
	
	@Autowired
	SetleService setleService;
	
	@Autowired
	
	AttachDAO attachDAO;
	
	@Autowired
	SetleFormDAO setleFormDAO;
	
	@Autowired
	EmpService empService;
	
	@Autowired
	PushService pushService;
	
	@Resource(name = "fileUploadPath")
	private String fileUploadPath;
	
	@Resource(name = "signImgaPath")
	private String signImgaPath;
	
	@RequestMapping("/setleMyList")
	public void myList(Model model, HttpServletRequest req, Criteria cri ,@RequestParam(defaultValue = "desc") String nowSort,@RequestParam(defaultValue = "-1")int sttusNo) throws Exception{
		
		HttpSession session = req.getSession();

		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		
		
		Map<String, Object> dataMap = setleService.getSetleListByWriterNo(cri, nowSort,user,sttusNo);
		
		
		model.addAllAttributes(dataMap);
		model.addAttribute("sttusNo", sttusNo);
		
		
	}
	
	@RequestMapping("/setleMyTrash")
	public void myTrash(Model model, HttpServletRequest req, Criteria cri ,@RequestParam(defaultValue = "desc") String nowSort) throws Exception{
		
		HttpSession session = req.getSession();

		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		
		
		Map<String, Object> dataMap = setleService.getDeleteSetleListByWriterNo(cri, nowSort,user);
		
		
		model.addAllAttributes(dataMap);
		
		
		
	}
	
	@RequestMapping("/setlePartList")
	public void partList(Model model, HttpServletRequest req, Criteria cri ,@RequestParam(defaultValue = "desc") String nowSort) throws Exception{
		HttpSession session = req.getSession();

		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		
		Map<String, Object> dataMap = setleService.getSetleListByDepart(cri, nowSort, user);
		
		
		model.addAllAttributes(dataMap);
		
	}
	
	@RequestMapping("/setleAccept")
	public void setleAcceptForm(Model model, HttpServletRequest req, Criteria cri ,@RequestParam(defaultValue = "desc") String nowSort) throws Exception{
		HttpSession session = req.getSession();

		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		
	
		
		Map<String, Object> dataMap = setleService.getSetleLisBySetleEmpSetleNo(cri, nowSort, user);
		
		
		model.addAllAttributes(dataMap);
		
	}
	
	@RequestMapping("/setleWrite")
	public void seltleWriteForm(Model model,HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();

		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		
		List<DeptVO> departList = departService.getDepartList();
		EmpVO leaderEmp = null;
		if(user.getDprlr_empl_no()!=null) {
			leaderEmp = empService.getEmpByEmplNo(user.getDprlr_empl_no());
		}else {
			for(DeptVO depart : departList) {
				if(user.getDept().equals(depart.getDept_nm())) {
					leaderEmp = empService.getEmpByEmplNo(depart.getDprlr_empl_no());
				}
			}
		}
		List<EmpVO> empListByDept = empService.getEmpListByDept(user.getDept());
		List<SetleFormVO> formList = setleFormDAO.selectSetleFormList();
		
		
		model.addAttribute("formList",formList);
		model.addAttribute("departEmpCount",empListByDept.size());
		model.addAttribute("departList", departList);
		model.addAttribute("leaderEmp", leaderEmp);
		
	}
	
	@RequestMapping("/setleModify")
	public void seltleModifyForm(Model model, int setleNo,HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();

		EmpVO user = (EmpVO) session.getAttribute("loginEmp");
		List<DeptVO> departList = departService.getDepartList();
		SetleVO setle  = setleService.getSetleBySetleNo(setleNo);
		EmpVO leaderEmp = empService.getEmpByEmplNo(user.getDprlr_empl_no());
		
		model.addAttribute("setle", setle);
		model.addAttribute("departList", departList);
		model.addAttribute("leaderEmp", leaderEmp);
	}
	
	@RequestMapping(value ="/modify", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String setleModify(SelteRegistCommand command, int setleNo, int lastAno, @RequestParam(required = false)int[] removeAttaches, Model model) throws Exception {
		
		String url ="redirect:/setle/setleDetail?setleNo="+setleNo;
		
		
		SetleVO setle = command.toSetleVO();
		
		setle.setSetleNo(setleNo);
		
		List<AttachVO> attachList = null;
		List<SetleEmpVO> setleEmpList = new ArrayList<SetleEmpVO>();
		
		if(command.getSetleEmpList() != null && !command.getSetleEmpList().isEmpty()) {
			for(String str : command.getSetleEmpList()) {
		
				StringTokenizer st = new StringTokenizer(str, "/");
				SetleEmpVO setleEmp = new SetleEmpVO();
				setleEmp.setEmplNo(st.nextToken());
				setleEmp.setEmpNm(st.nextToken());
				setleEmpList.add(setleEmp);
				
			}
		}
		
		
		if(command.getUploadFile().get(0).getSize()!=0) {
			
			attachList = GetAttachesByMultipartFileAdapter.save(command.getUploadFile(), this.fileUploadPath);
		}
		 
		setle.setSetleEmpList(setleEmpList);
		setle.setSetleAttachList(attachList);
				
		setleService.modify(setle, lastAno, removeAttaches);
		
		model.addAttribute("from", "modify");
		
		return url;
		
	}
	
	@RequestMapping(value ="/regist", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String setleRegist(SelteRegistCommand command, Model model) throws Exception {
		
		String url ="redirect:/setle/setleMyList";
			
		SetleVO setle = command.toSetleVO();
				
		List<AttachVO> attachList = null;
		List<SetleEmpVO> setleEmpList = new ArrayList<SetleEmpVO>();
		
		if(command.getSetleEmpList() != null && !command.getSetleEmpList().isEmpty()) {
			for(String str : command.getSetleEmpList()) {
		
				StringTokenizer st = new StringTokenizer(str, "/");
				SetleEmpVO setleEmp = new SetleEmpVO();
				setleEmp.setEmplNo(st.nextToken());
				setleEmp.setEmpNm(st.nextToken());
				setleEmpList.add(setleEmp);
				
			}
		}
		
		
		if(command.getUploadFile().get(0).getSize()!=0) {
			
			attachList = GetAttachesByMultipartFileAdapter.save(command.getUploadFile(), this.fileUploadPath);
		}
		 
		setle.setSetleEmpList(setleEmpList);
		setle.setSetleAttachList(attachList);
				
		setleService.regist(setle);
		SetleVO setleBySetleNo = setleService.getSetleBySetleNo(setle.getSetleNo());
		if(setleBySetleNo.getSttusNo()==1) {
			pushService.registPushForSetleProcess(setleBySetleNo);
		}
		
		model.addAttribute("from", "regist");
		
		return url;
		
	}
	
	
	@RequestMapping("/setleDetail")
	public void seltleMyDetail(Model model, int setleNo) throws Exception {
		
		SetleVO setle = setleService.getSetleBySetleNo(setleNo);
		
		List<EmpVO> empListByDept = empService.getEmpListByDept(setle.getWriterEmpVO().getDept());
		
		model.addAttribute("departEmpCount",empListByDept.size());
		
		model.addAttribute("setle",setle);
		
	}
	
	@RequestMapping("/detail")
	public void seltleDetail(Model model, int setleNo) throws Exception {
		
		SetleVO setle = setleService.getSetleBySetleNo(setleNo);
		
		model.addAttribute("setle",setle);
		
	}
	
	@RequestMapping(value = "/formText",produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> setleFormTextToString(int unityFileNo)throws Exception{
		ResponseEntity<String> entity = null;
		
		AttachVO attach = attachDAO.selectAttachByUni(unityFileNo);
		
		File file = new File(attach.getUploadPath()+"\\"+attach.getFileName());
		
		 FileReader filereader = new FileReader(file);
		 String out = "";
         //입력 버퍼 생성
         BufferedReader bufReader = new BufferedReader(filereader);
         String line = "";
         while((line = bufReader.readLine()) != null){
             
             out += line;
         }
         //.readLine()은 끝에 개행문자를 읽지 않는다.            
         bufReader.close();

         
         entity = new ResponseEntity<String>(out,HttpStatus.OK);
         
         
         return entity;
	}
	
	@RequestMapping(value = "/formTextByNo",produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> setleFormTextToStringByFormNo(int FormNo)throws Exception{
		ResponseEntity<String> entity = null;
		
		int unityFileNo = 0;
		
		unityFileNo = setleFormDAO.selectSetleFormBySetleFormNo(FormNo).getFormFile();
		
		AttachVO attach = attachDAO.selectAttachByUni(unityFileNo);
		
		File file = null;
		
		file = new File(attach.getUploadPath()+File.separator+attach.getFileName());
		
		 FileReader filereader = new FileReader(file);
		 String out = "";
         //입력 버퍼 생성
         BufferedReader bufReader = new BufferedReader(filereader);
         String line = "";
         while((line = bufReader.readLine()) != null){
             
             out += line;
         }
         //.readLine()은 끝에 개행문자를 읽지 않는다.            
         bufReader.close();

         
         entity = new ResponseEntity<String>(out,HttpStatus.OK);
         
         
         return entity;
	}
	
	@RequestMapping("/download")
	public String download(AttachVO attach, Model model)throws Exception {
		String url = "downloadFile";
		
		
		model.addAttribute("savedPath", attach.getUploadPath());
		model.addAttribute("fileName", attach.getFileName());
		
		return url;
	}
	
	@RequestMapping("sttusChange")
	@ResponseStatus(code = HttpStatus.OK)
	public void sttusChange(SetleVO setle) throws Exception{
		
		setleService.changeSttus(setle);
		
	}
	
	@RequestMapping("/main")
	public void mainPage(@SessionAttribute("loginEmp") EmpVO loginEmp, Model model) throws Exception{
		
		Map<String, Object> perCalc = setleService.getsetlePerCalc(loginEmp);
		
		
		model.addAllAttributes(perCalc);
		
	}
	
	@RequestMapping("/agree")
	public String sttusAgree(SetleEmpVO setleEmp, MultipartFile uploadSign) throws Exception {
		
		String url ="redirect:/setle/setleDetail?setleNo="+setleEmp.getSetleNo();
		
		
		
		String FileName = UUID.randomUUID().toString()+".png";
		
		File sign = new File(signImgaPath, FileName);
		
		sign.mkdirs();
		
		uploadSign.transferTo(sign);
		
		setleEmp.setEmpSign(sign.getPath());
		
		setleService.changeSttusAgree(setleEmp);		
		
		
		return url;
	}
	
	@RequestMapping("/disagree")
	public String sttusDisagree(SetleEmpVO setleEmp) throws Exception {
		
		String url ="redirect:/setle/setleDetail?setleNo="+setleEmp.getSetleNo();
		
		
		setleService.changeSttusDisgree(setleEmp);		
		
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendTrash", method = RequestMethod.POST)
	public ResponseEntity<String> sendTrash(@RequestParam(value="setleNoList[]") List<Integer> setleNoList) throws Exception {
		System.out.println(" 여기 작동중우우우우우");
		ResponseEntity<String> entity = null;
		
		for(int setleNo : setleNoList) {
			System.out.println(" 여기 작동중우우우우우");
			SetleVO setle = new SetleVO();
			setle.setSetleNo(setleNo);
			setle.setDeletleOn("Y");
			setleService.changeSetleDel(setle);

		}
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendMyList", method = RequestMethod.POST)
	public ResponseEntity<String> sendMyList(@RequestParam(value="setleNoList[]") List<Integer> setleNoList) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		for(int setleNo : setleNoList) {
		
		SetleVO setle = new SetleVO();
		setle.setSetleNo(setleNo);
		setle.setDeletleOn("N");
		setleService.changeSetleDel(setle);

		}
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/removeSetle", method = RequestMethod.POST)
	public ResponseEntity<String> removeSetle(@RequestParam(value="setleNoList[]") List<Integer> setleNoList) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		for(int setleNo : setleNoList) {
			
			setleService.removeSetle(setleNo);

		}
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendProcess", method = RequestMethod.POST)
	public ResponseEntity<String> sendProcess(@RequestParam(value="setleNoList[]") List<Integer> setleNoList) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		for(int setleNo : setleNoList) {
			
			SetleVO setle = new SetleVO();
			setle.setSetleNo(setleNo);
			
			setleService.changeSttusProcess(setle);
			pushService.registPushForSetleProcess(setle);
		}
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getForm")
	public ResponseEntity<List<SetleFormVO>> getForm() throws Exception {
		
		ResponseEntity<List<SetleFormVO>> entity = null;
		List<SetleFormVO> formList = null;
		
		formList = setleFormDAO.selectSetleFormList();
		
		
		entity = new ResponseEntity<List<SetleFormVO>>(formList, HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/addForm")
	public ResponseEntity<String> addForm(SetleFormVO form) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		setleService.addForm(form);
		
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
}
