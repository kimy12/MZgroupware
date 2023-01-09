package com.mzgw.emp.service;

import java.sql.SQLException;
import java.util.List;

import com.mzgw.dto.EmpVO;
import com.mzgw.emp.dao.EmpDAO;

public class EmpServiceImpl implements EmpService{
	
	private EmpDAO empDAO;
	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}

	@Override
	public EmpVO getEmp(String id) throws Exception {
		EmpVO emp = empDAO.selectEmpById(id);
		
		return emp;
	}

	@Override
	public String getFindId(EmpVO emp) throws Exception {
		String id = empDAO.selectFindId(emp);
		
		return id;
	}

	@Override
	public String getPhoneNum(EmpVO emp) throws Exception {
		String phone = empDAO.selectphoneNum(emp);
		
		return phone;
	}

	@Override
	public String getPwd(String id) throws Exception {
		String pwd = empDAO.selectPwd(id);
		
		return pwd;
	}

	@Override
	public String getCheckId(String id) throws Exception {
		String checkId = empDAO.selectCheckId(id);
		
		return checkId;
	}

	@Override
	public void modifyNewEmp(EmpVO emp) throws Exception {
		
		empDAO.updateNewEmp(emp);
		
	}

	@Override
	public List<EmpVO> getEmpListByDept(String dept) throws SQLException {
		List<EmpVO> empList = empDAO.selectEmpListByDept(dept);
		return empList;
	}
	
	@Override
	public EmpVO getEmpByEmplNo(String empl_no) throws SQLException{
		
		EmpVO emp = empDAO.selectEmpByEmplNo(empl_no);
		
		return emp;
		
	}

	@Override
	public List<String> getEmpNcnmByDept(String dept) throws SQLException {
		List<String> ncnm = empDAO.selectEmpNcnmByDept(dept);
		return ncnm;
	}

	@Override
	public void updateLastCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		empDAO.updateLastCheck(id);
	}

}
