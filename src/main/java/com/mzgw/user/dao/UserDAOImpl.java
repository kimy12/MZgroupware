package com.mzgw.user.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.dto.EmpVO;
import com.mzgw.emp.dao.EmpDAO;

public class UserDAOImpl implements UserDAO{

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void myImgUpdate(EmpVO emp) throws SQLException {
		session.update("Emp-Mapper.myImgUpdate", emp);
	}

	@Override
	public void myInfoUpdate(EmpVO emp) throws SQLException {
		System.out.println("도달도달디에이오");
		session.update("Emp-Mapper.myInfoUpdate", emp);
	}

	@Override
	public void passworkUpdate(EmpVO emp) throws SQLException {
		System.out.println(emp.getPassword());
		   System.out.println(emp.getEmpl_no());
		   System.out.println("dao");
		
		
		session.update("Emp-Mapper.passwordUpdate", emp);
	}
	
}
