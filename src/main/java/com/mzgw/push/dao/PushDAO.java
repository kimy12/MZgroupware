package com.mzgw.push.dao;

import java.util.List;

import com.mzgw.dto.EmpVO;
import com.mzgw.dto.PushVO;

public interface PushDAO {

	public List<PushVO> selectUnreadPushListByEmplNo(String empl_no)throws Exception;
	
	public PushVO selectUnreadPushByEmplNoAndDate(EmpVO emp)throws Exception;
	
	public void insertPush(PushVO push)throws Exception;
	
	public void updateRead(int pushNo) throws Exception;
	
	public int selectPushNoSeq()throws Exception;
	
}
