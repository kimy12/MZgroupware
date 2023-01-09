package com.mzgw.pds.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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

import com.mzgw.command.PdsDepCommand;
import com.mzgw.command.PdsPrivateCommand;
import com.mzgw.command.PdsPublicCommand;
import com.mzgw.depart.service.DepartService;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.DeptVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.FavVO;
import com.mzgw.dto.PdsDepVO;
import com.mzgw.dto.PdsPrivateVO;
import com.mzgw.dto.PdsPublicVO;
import com.mzgw.dto.RefrnVO;
import com.mzgw.pds.service.PdsDepService;
import com.mzgw.pds.service.PdsFavService;
import com.mzgw.pds.service.PdsPrivateService;
import com.mzgw.pds.service.PdsPublicService;
import com.mzgw.util.Criteria;
import com.mzgw.util.GetAttachesByMultipartFileAdapter;
import com.mzgw.util.MakeFileName;
import com.mzgw.util.MakeFileToZip;
import com.mzgw.util.RESTFileDownloadResolver;

import net.lingala.zip4j.core.ZipFile;

@Controller
@RequestMapping("/pds")
public class PdsController {
	
	@Resource(name="pdsPrivateService")
	private PdsPrivateService pdsPrivateService;
	
	@Resource(name="pdsPublicService")
	private PdsPublicService pdsPublicService;
	
	@Resource(name="pdsDepService")
	private PdsDepService pdsDepService;
	
	@Autowired 
	PdsFavService pdsFavService;
	
	@Autowired
	DepartService departService;
	
	@RequestMapping("/main")
	public String pdsMain(Model model)throws Exception {
		String url = "/pds/main";
		
		return url;
	}
	
	@RequestMapping("/modifyForm")
	public String modifyContent(int m_unityatchmnflno, Model model) throws SQLException{
		String url ="pds/modify";
		List<DeptVO> departList = departService.getDepartList();
		
		model.addAttribute("departList", departList);
		
		//Map<String, Object> dataMapForM =pdsPrivateService.getOnlyAttachList(m_unityatchmnflno);
		
		//model.addAttribute("dataMapForM",dataMapForM);
		model.addAttribute("m_unityatchmnflno", m_unityatchmnflno);
		return url;
	}
	
	@RequestMapping(method = RequestMethod.POST, value="/folderModify")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> folderModify(@RequestBody PdsPrivateVO vo) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> folders = pdsPrivateService.getOnlyAttachList(vo);
		entity = new ResponseEntity<Map<String, Object>>(folders, HttpStatus.OK);	
		
		return entity;
	}
	
	@RequestMapping(value = "/dpsDetail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<AttachVO> modifyFolderName(@RequestBody AttachVO attach) throws SQLException {
		ResponseEntity<AttachVO> entity = null;
		
		AttachVO result = pdsPrivateService.getAttach(attach);
		
		entity = new ResponseEntity<AttachVO>(result, HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/pdsFolders")
	public ModelAndView pdsFolders(Criteria cri,
								   ModelAndView mnv,
								   @RequestParam(defaultValue = "desc") String nowSort) throws Exception{
		String url ="pds/pdsFolders";
		
		cri.setPerPageNum(7);
		Map<String, Object> dataMap = pdsPublicService.getPdsPublicService(cri, nowSort);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		
		return mnv;
	}
	
	@RequestMapping("/pdsPrivateFolders")
	public void pdsPrivateFolders(@SessionAttribute("loginEmp") EmpVO loginEmp, 
									Criteria cri,
									@RequestParam(defaultValue = "desc") String nowSort,
									Model model)throws Exception {
		
		cri.setPerPageNum(7);
		Map<String, Object> dataMap = pdsPrivateService.getPdsPrivateService(loginEmp, cri, nowSort);
		
		//Map<String, Object> dataMapForRefrn = pdsPrivateService.getRefrnList(loginEmp);
		
		List<DeptVO> departList = departService.getDepartList();
		model.addAttribute("departList", departList);
		
		
		//model.addAttribute("dataMapForRefrn", dataMapForRefrn);
		model.addAllAttributes(dataMap);
		
	}
	

	@RequestMapping("/pdsDepFolders")
	public void pdsDepFolders(@SessionAttribute("loginEmp") EmpVO loginEmp, 
								Criteria cri,
								@RequestParam(defaultValue = "desc") String nowSort,
								Model model) throws Exception{
		
		cri.setPerPageNum(7);
		Map<String, Object> dataMap = pdsDepService.getPdsDepService(loginEmp, cri, nowSort);
		
		model.addAllAttributes(dataMap);
		
	}
	

	@RequestMapping("/pdsPrivateList")
	public String pdsPrivateList(@SessionAttribute("loginEmp") EmpVO loginEmp,
								Criteria cri,
								@RequestParam(defaultValue = "desc") String nowSort,
								String m_title, 
								String m_writer,
								int m_unityatchmnflno, 
								Model model)throws Exception {
		String url ="pds/pdsPrivateList";
		
		Map<String, Object> dataMap = pdsPrivateService.getAttachList(m_unityatchmnflno,loginEmp, cri, nowSort);
		
		model.addAllAttributes(dataMap);
		model.addAttribute("m_unityatchmnflno", m_unityatchmnflno);
		model.addAttribute("m_title", URLDecoder.decode(m_title, "utf-8"));
		System.out.println("=================================");
		System.out.println("=================================");
		System.out.println("=================================");
		System.out.println("=================================");
		System.out.println("=================================");
		System.out.println("=================================");
		System.out.println(m_writer);
		System.out.println("=================================");
		System.out.println("=================================");
		System.out.println("=================================");
		System.out.println("=================================");
		System.out.println("=================================");
		
		model.addAttribute("m_writer", URLDecoder.decode(m_writer, "utf-8"));
		return url;
	}
	
	@RequestMapping(value="/regist", method = RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public String insertPrivate(PdsPrivateCommand registReq, 
								PdsDepCommand registReqDep, 
								PdsPublicCommand registReqPublic,
								RedirectAttributes rttr, 
								HttpServletRequest request, 
								@RequestParam String emp_nickname) throws Exception 
	{	
		String pds_public= request.getParameter("range1"); 
		String pds_dep= request.getParameter("range2"); 

		
		String url = "redirect:/pds/pdsPrivateFolders";
		
		String savepath = this.fileUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(registReq.getUploadFile(), savepath);
		
		PdsPrivateVO mpds = registReq.toPdsPrivateVO();
		registReq.setEmp_nickname(emp_nickname);
		
		PdsDepVO dpds = registReqDep.toPdsDepVO();
		registReqDep.setEmp_nickname(emp_nickname);
		
		PdsPublicVO epds = registReqPublic.toPdsPublicVO();
		registReqPublic.setEmp_nickname(emp_nickname);
		
		List<RefrnVO> rfeResultList = registReq.toRefrnList();
		
		for(MultipartFile file : registReq.getUploadFile()) {
			if(file.getSize() == 0) {
				mpds.setAttachList(null);
				dpds.setAttachList(null);
				epds.setAttachList(null);
			}else {
				mpds.setAttachList(attachList);
				dpds.setAttachList(attachList);
				epds.setAttachList(attachList);
			}
		}
		
		
		if(pds_public != null) {pdsPublicService.insert(epds);}
		if(pds_dep != null) {pdsDepService.insertPdsDep(dpds);}
		
		pdsPrivateService.insert(mpds,rfeResultList);
		
		rttr.addFlashAttribute("from","regist");
	
		return url;
	}

	  @RequestMapping(value = "/countFiles", method = RequestMethod.POST)
	  @ResponseBody 
	  public ResponseEntity<List<Integer>> countFiles(@RequestBody List<Integer> m_unityatchmnflno)throws SQLException {
	  
	  ResponseEntity<List<Integer>> entity = null;
	  
	  List<Integer> resultCnt =  pdsPrivateService.iscntfiles(m_unityatchmnflno);
	  
	  entity = new ResponseEntity<List<Integer>>(resultCnt, HttpStatus.OK); 
	  return entity;
	  }
	  
	  @RequestMapping(value = "/countFilesForE", method = RequestMethod.POST)
	  @ResponseBody 
	  public ResponseEntity<List<Integer>> countFilesForE(@RequestBody List<Integer> e_unityatchmnflno)throws SQLException {
	  
	  ResponseEntity<List<Integer>> entity = null;
	  
	  List<Integer> resultCnt =  pdsPublicService.iscntfiles(e_unityatchmnflno);
	  
	  entity = new ResponseEntity<List<Integer>>(resultCnt, HttpStatus.OK); 
	  return entity;
	  }
	  
	  @RequestMapping(value = "/countFilesForD", method = RequestMethod.POST)
	  @ResponseBody 
	  public ResponseEntity<List<Integer>> countFilesForD(@RequestBody List<Integer> d_unityatchmnflno)throws SQLException {
	  
	  ResponseEntity<List<Integer>> entity = null;
	  
	  List<Integer> resultCnt =  pdsDepService.iscntfiles(d_unityatchmnflno);
	  
	  entity = new ResponseEntity<List<Integer>>(resultCnt, HttpStatus.OK); 
	  return entity;
	  }
	 
	
	
	@RequestMapping("/pdsPrivateBin")
	public String pdsPrivateBin(@SessionAttribute("loginEmp") EmpVO loginEmp, 
								Criteria cri ,
								@RequestParam(defaultValue = "desc") String nowSort,
								Model model) throws Exception{
		String url ="pds/pdsPrivateBin";
		Map<String, Object> dataMap = pdsPrivateService.getPdsBinList(loginEmp, cri, nowSort);
		model.addAllAttributes(dataMap);
		return url;
	}
	
	@RequestMapping("/fav")
	public String pdsFavList(@SessionAttribute("loginEmp") EmpVO loginEmp,
							 Model model,
							 Criteria cri,
							 @RequestParam(defaultValue = "desc") String nowSort
							 ) throws Exception{
		String url ="pds/fav";
		Map<String, Object> dataMap = pdsFavService.MyFavListAll(loginEmp, cri, nowSort);
		model.addAllAttributes(dataMap);
		return url;
	}
	

	@RequestMapping("/pdsDepList")
	public String pdsDepList(@SessionAttribute("loginEmp") EmpVO loginEmp,
							String d_title, 
							String d_writer,
							int d_unityatchmnflno, 
							Model model, 
							Criteria cri ,
							@RequestParam(defaultValue = "desc") String nowSort)throws Exception {
		String url ="pds/pdsDepList";
		
		Map<String, Object> dataMap = pdsDepService.getAttachList(d_unityatchmnflno,loginEmp, cri, nowSort);
		
		model.addAllAttributes(dataMap);
		model.addAttribute("d_unityatchmnflno", d_unityatchmnflno);
		model.addAttribute("d_writer", URLDecoder.decode(d_writer, "utf-8"));
		model.addAttribute("d_title", URLDecoder.decode(d_title, "utf-8"));
		return url;
	}
	
	
	@RequestMapping(value="/pdsPublicList", produces="application/text;charst=utf8")
	public String pdsPublicList(@SessionAttribute("loginEmp") EmpVO loginEmp,
								Criteria cri, 
								@RequestParam(defaultValue = "desc") String nowSort,
								String e_title, 
								String e_writer,
								@RequestParam(value = "e_unityatchmnflno", required = false) int e_unityatchmnflno, 
								Model model)throws Exception {
		String url ="pds/pdsPublicList";
		
		Map<String, Object> dataMap = pdsPublicService.getAttachList(e_unityatchmnflno,loginEmp, cri, nowSort);
		
		Map<String, Object> dataMapForFolder = pdsPublicService.getPdsPublicService(cri, nowSort);
		
		model.addAttribute("dataMapForFolder",dataMapForFolder);
		model.addAllAttributes(dataMap);
		model.addAttribute("e_unityatchmnflno", e_unityatchmnflno);
		model.addAttribute("e_title", URLDecoder.decode(e_title, "utf-8"));
		model.addAttribute("e_writer", URLDecoder.decode(e_writer, "utf-8"));
		
		return url;
	}
	
	
	
	
	@RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(AttachVO atch) throws Exception {
		
//		System.out.println("atch.getAno()찍혀랏: "+atch.getAno());
		String picture = pdsPrivateService.getAttach(atch).getFileName();

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.fileUploadPath;

		try {
			in = new FileInputStream(new File(imgPath, picture));

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);

		} finally {
			in.close();
		}
		return entity;
	}
	
	
	
	@RequestMapping("/registForm")
	public String insertForm(Model model)throws SQLException {
		String url ="pds/regist";
		
		List<DeptVO> departList = departService.getDepartList();
		
		model.addAttribute("departList", departList);
		
		return url;
	}
	
	@Resource(name = "pdsUploadPath")
	private String fileUploadPath;
	
	@RequestMapping(value="/addFiles", produces = "text/plain;charset=utf-8")
	public String addFiles(@RequestParam int unityatchmnflno,@RequestParam String m_title,@RequestParam String m_writer,  RedirectAttributes rttr, PdsPrivateCommand registReq)throws Exception  
	{
		String url = "redirect:/pds/pdsPrivateList?m_unityatchmnflno=" + unityatchmnflno+"&m_title="+URLEncoder.encode(m_title,"utf-8")+"&m_writer="+URLEncoder.encode(m_writer,"utf-8");
		String savepath = this.fileUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(registReq.getUploadFile(), savepath);
		
		registReq.setM_unityatchmnflno(unityatchmnflno);
		PdsPrivateVO mpds = registReq.toPdsPrivateVO();
		
		
		for(MultipartFile file : registReq.getUploadFile()) {
			if(file.getSize() == 0) {
				mpds.setAttachList(null);
			}else {
				mpds.setAttachList(attachList);
			}
		}
		
		pdsPrivateService.insertAttach(mpds);
		
		//System.out.println("찍히는지화가앙아아ㅏ아악인");
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	@RequestMapping(value="/addFilesForE", produces = "text/plain;charset=utf-8")
	public String addFiles(@RequestParam int unityatchmnflno, 
							@RequestParam String e_title, 
							@RequestParam String e_writer,
							RedirectAttributes rttr, 
							PdsPublicCommand registReq)throws Exception  
	{
		String url = "redirect:/pds/pdsPublicList?e_unityatchmnflno=" + unityatchmnflno+"&e_title="+URLEncoder.encode(e_title,"utf-8")+"&e_writer="+URLEncoder.encode(e_writer,"utf-8");
		//String url = "redirect:/pds/pdsPublicList?e_unityatchmnflno=" + unityatchmnflno;
		String savepath = this.fileUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(registReq.getUploadFile(), savepath);
		
		registReq.setE_unityatchmnflno(unityatchmnflno);
		PdsPublicVO epds = registReq.toPdsPublicVO();
		
		
		for(MultipartFile file : registReq.getUploadFile()) {
			if(file.getSize() == 0) {
				epds.setAttachList(null);
			}else {
				epds.setAttachList(attachList);
			}
		}
		
		pdsPublicService.insertAttach(epds);
		
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	@RequestMapping(value="/addFilesForD", produces = "text/plain;charset=utf-8")
	public String addFilesForD(@RequestParam int unityatchmnflno, 
							@RequestParam String d_title, 
							@RequestParam String d_writer,
							RedirectAttributes rttr, 
							PdsDepCommand registReq)throws Exception  
	{
		String url = "redirect:/pds/pdsDepList?d_unityatchmnflno=" + unityatchmnflno+"&d_title="+URLEncoder.encode(d_title,"utf-8")+"&d_writer="+URLEncoder.encode(d_writer,"utf-8");;
		//String url = "redirect:/pds/pdsPublicList?e_unityatchmnflno=" + unityatchmnflno;
		String savepath = this.fileUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(registReq.getUploadFile(), savepath);
		
		registReq.setD_unityatchmnflno(unityatchmnflno);
		PdsDepVO epds = registReq.toPdsDepVO();
		
		
		for(MultipartFile file : registReq.getUploadFile()) {
			if(file.getSize() == 0) {
				epds.setAttachList(null);
			}else {
				epds.setAttachList(attachList);
			}
		}
		
		pdsDepService.insertAttach(epds);
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	
	
	@RequestMapping(value = "/modifyFolderName", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> modifyFolderName(@RequestBody PdsPrivateVO mpds) throws SQLException {
		ResponseEntity<String> entity = null;
		
		pdsPrivateService.modifyTitle(mpds);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value = "/modifyFolderNameForE", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> modifyFolderNameForE(@RequestBody PdsPublicVO epds) throws SQLException {
		ResponseEntity<String> entity = null;
		
		pdsPublicService.modifyTitle(epds);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value = "/modifyFolderNameForD", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> modifyFolderNameForD(@RequestBody PdsDepVO dpds) throws SQLException {
		ResponseEntity<String> entity = null;
		
		pdsDepService.modifyTitle(dpds);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value = "/moveToBin", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> moveToBin(@RequestBody List<Integer> m_unityatchmnflno) throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		for(int no : m_unityatchmnflno) {
			System.out.println(no);
		}
		
		pdsPrivateService.modifyDel(m_unityatchmnflno);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value = "/recoverFromBin", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> recoverFromBin(@RequestBody List<Integer> ano) throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		pdsPrivateService.recoverfiles(ano);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value = "/deleteFolder", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteFolder(@RequestBody List<Integer> m_unityatchmnflno) throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		pdsPrivateService.deleteFolder(m_unityatchmnflno);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value = "/deleteFolderForE", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteFolderForE(@RequestBody List<Integer> e_unityatchmnflno) throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		pdsPublicService.deleteFolderForE(e_unityatchmnflno);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value = "/deleteFolderForD", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteFolderForD(@RequestBody List<Integer> d_unityatchmnflno) throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		pdsDepService.deleteFolderForE(d_unityatchmnflno);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value = "/deleteFiles", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteFiles(@RequestBody List<Integer> ano) throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		pdsPrivateService.deletefiles(ano);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value = "/updateDelForFiles", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> updateDelForFiles(@RequestBody List<AttachVO> attachList) throws SQLException {
		ResponseEntity<String> entity = null;
		
		pdsPrivateService.modifyDelFromAtch(attachList);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value = "/updateDelForFilesE", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> updateDelForFilesE(@RequestBody List<AttachVO> attachList) throws SQLException {
		ResponseEntity<String> entity = null;
		
		pdsPublicService.modifyDelFromAtch(attachList);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value = "/insertAgainRefrn", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> insertAgainRefrn(@RequestBody List<RefrnVO> attachList) throws SQLException {
		ResponseEntity<String> entity = null;
		System.out.println(attachList);
		pdsPrivateService.refrnInsert(attachList);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value = "/deleteRefrn", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteRefrn(@RequestBody RefrnVO refrn)throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		pdsPrivateService.deleteRefrn(refrn);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/addToFav", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> addToFav(@RequestBody FavVO fav)throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		pdsFavService.insertFav(fav);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/deleteFav", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteFav(@RequestBody FavVO fav)throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		pdsFavService.deleteFav(fav);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping("/download")
	public String download(AttachVO attach, Model model)throws Exception {
		String url = "downloadFile";
		AttachVO attachPds = pdsPrivateService.getAttach(attach);
		
		model.addAttribute("savedPath", attachPds.getUploadPath());
		model.addAttribute("fileName", attachPds.getFileName());
		
		return url;
	}
	
	@RequestMapping("/restDownload")
	@ResponseStatus(HttpStatus.OK)
	public void restDownload(@RequestBody List<AttachVO> attach, HttpServletRequest req, HttpServletResponse resp)throws Exception {
		AttachVO attachPds = pdsPrivateService.getAttach(attach.get(0));
		
		RESTFileDownloadResolver.fileDownload(attachPds.getUploadPath(), attachPds.getFileName(), req, resp);
		
	}
	
	@RequestMapping("/zipDownload")
	@ResponseStatus(HttpStatus.OK)
	public void zipDownload(@RequestBody List<AttachVO> attach, HttpServletRequest req, HttpServletResponse resp)throws Exception {
		
		List<String> attachList = pdsPrivateService.downloadAttachList(attach);
		
		MakeFileToZip.makeZip(attachList, "PdsFile.zip", req, resp);
                      
	}
	
}
