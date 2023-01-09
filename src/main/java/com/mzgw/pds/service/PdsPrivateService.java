package com.mzgw.pds.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.PdsPrivateVO;
import com.mzgw.dto.RefrnVO;
import com.mzgw.util.Criteria;

public interface PdsPrivateService {
	
	public void insert(PdsPrivateVO pds, List<RefrnVO>refList) throws SQLException;
	
	public void refrnInsert(List<RefrnVO>refList)throws SQLException;
	
	public void insertAttach (PdsPrivateVO pds) throws SQLException;
	
	public Map<String, Object> getPdsPrivateService(EmpVO ncnm, Criteria cri, String nowSort) throws Exception;
	
	public Map<String, Object> getPdsBinList(EmpVO ncnm, Criteria cri, String nowSort) throws Exception;
	
	public void modifyTitle(PdsPrivateVO pds) throws SQLException;
	
	public void modifyDelFromAtch(List<AttachVO>attachList) throws SQLException;
	
	public void modifyDel(List<Integer>deleteArray) throws SQLException;
	
	public void modifyRecover(List<Integer>deleteArray) throws SQLException;
	
	public Map<String, Object> getRefrnList(EmpVO ncnm) throws SQLException;
	
	public AttachVO getAttach(AttachVO attach) throws SQLException;
	
	public List<String> downloadAttachList(List<AttachVO> attach) throws SQLException;
	
	public void deleteFolder (List<Integer>deleteArray) throws SQLException;
	
	public void deletefiles (List<Integer>deleteArrayString) throws SQLException;
	
	public void recoverfiles (List<Integer>recoverArray) throws SQLException;
	
	public List<Integer> iscntfiles (List<Integer>cntArray) throws SQLException;

	public Map<String, Object> getAttachList(int m_unityatchmnflno, EmpVO ncnm, Criteria cri, String nowSort) throws Exception;
	
	public Map<String, Object> getOnlyAttachList(PdsPrivateVO m_unityatchmnflno) throws SQLException;
	
	public void deleteRefrn(RefrnVO vo) throws SQLException;
}
