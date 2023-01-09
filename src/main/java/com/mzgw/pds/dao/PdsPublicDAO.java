package com.mzgw.pds.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.PdsPublicVO;
import com.mzgw.util.Criteria;

public interface PdsPublicDAO {

		
	public Map<String, Object> pdsPublicList(String nowSort, Criteria cri) throws Exception;
		
	public void insertPdsPublic(PdsPublicVO pds)throws SQLException;
		
	public int getSeqNextValue() throws SQLException;
		
	public int getRefrnSeqNextValue() throws SQLException ;
	
	public void deleteFolder(int no)throws SQLException;
	
	public void updateTitle(PdsPublicVO pds) throws SQLException;
}
