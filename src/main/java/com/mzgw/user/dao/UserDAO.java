package com.mzgw.user.dao;

import java.sql.SQLException;

import com.mzgw.dto.EmpVO;

public interface UserDAO {
	
	/* 나의 프로필 이미지 바꾸기 */
	public void myImgUpdate(EmpVO emp)throws SQLException;
	
	/* 나의 정보 변경하기 */
	public void myInfoUpdate(EmpVO emp)throws SQLException;
	
	/* 비밀번호 변경하기 */
	public void passworkUpdate(EmpVO emp)throws SQLException;

}
