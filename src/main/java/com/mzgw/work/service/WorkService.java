package com.mzgw.work.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.WorkMemVO;
import com.mzgw.dto.WorkVO;
import com.mzgw.util.Criteria;

public interface WorkService {

	/* 업무 작성 */
	public void regist(WorkVO vo)throws SQLException;
	
	/* 공통업무 리스트 */
	public Map<String, Object> getCommonWorkList(Criteria cri)throws SQLException;
	
	/* 개인업무 리스트 */
	public Map<String, Object> getIndivWorkList(EmpVO loginEmp, Criteria cri, String nowSort) throws Exception;
	
	/* 할당자 리스트 */
	public Map<String, Object> getAssignList()throws SQLException;
	
	/* 업무 상세 */
	public WorkVO getWorkDetail(int wno)throws SQLException;
	
	/* 업무 파일 목록 */
	public Map<String, Object> getFileUploadList()throws SQLException;
	
	/* 업무 수정 */
	public void modify(WorkVO wvo) throws SQLException;
	
	/* 파일 번호 가져오기 */
	public AttachVO getAttachByUni(int uni) throws SQLException;
	
	/* 삭제할 파일 번호 */
	public void removeAttachByUni(int uni) throws SQLException;
	
	/* 할당자 ajax 삭제 */
	public void assMemDelete(WorkMemVO mvo)throws SQLException;
	
	/* 일감 삭제 */
	public void deleteWork(int wno) throws SQLException;

	/* 파일 다운로드 */
	public AttachVO getAttach(AttachVO attach) throws SQLException;
	
	public Map<String, Object> getWorkBySttus(int jobSttus, EmpVO loginEmp) throws Exception;
}
