package com.mzgw.mail.service;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestBody;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.MailDeleteVO;
import com.mzgw.dto.MailVO;
import com.mzgw.dto.ReceVO;
import com.mzgw.dto.RefeVO;
import com.mzgw.dto.WorkVO;
import com.mzgw.emp.dao.EmpDAO;
import com.mzgw.mail.dao.MailDAO;
import com.mzgw.util.Criteria;
import com.mzgw.util.PageMaker;

import javafx.print.Collation;

public class MailServiceImpl implements MailService{
	
	
	private MailDAO mailDAO;
	public void setMailDAO(MailDAO mailDAO) {
		this.mailDAO = mailDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	/* 보낸메일 리스트 조회 */
	@Override
	public Map<String, Object> getSendMailList(EmpVO loginEmp, Criteria cri, String nowSort) throws Exception {
		Map<String, Object> dataMap = mailDAO.sendMailList(loginEmp, nowSort, cri);
		
		@SuppressWarnings("unchecked")
		List<MailVO> sendMailList = (List<MailVO>) dataMap.get("sendMailList");
		
		dataMap.put("sendMailList", sendMailList);
		
		return dataMap;
		
	}

	/* 받은메일 리스트 조회 */
	@Override
	public Map<String, Object> getReceMailList(EmpVO loginEmp, Criteria cri, String nowSort) throws Exception {

		Map<String, Object> dataMap = mailDAO.receMailList(loginEmp, nowSort, cri);
		
		@SuppressWarnings("unchecked")
		List<MailVO> receMailList = (List<MailVO>) dataMap.get("receMailList");
		
		
		dataMap.put("receMailList", receMailList);
		
		return dataMap;
		
	}
	
	/* 임시저장 리스트 조회 */
	@Override
	public Map<String, Object> getStorageMailList(EmpVO loginEmp, Criteria cri, String nowSort) throws Exception {
		
		Map<String, Object> dataMap = mailDAO.storegeMailList(loginEmp, nowSort, cri);
		
		@SuppressWarnings("unchecked")
		List<MailVO> storageMailList = (List<MailVO>) dataMap.get("storageMailList");
		
		
		dataMap.put("storageMailList", storageMailList);
		
		return dataMap;
		
	}

	@Override
	public Map<String, Object> getEmpMailList() throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<EmpVO> empMailList = mailDAO.empMailList();
		
		
		dataMap.put("empMailList", empMailList);
		
		return dataMap;
	}

	@Override
	public void regist(MailVO vo, List<ReceVO> empList, List<RefeVO> refList, String tempor) throws SQLException {

		
		int eno = mailDAO.getEmailNoSeqNextValue();
		vo.setEmailNo(eno);
		
		int i = 0;
		
		if(vo.getAttachList() != null) {
			int unityNo = mailDAO.getSeqNextValue();
			vo.setUnityNo(unityNo);

			System.out.println("시퀀스 불러오나 확인 " + unityNo);
			for(AttachVO attach : vo.getAttachList()) {
				
				attach.setUnityatchmnflno(unityNo);
				attach.setAno(++i);
				
				
				attachDAO.insertAttach(attach);
				
				System.out.println(attach + "파일이 들어갔나 확인하자!!!!!!!!!!!!!!!!!!!!!");
			}
		}else {
			vo.setUnityNo(-1);
		}
		
		
		if(tempor.equals("0")) {
			vo.setTempor(0);
			mailDAO.insertMail(vo);
		}else if(tempor.equals("1")){
			vo.setTempor(1);
			mailDAO.insertMail(vo);
		}
		
		
		for(ReceVO rvo : empList) {
			rvo.setEmailNo(eno);
			mailDAO.insertReceEmp(rvo);
		}
		
		for(RefeVO rfvo : refList) {
			rfvo.setEmailNo(eno);
			mailDAO.insertRefeEmp(rfvo);
		}
		
		
	}

	/* 메일 상세 페이지 */
	@Override
	public MailVO getMailDetail(int eno) throws SQLException {

		MailVO mail = mailDAO.selectMailByEno(eno);
		
		return mail;
		
	}

	
	/* 받은사람 이름 리스트 가져오기 */
	@Override
	public Map<String, Object> getReceEmpList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ReceVO> receEmpList = mailDAO.receEmpList();
		
		dataMap.put("receEmpList", receEmpList);
		
		return dataMap;
	
	}

	@Override
	public Map<String, Object> getRefeEmpList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<RefeVO> refeEmpList = mailDAO.refeEmpList();
		
		dataMap.put("refeEmpList", refeEmpList);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getfileUploadList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<AttachVO> upFileList = mailDAO.fileUploadList();
		
		dataMap.put("upFileList", upFileList);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getRemoveMailList(EmpVO loginEmp) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<MailVO> removeReceMailList = mailDAO.removeReceMailList(loginEmp);
		List<MailVO> removeSendMailList = mailDAO.removeSendMailList(loginEmp);
		
		List<MailVO> list = new ArrayList<MailVO>();
		
		for(MailVO vo : removeReceMailList) {
			vo.setGap(1);
			vo.setTableCode("R");
			list.add(vo);
		}
		
		for(MailVO vo : removeSendMailList) {
			vo.setGap(0);
			vo.setTableCode("S");
			list.add(vo);
		}
		
		Collections.sort(list);
		
		dataMap.put("list", list);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
		
		return dataMap;
		
	}

	@Override
	public void ReceUpdateRemoveCode(List<Integer> removeCodeArray) throws SQLException {
		 for(int no : removeCodeArray) {
			 mailDAO.ReceUpdateRemoveCode(no);
		 }
	}

	@Override
	public void SendUpdateRemoveCode(List<Integer> removeCodeArray) throws SQLException {
		 for(int no : removeCodeArray) {
			 mailDAO.SendUpdateRemoveCode(no);
		 }
	}

	@Override
	public void StateUpdate(List<Integer> removeCodeArray) throws SQLException {
		 for(int no : removeCodeArray) {
			 mailDAO.StateUpdate(no);;
		 }
	}

	@SuppressWarnings("null")
	@Override
	public void deleteMail(List<MailDeleteVO> allArray) throws SQLException {
		
		MailVO sendVo = null;
		ReceVO receVo = null;;
		
		for(int i = 0; i < allArray.size(); i++) {
			if(allArray.get(i).getTableCode().equals("S")) {
				
				sendVo = new MailVO();
				
				 sendVo.setEmailNo(allArray.get(i).getEmailNo());
				 sendVo.setSendEmp(allArray.get(i).getSendEmp());
				 

				mailDAO.sendDeleteMail(sendVo);
				
			}else if(allArray.get(i).getTableCode().equals("R")) {
				
				receVo = new ReceVO();
				
				 receVo.setEmailNo(allArray.get(i).getEmailNo());
				 receVo.setReceEmp(allArray.get(i).getReceEmp());
				 
				
				mailDAO.receDeleteMail(receVo);
			}
			
		}
	}

	@Override
	public void storageSendMail(int eno) throws SQLException {
		 mailDAO.storageUpdate(eno);
	}

	@Override
	public void returnMail(MailDeleteVO allArray) throws SQLException {
		
		int[] RemoveTable =  allArray.getRemoveTable();
		int[] RemoveCkArr =  allArray.getRemoveCkArr();
		
		for(int i = 0; i < RemoveTable.length; i++) {
			if(RemoveTable[i] == 0) {
				mailDAO.sendReturnMail(RemoveCkArr[i]);
			}else {
				mailDAO.receReturnMail(RemoveCkArr[i]);
			}
		}
		
	}

	@Override
	public AttachVO getAttach(AttachVO attach) throws SQLException {
		
		AttachVO attachWork = attachDAO.selectAttachMail(attach);
		return attachWork;
		
	}

	@Override
	public List<String> downloadAttachList(List<AttachVO> attach) throws SQLException {
		List<AttachVO> attachList = new ArrayList<>();
		List<String> filePathList = new ArrayList<>(); 
		
		for(AttachVO atch : attach) {
			attachList.add(attachDAO.selectAttachWork(atch));
		}
		
		for(int i = 0; i < attachList.size(); i++) {
			String temp = attachList.get(i).getUploadPath() + File.separator + attachList.get(i).getFileName(); 
			filePathList.add(temp);
		}
			
		return filePathList;
	}

	@Override
	public Map<String, Object> getdashboardAll(EmpVO loginEmp) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("mailList",mailDAO.dashboardAll(loginEmp));
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getdashboardTrash(EmpVO loginEmp) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("mailList",mailDAO.dashboardTrash(loginEmp));
		return dataMap;
	}

	@Override
	public Map<String, Object> getMailListCount(EmpVO loginEmp) throws Exception {
		// TODO Auto-generated method stub
		return mailDAO.selectMailListCount(loginEmp);
	}

	/* 최근 30일 안에 보낸 주소록 */
	@Override
	public Map<String, Object> getRecentlyList(EmpVO loginEmp) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ReceVO> recentlyList = mailDAO.recentlyList(loginEmp);
		
		dataMap.put("recentlyList", recentlyList);
		
		return dataMap;
	}
	
	



	
	

}
