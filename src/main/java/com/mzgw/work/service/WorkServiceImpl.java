package com.mzgw.work.service;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.WorkMemVO;
import com.mzgw.dto.WorkVO;
import com.mzgw.emp.dao.EmpDAO;
import com.mzgw.util.Criteria;
import com.mzgw.util.PageMaker;
import com.mzgw.work.dao.WorkDAO;

public class WorkServiceImpl implements WorkService{
	
	private WorkDAO workDAO;
	private AttachDAO attachDAO;
	private EmpDAO empDAO;
	
	public void setWorkDAO(WorkDAO workDAO) {
		this.workDAO = workDAO;
	}
	
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}

	
	/* 업무 작성 */
	@Override
	public void regist(WorkVO vo) throws SQLException {

		int wno = workDAO.getSelectWorkJno();
		vo.setJobCode(wno);
		
		int i = 0;
		if(vo.getAttachList() != null) {
			int unityNo = workDAO.getSeqNextValue();
			vo.setUnitNo(unityNo);
			
			for(AttachVO attach : vo.getAttachList()) {
				attach.setUnityatchmnflno(unityNo);
				attach.setAno(++i);
				
				attachDAO.insertAttach(attach);
				
			}
		}else {
			vo.setUnitNo(-1);
		}
		
		workDAO.insertWork(vo);
		

		for(WorkMemVO mvo : vo.getWorkMemList()) {
			mvo.setJobCode(wno);
			workDAO.workMember(mvo);
		}
	
		
	}

	
	/* 공통업무 리스트*/
	@Override
	public Map<String, Object> getCommonWorkList(Criteria cri) throws SQLException {
		
		Criteria searchCri = (Criteria)cri;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(workDAO.selectWorkListCount(searchCri));
		
		List<WorkVO> commonList = workDAO.commonList(searchCri);
		
		dataMap.put("commonList", commonList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	
	/* 할당자 리스트*/
	@Override
	public Map<String, Object> getAssignList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<WorkMemVO> assignList = workDAO.assignMemList();
		
		dataMap.put("assignList", assignList);
		
		return dataMap;
	}

	/* 업무 상세 */
	@Override
	public WorkVO getWorkDetail(int wno) throws SQLException {
		
		WorkVO work = workDAO.selectWorkByWno(wno);
		
		return work;
		
	}

	/* 업무 파일 리스트 */
	@Override
	public Map<String, Object> getFileUploadList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<AttachVO> upFileList = workDAO.fileUploadList();
		
		dataMap.put("upFileList", upFileList);
		
		return dataMap;
	}

	/* 업무 수정 */
	@Override
	public void modify(WorkVO wvo) throws SQLException {
		
		
		int i = 0;
		if(wvo.getAttachList() != null) {
			int unityNo = workDAO.getSeqNextValue();
			wvo.setUnitNo(unityNo);
			
			for(AttachVO attach : wvo.getAttachList()) {
				attach.setUnityatchmnflno(unityNo);
				attach.setAno(++i);
				
				attachDAO.insertAttach(attach);
				
			}
		}else {
			wvo.setUnitNo(-1);
		}

		workDAO.updateWork(wvo);
		
		
		for(WorkMemVO mvo : wvo.getWorkMemList()) {
			mvo.setJobCode(wvo.getJobCode());
			workDAO.workMember(mvo);
		}
		
	}
	
	
	/* 파일번호가져오기 */
	@Override
	public AttachVO getAttachByUni(int uni) throws SQLException {

		AttachVO attach = attachDAO.selectAttachByUni(uni);
		return attach;
	}
	
	
	/* 삭제할 파일 번호 */
	@Override
	public void removeAttachByUni(int uni) throws SQLException {
		attachDAO.deleteAttach(uni);
	}

	
	/* 할당자 삭제 ajax */
	@Override
	public void assMemDelete(WorkMemVO mvo) throws SQLException {
		workDAO.assMemDelete(mvo);
	}

	
	/* 개인 업무 리스트 */
	@Override
	public Map<String, Object> getIndivWorkList(EmpVO loginEmp, Criteria cri, String nowSort) throws Exception {
		Map<String, Object> dataMap = workDAO.indivList(loginEmp, nowSort, cri);
		
		@SuppressWarnings("unchecked")
		List<WorkVO> indivWorkList = (List<WorkVO>) dataMap.get("workList");
		
		dataMap.put("indivWorkList", indivWorkList);
		
		return dataMap;
	}

	@Override
	public void deleteWork(int wno) throws SQLException {
		
		workDAO.deleteWork(wno);
		
		workDAO.deleteJobEmp(wno);
		
	}

	@Override
	public AttachVO getAttach(AttachVO attach) throws SQLException {
		
		AttachVO attachWork = attachDAO.selectAttachWork(attach);
		return attachWork;
		
	}

	@Override
	public Map<String, Object> getWorkBySttus(int jobSttus,EmpVO loginEmp) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("workList", workDAO.selectJobBySttus(jobSttus,loginEmp));
		
		return dataMap;
	}

	

	
	
	

}
