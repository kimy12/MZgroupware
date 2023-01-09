package com.mzgw.user.service;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.dto.EmpVO;
import com.mzgw.emp.dao.EmpDAO;
import com.mzgw.user.dao.UserDAO;

public class UserServiceImpl implements UserService{
	
	private UserDAO userDAO;
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@Override
	public void myPageImgUpdate(EmpVO emp) throws Exception {
		userDAO.myImgUpdate(emp);
	}

	@Override
	public void myPageInfoUpdate(EmpVO emp) throws Exception {
		userDAO.myInfoUpdate(emp);
	}

	@Override
	public void passworkUpdate(EmpVO emp) throws Exception {
		
		System.out.println(emp.getPassword());
		   System.out.println(emp.getEmpl_no());
		   System.out.println("서비스");
		userDAO.passworkUpdate(emp);
	}
}
