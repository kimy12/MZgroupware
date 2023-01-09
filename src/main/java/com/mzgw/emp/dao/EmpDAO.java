package com.mzgw.emp.dao;

import java.sql.SQLException;
import java.util.List;

import com.mzgw.dto.EmpVO;

public interface EmpDAO {
	
	public EmpVO selectEmpById(String id) throws SQLException;
	
	public String selectFindId(EmpVO emp) throws SQLException;
	
	public String selectphoneNum(EmpVO emp) throws SQLException;
	
	public String selectPwd(String id) throws SQLException;
	
	public String selectCheckId(String id) throws SQLException;
	
	public void updateLastCheck(String id) throws SQLException;
	
	public void updateNewEmp(EmpVO emp) throws SQLException;

	public List<EmpVO> selectEmpListByDept(String dept) throws SQLException;
	
	public List<String> selectEmpNcnmByDept(String dept) throws SQLException;
	
	public EmpVO selectEmpByEmplNo(String empl_no) throws SQLException;
	
}
