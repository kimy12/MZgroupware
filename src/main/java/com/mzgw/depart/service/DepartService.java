package com.mzgw.depart.service;

import java.sql.SQLException;
import java.util.List;

import com.mzgw.dto.DeptVO;

public interface DepartService {

	public List<DeptVO> getDepartList() throws SQLException;
	
	public String getDepartLeaderEmpNoByDepartName(String departName) throws SQLException;
	
}
