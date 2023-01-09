package com.mzgw.emp.service;


import java.sql.SQLException;
import java.util.List;

import com.mzgw.dto.EmpVO;

public interface EmpService {
	
	
	public EmpVO getEmp(String id) throws Exception;
	
	public String getFindId(EmpVO emp) throws Exception;
	
	public String getPhoneNum(EmpVO emp) throws Exception;
	
	public String getPwd(String id) throws Exception;
	
	public String getCheckId(String id) throws Exception;
	
	public void updateLastCheck(String id) throws Exception;
	
	public void modifyNewEmp(EmpVO emp) throws Exception;
	
	public List<EmpVO> getEmpListByDept(String dept) throws SQLException;
	
	public List<String> getEmpNcnmByDept(String dept) throws SQLException;
	
	public EmpVO getEmpByEmplNo(String empl_no) throws SQLException;
	
}
