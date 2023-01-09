package com.mzgw.refrn.dao;

import java.sql.SQLException;
import java.util.List;

import com.mzgw.dto.PdsPrivateVO;
import com.mzgw.dto.PdsPublicVO;
import com.mzgw.dto.RefrnVO;

public interface RefrnDAO {
	
	public int getReferSeqNextValue() throws SQLException;
	
	public void insertRefrn(RefrnVO refrn) throws SQLException;
	
	public List<RefrnVO> selectRefrnPpl (PdsPrivateVO unity)throws SQLException;
	
	public void deleteAllByUnity(RefrnVO unity)throws SQLException;
	
	//public List<RefrnVO> selectRefrnPpl(PdsPublicVO unity) throws SQLException;
	
	
}
