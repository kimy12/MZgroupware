package com.mzgw.depart.dao;

import java.sql.SQLException;
import java.util.List;

import com.mzgw.dto.DclzVO;
import com.mzgw.dto.DeptVO;

public interface DepartDAO {

	public List<DeptVO> selectDepartList() throws SQLException;
	
	public String selectDepartLeaderByDepartName(String DepartName) throws SQLException;
	
	
	
}
