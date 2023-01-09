package com.mzgw.pds.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.PdsPublicVO;
import com.mzgw.dto.RefrnVO;
import com.mzgw.util.Criteria;


public interface PdsPublicService {
	
	public void insert(PdsPublicVO pds) throws SQLException;
	
	public Map<String, Object> getPdsPublicService(Criteria cri, String nowSort) throws Exception;
	
	Map<String, Object> getAttachList(int e_unityatchmnflno, EmpVO ncnm, Criteria cri, String nowSort) throws Exception;
	
	public void deleteFolderForE (List<Integer>deleteArray) throws SQLException;
	
	public List<Integer> iscntfiles(List<Integer> cntArray) throws SQLException;
	
	public void modifyTitle(PdsPublicVO pds) throws SQLException;
	
	public void insertAttach(PdsPublicVO pds) throws SQLException;
	
	public void modifyDelFromAtch(List<AttachVO> attachList) throws SQLException;
	
	//public Map<String, Object> getOnlyAttachList(PdsPublicVO e_unityatchmnflno) throws SQLException;
}
