package com.mzgw.pds.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.EmpVO;
import com.mzgw.dto.PdsDepVO;
import com.mzgw.dto.RefrnVO;
import com.mzgw.util.Criteria;

public interface PdsDepService {
	
	public void insertPdsDep(PdsDepVO pds) throws SQLException;
	
	public Map<String, Object> getPdsDepService(EmpVO dept, Criteria cri, String nowSort) throws Exception;
	
	public Map<String, Object> getAttachList(int d_unityatchmnflno, EmpVO ncnm, Criteria cri, String nowSort) throws Exception;
	
	public void modifyTitle(PdsDepVO pds) throws SQLException;
	
	public List<Integer> iscntfiles(List<Integer> cntArray) throws SQLException;
	
	public void deleteFolderForE(List<Integer> deleteArray) throws SQLException;
	
	public void insertAttach(PdsDepVO pds) throws SQLException;
}
