package com.mzgw.depart.service;

import java.sql.SQLException;
import java.util.List;

import com.mzgw.depart.dao.DepartDAO;
import com.mzgw.dto.DeptVO;

public class DepartServiceImpl implements DepartService{

	private DepartDAO departDAO;
	
	public void setDepartDAO(DepartDAO departDAO) {
		this.departDAO = departDAO;
	}

	@Override
	public List<DeptVO> getDepartList() throws SQLException{
		// TODO Auto-generated method stub
		return departDAO.selectDepartList();
	}

	@Override
	public String getDepartLeaderEmpNoByDepartName(String departName) throws SQLException{
		// TODO Auto-generated method stub
		return departDAO.selectDepartLeaderByDepartName(departName);
	}

}
