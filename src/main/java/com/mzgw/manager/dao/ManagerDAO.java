package com.mzgw.manager.dao;

import java.sql.SQLException;
import java.util.List;

import com.mzgw.dto.CompanyTopbarVO;
import com.mzgw.dto.DeptVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.WorkTimeVO;
import com.mzgw.util.Criteria;


public interface ManagerDAO {
	
	public List<EmpVO> selectEmpList(Criteria cri) throws SQLException;
	
	public List<DeptVO> selectDeptName() throws SQLException;
	
	public CompanyTopbarVO selectTopbarColor() throws Exception;
	
	public WorkTimeVO selectWorkTime() throws SQLException;
	
	public int selectEmpListCount(Criteria cri) throws Exception;
	
	public void insertEmp(EmpVO emp) throws SQLException;
	
	public void updateTopbarColor(String color) throws SQLException;
	
	public void updateWorkTime(WorkTimeVO workTime) throws SQLException;
}
