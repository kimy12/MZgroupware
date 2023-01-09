package com.mzgw.pds.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.EmpVO;
import com.mzgw.dto.PdsDepVO;
import com.mzgw.util.Criteria;

public interface PdsDepDAO {
	
	public void insertPdsDep(PdsDepVO pds) throws SQLException;
	
	public int getSeqNextValue() throws SQLException;
	
	public int getRefrnSeqNextValue() throws SQLException ;
	
	public Map<String, Object> pdsDepList(EmpVO dept, String nowSort, Criteria cri) throws Exception;
	
	public void updateTitle(PdsDepVO pds) throws SQLException;
	
	public void deleteFolder(int no) throws SQLException;
}
