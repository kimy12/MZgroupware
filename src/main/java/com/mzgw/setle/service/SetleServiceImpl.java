package com.mzgw.setle.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.depart.dao.DepartDAO;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.DeptVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.SetleEmpVO;
import com.mzgw.dto.SetleFormVO;
import com.mzgw.dto.SetleVO;
import com.mzgw.emp.dao.EmpDAO;
import com.mzgw.setle.dao.SetleDAO;
import com.mzgw.setle.dao.SetleEmpDAO;
import com.mzgw.setle.dao.SetleFormDAO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeFileName;

public class SetleServiceImpl implements SetleService {

	private SetleDAO setleDAO;
	
	private DepartDAO departDAO;
	
	private SetleEmpDAO setleEmpDAO;
	
	private EmpDAO empDAO;
	
	private SetleFormDAO setleFormDAO;
	
	
	
	

	public void setSetleFormDAO(SetleFormDAO setleFormDAO) {
		this.setleFormDAO = setleFormDAO;
	}

	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}

	public void setSetleEmpDAO(SetleEmpDAO setleEmpDAO) {
		this.setleEmpDAO = setleEmpDAO;
	}

	public void setDepartDAO(DepartDAO departDAO) {
		this.departDAO = departDAO;
	}

	public void setSetleDAO(SetleDAO setleDAO) {
		this.setleDAO = setleDAO;
	}
	
	private AttachDAO attachDAO;

	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	
	
	
	
	
	

	@Override
	public void regist(SetleVO setle) throws Exception {

		int setleNo = setleDAO.selectSetleSeq();
		setle.setSetleNo(setleNo);
		int unityAttachNo = -1;
		if(setle.getSetleAttachList() != null && !setle.getSetleAttachList().isEmpty()) {
			unityAttachNo = attachDAO.selectUnitySeq();
			
			int attachIndex = 0;
			for(AttachVO attach : setle.getSetleAttachList()) {
				attach.setUnityatchmnflno(unityAttachNo);
				attach.setAno(attachIndex++);
				attachDAO.insertAttach(attach);
			}
		}
		
		
		String departLeader = departDAO.selectDepartLeaderByDepartName(setle.getWriterDepart());
		
		setle.setLastSetleEmp(departLeader);
		
		
		setle.setSetleAttach(unityAttachNo);
		setleDAO.insertSetle(setle);
		
		for(SetleEmpVO vo : setle.getSetleEmpList()) {
			vo.setSetleNo(setleNo);
			setleEmpDAO.insertSetleEmp(vo);
		}
		
	}
	
	@Override
	public void modify(SetleVO setle, int lastAno,int[] removeAttaches) throws Exception {

		int setleNo = setle.getSetleNo();
		SetleVO	savedSetle = setleDAO.selectSetleBySetleNo(setleNo);
		int unityAttachNo = savedSetle.getSetleAttach();
		if(unityAttachNo == -1) {
			if(setle.getSetleAttachList() != null && !setle.getSetleAttachList().isEmpty()) {
				unityAttachNo = attachDAO.selectUnitySeq();
				
				int attachIndex = 0;
				for(AttachVO attach : setle.getSetleAttachList()) {
					attach.setUnityatchmnflno(unityAttachNo);
					attach.setAno(attachIndex++);
					attachDAO.insertAttach(attach);
				}
			}
		}else {
			if(setle.getSetleAttachList() != null && !setle.getSetleAttachList().isEmpty()) {
				int attachIndex = lastAno+1;
				if(removeAttaches != null) {
					for(int removeAno : removeAttaches) {
						attachDAO.deleteAttachByAnoAndUni(removeAno, unityAttachNo);
					}
				}
				
				for(AttachVO attach : setle.getSetleAttachList()) {
					attach.setUnityatchmnflno(unityAttachNo);
					attach.setAno(attachIndex++);
					attachDAO.insertAttach(attach);
				}
			}
		}
		
		
		String departLeader = departDAO.selectDepartLeaderByDepartName(setle.getWriterDepart());
		
		setle.setLastSetleEmp(departLeader);
		
		
		setle.setSetleAttach(unityAttachNo);
		setleDAO.updateSetle(setle);
		
		setleEmpDAO.deleteAllSetlEmpBySetleNo(setleNo);
		for(SetleEmpVO vo : setle.getSetleEmpList()) {
			vo.setSetleNo(setleNo);
			setleEmpDAO.insertSetleEmp(vo);
		}
	}
	

	@Override
	public List<SetleVO> getSetleList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getSetleListByWriterNo(Criteria cri, String nowSort, EmpVO emp, int sttusNo) throws Exception {
		// TODO Auto-generated method stub
		if(nowSort.equals("desc")) {
			nowSort="desc";
		}else {
			nowSort="asc";
		}
		Map<String, Object> dataMap = setleDAO.selectSetleListByWriterNo(cri, nowSort,emp,sttusNo);
		List<SetleVO> list = (List<SetleVO>) dataMap.get("setleList");
		List<SetleVO> editList = new ArrayList<SetleVO>();
		
		for(SetleVO vo : list) {
			
			List<SetleEmpVO> emps = setleEmpDAO.selectSetleEmpListBySetleNo(vo.getSetleNo());
			
			EmpVO lastSetleEmpVO = empDAO.selectEmpByEmplNo(vo.getLastSetleEmp());
			
			
			vo.setSetleEmpList(emps);
			vo.setLastSetleEmpVO(lastSetleEmpVO);
			vo.setSetleForm(setleFormDAO.selectSetleFormBySetleFormNo(vo.getSetleFormNo()));
			EmpVO writerEmpVO = empDAO.selectEmpByEmplNo(vo.getSetleWriter());
			vo.setWriterEmpVO(writerEmpVO);
			editList.add(vo);
			
		}
		List<SetleFormVO> formList = setleFormDAO.selectSetleFormList();
		dataMap.put("formList", formList);
		dataMap.put("setleList", editList);
		dataMap.put("nowSort" ,nowSort);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getDeleteSetleListByWriterNo(Criteria cri, String nowSort, EmpVO emp) throws Exception {
		// TODO Auto-generated method stub
		if(nowSort.equals("desc")) {
			nowSort="desc";
		}else {
			nowSort="asc";
		}
		Map<String, Object> dataMap = setleDAO.selectDeleteSetleListByWriterNo(cri, nowSort,emp);
		List<SetleVO> list = (List<SetleVO>) dataMap.get("setleList");
		List<SetleVO> editList = new ArrayList<SetleVO>();
		
		for(SetleVO vo : list) {
			
			List<SetleEmpVO> emps = setleEmpDAO.selectSetleEmpListBySetleNo(vo.getSetleNo());
			
			EmpVO lastSetleEmpVO = empDAO.selectEmpByEmplNo(vo.getLastSetleEmp());
			
			
			vo.setSetleEmpList(emps);
			vo.setLastSetleEmpVO(lastSetleEmpVO);
			vo.setSetleForm(setleFormDAO.selectSetleFormBySetleFormNo(vo.getSetleFormNo()));
			EmpVO writerEmpVO = empDAO.selectEmpByEmplNo(vo.getSetleWriter());
			vo.setWriterEmpVO(writerEmpVO);
			editList.add(vo);
			
		}
		List<SetleFormVO> formList = setleFormDAO.selectSetleFormList();
		dataMap.put("formList", formList);
		dataMap.put("setleList", editList);
		dataMap.put("nowSort" ,nowSort);
		
		return dataMap;
	}

	@Override
	public SetleVO getSetleBySetleNo(int setleNo) throws Exception{
		
		SetleVO setle = setleDAO.selectSetleBySetleNo(setleNo);
		
		List<SetleEmpVO> emps = setleEmpDAO.selectSetleEmpListBySetleNo(setleNo);
		
		EmpVO writerEmpVO = empDAO.selectEmpByEmplNo(setle.getSetleWriter());
		
		EmpVO lastSetleEmpVO = empDAO.selectEmpByEmplNo(setle.getLastSetleEmp());
		
		
		SetleFormVO setleForm = setleFormDAO.selectSetleFormBySetleFormNo(setle.getSetleFormNo());
		
		if(setle.getSetleAttach() != -1) {
		
			 List<AttachVO> attachList = attachDAO.selectAttachByUniToSeltle(setle.getSetleAttach());
			 setle.setSetleAttachList(attachList);
			 
		}
		setleForm.setAttachForm(attachDAO.selectAttachByUni(setleForm.getFormFile()));
		
		setle.setWriterEmpVO(writerEmpVO);
		setle.setSetleEmpList(emps);
		setle.setLastSetleEmpVO(lastSetleEmpVO);
		setle.setSetleForm(setleForm);
		
		return setle;
		
	}

	@Override
	public Map<String, Object> getSetleListByDepart(Criteria cri, String nowSort, EmpVO emp) throws Exception {
		if(nowSort.equals("desc")) {
			nowSort="desc";
		}else {
			nowSort="asc";
		}
		Map<String, Object> dataMap = setleDAO.selectSetleListByDepartNm(cri, nowSort,emp);
		List<SetleVO> list = (List<SetleVO>) dataMap.get("setleList");
		List<SetleVO> editList = new ArrayList<SetleVO>();
		
		
		for(SetleVO vo : list) {
			
			List<SetleEmpVO> emps = setleEmpDAO.selectSetleEmpListBySetleNo(vo.getSetleNo());
			
			EmpVO lastSetleEmpVO = empDAO.selectEmpByEmplNo(vo.getLastSetleEmp());
			
			
			vo.setSetleEmpList(emps);
			vo.setLastSetleEmpVO(lastSetleEmpVO);
			
			vo.setSetleForm(setleFormDAO.selectSetleFormBySetleFormNo(vo.getSetleFormNo()));
			EmpVO writerEmpVO = empDAO.selectEmpByEmplNo(vo.getSetleWriter());
			vo.setWriterEmpVO(writerEmpVO);
			editList.add(vo);
			
		}
		
		List<SetleFormVO> formList = setleFormDAO.selectSetleFormList();
		dataMap.put("formList", formList);
		dataMap.put("setleList", editList);
		dataMap.put("nowSort" ,nowSort);
		
		return dataMap;
	}

	@Override
	public void changeSttus(SetleVO setle) throws Exception {
		// TODO Auto-generated method stub
		setleDAO.updateSetleSttusNo(setle);
	}

	@Override
	public Map<String, Object> getSetleLisBySetleEmpSetleNo(Criteria cri, String nowSort, EmpVO user) throws Exception {
		Map<String, Object> dataMap = setleDAO.selectSetleListBySetleEmpSetleNo(cri, nowSort,user);
		List<SetleVO> list = (List<SetleVO>) dataMap.get("setleList");
		List<SetleVO> editList = new ArrayList<SetleVO>();
		List<SetleVO> recentList = setleDAO.selectRecentSetleListBySetleEmpSetleNo(user);
		List<SetleVO> recenteditList = new ArrayList<SetleVO>();
		
		for(SetleVO vo : list) {
			
			List<SetleEmpVO> emps = setleEmpDAO.selectSetleEmpListBySetleNo(vo.getSetleNo());
			
			EmpVO lastSetleEmpVO = empDAO.selectEmpByEmplNo(vo.getLastSetleEmp());
			
			vo.setSetleForm(setleFormDAO.selectSetleFormBySetleFormNo(vo.getSetleFormNo()));
			vo.setSetleEmpList(emps);
			vo.setLastSetleEmpVO(lastSetleEmpVO);
			EmpVO writerEmpVO = empDAO.selectEmpByEmplNo(vo.getSetleWriter());
			vo.setWriterEmpVO(writerEmpVO);
			editList.add(vo);
			
		}
		
		for(SetleVO vo : recentList) {
			
			List<SetleEmpVO> emps = setleEmpDAO.selectSetleEmpListBySetleNo(vo.getSetleNo());
			
			EmpVO lastSetleEmpVO = empDAO.selectEmpByEmplNo(vo.getLastSetleEmp());
			
			vo.setSetleForm(setleFormDAO.selectSetleFormBySetleFormNo(vo.getSetleFormNo()));
			
			vo.setSetleEmpList(emps);
			vo.setLastSetleEmpVO(lastSetleEmpVO);
			EmpVO writerEmpVO = empDAO.selectEmpByEmplNo(vo.getSetleWriter());
			vo.setWriterEmpVO(writerEmpVO);
			recenteditList.add(vo);
			
		}
		
		
		List<SetleFormVO> formList = setleFormDAO.selectSetleFormList();
		dataMap.put("recentSetleList", recenteditList);
		dataMap.put("formList", formList);
		dataMap.put("setleList", editList);
		dataMap.put("nowSort" ,nowSort);
		
		return dataMap;
	}

	@Override
	public void changeSttusAgree(SetleEmpVO setleEmp) throws Exception {
		
		SetleVO setleVO = new SetleVO();
		setleVO.setSetleNo(setleEmp.getSetleNo());
		
		setleEmpDAO.updateSttusAgree(setleEmp);
		
		List<SetleEmpVO> emps = setleEmpDAO.selectSetleEmpListBySetleNo(setleEmp.getSetleNo());
		
		boolean checkagree = true;
		boolean checkdisagree = false;
		
		for(SetleEmpVO emp : emps) {
			checkagree = checkagree && (emp.getAgrSttus()==3);
		}
		
		for(SetleEmpVO emp : emps) {
			checkdisagree = checkdisagree || (emp.getAgrSttus()==2);
		}

		if(checkagree) {
			setleVO.setSttusNo(3);
			setleDAO.updateSetleSttusNo(setleVO);
		}
	
		
	}

	@Override
	public void changeSttusDisgree(SetleEmpVO setleEmp) throws Exception {
		// TODO Auto-generated method stub
		SetleVO setleVO = new SetleVO();
		setleVO.setSetleNo(setleEmp.getSetleNo());
		
		
		setleEmpDAO.updateSttusDisagree(setleEmp);
		
		List<SetleEmpVO> emps = setleEmpDAO.selectSetleEmpListBySetleNo(setleEmp.getSetleNo());
		
		boolean checkagree = true;
		boolean checkdisagree = false;
		
		for(SetleEmpVO emp : emps) {
			checkagree = checkagree && (emp.getAgrSttus()==3);
		}
		
		for(SetleEmpVO emp : emps) {
			checkdisagree = checkdisagree || (emp.getAgrSttus()==2);
		}
	
		
		if(checkdisagree) {
			setleVO.setSttusNo(2);
			setleDAO.updateSetleSttusNo(setleVO);
		}
	}

	@Override
	public void changeSetleDel(SetleVO setle) throws Exception {
		// TODO Auto-generated method stub
		setleDAO.updateSetleDel(setle);
	}

	@Override
	public void changeSttusProcess(SetleVO setle) throws Exception {
		// TODO Auto-generated method stub
		setle.setSttusNo(1);
		setleDAO.updateSetleSttusNo(setle);
	}

	@Override
	public void removeSetle(int setleNo) throws Exception {
		// TODO Auto-generated method stub
		setleDAO.deleteSetle(setleNo);
	}

	@Override
	public void addForm(SetleFormVO form) throws Exception {
		// TODO Auto-generated method stub
		String savePath ="c:/setle/form";
		String txt = form.getFormFileString();
		String originName = form.getFormNm()+".txt";
		String fileName = MakeFileName.toUUIDFileName(originName, "$$");
		File target = new File(savePath);

		if(!target.exists()) {
			target.mkdirs();
		}
		
		target = new File(savePath+"/"+fileName);
		target.createNewFile();
		
		// BufferedWriter 와 FileWriter를 조합하여 사용 (속도 향상) 
		BufferedWriter fw = new BufferedWriter(new FileWriter(target,true)); // 파일안에 문자열 쓰기 
		fw.write(txt); 
		fw.flush(); // 객체 닫기 
		fw.close();


		AttachVO attach = new AttachVO();
		attach.setUploadpath(savePath);;
		attach.setFileName(fileName);;
		attach.setFileType(fileName.substring(fileName.lastIndexOf('.') + 1)
				.toUpperCase());
		attach.setOriginalname(originName);
		attach.setFilesize(txt.length());
		int unityatchmnflno = attachDAO.selectUnitySeq()	;
		attach.setUnityatchmnflno(unityatchmnflno);
		attach.setAno(0);
		attachDAO.insertAttach(attach);
		
		form.setFormFile(unityatchmnflno);
		
		int setleFormNo = setleFormDAO.selectSetleFormSeq();
		
		form.setSetleFormNo(setleFormNo);
		
		setleFormDAO.insertSetleForm(form);
		
	}

	@Override
	public List<SetleEmpVO> getSetleEmp(int setleNo) throws Exception {
		// TODO Auto-generated method stub
		return setleEmpDAO.selectSetleEmpListBySetleNo(setleNo);
	}

	@Override
	public Map<String, Object> getsetlePerCalc(EmpVO emp) throws Exception {
		// TODO Auto-generated method stub
		return setleDAO.selectsetlePerCalc(emp);
	}

	
	
}
