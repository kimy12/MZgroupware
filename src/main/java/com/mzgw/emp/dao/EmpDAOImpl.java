package com.mzgw.emp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.EmpVO;

public class EmpDAOImpl implements EmpDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public EmpVO selectEmpById(String id) throws SQLException {
		
		EmpVO emp = session.selectOne("Emp-Mapper.selectEmp",id);
		
		return emp;
	}

	@Override
	public String selectFindId(EmpVO emp) throws SQLException {
		
		String id = session.selectOne("Emp-Mapper.selectId",emp);
		
		return id;
	}

	@Override
	public String selectphoneNum(EmpVO emp) throws SQLException {
		
		String phone = session.selectOne("Emp-Mapper.selectPhone",emp);
		
		return phone;
	}

	@Override
	public String selectPwd(String id) throws SQLException {
		
		String pwd = session.selectOne("Emp-Mapper.selectPwd",id);
		
		return pwd;
	}

	@Override
	public String selectCheckId(String id) throws SQLException {
		
		String checkId = session.selectOne("Emp-Mapper.checkId", id);
		
		return checkId;
	}

	@Override
	public void updateNewEmp(EmpVO emp) throws SQLException {
		
		session.update("Emp-Mapper.updateNewEmp", emp);
		
	}

	@Override
	public List<EmpVO> selectEmpListByDept(String dept) throws SQLException {
		
		List<EmpVO> empList = session.selectList("Emp-Mapper.selectEmpListByDept", dept);
		return empList;
	}
	
	public EmpVO selectEmpByEmplNo(String empl_no) throws SQLException{
		
		EmpVO emp = session.selectOne("Emp-Mapper.selectEmpByEmplNo",empl_no);
		
		return emp;
		
	}

	@Override
	public List<String> selectEmpNcnmByDept(String dept) throws SQLException {
		List<String> ncnm = session.selectList("Emp-Mapper.selectEmpNcnmByDept", dept);
		return ncnm;
	}

	@Override
	public void updateLastCheck(String id) throws SQLException {
		// TODO Auto-generated method stub
		session.update("Emp-Mapper.updateLastCheck", id);
	}

}
