package com.mzgw.user.service;

import com.mzgw.dto.EmpVO;

public interface UserService {
	
	/* 나의 프로필 이미지 변경하기 */
	public void myPageImgUpdate(EmpVO emp)throws Exception;
	
	/* 나의 프로필 정보 변경하기 */
	public void myPageInfoUpdate(EmpVO emp)throws Exception;
	
	/* 나의 비밀번호 변경하기 */
	public void passworkUpdate(EmpVO emp)throws Exception;
}
