package com.mzgw.push.service;

import java.util.List;

import com.mzgw.dto.EmpVO;
import com.mzgw.dto.MailVO;
import com.mzgw.dto.PushVO;
import com.mzgw.dto.ReceVO;
import com.mzgw.dto.SetleVO;
import com.mzgw.dto.WorkVO;

public interface PushService {

	public List<PushVO> getUnreadPushListByEmplNo(String empl_no)throws Exception;
	
	public void changeRead(int pushNo) throws Exception;
	
	public PushVO getNewPush(EmpVO emp) throws Exception;
	
	public void registPushForSetleProcess(SetleVO setle)throws Exception;
	
	public void registPushForMail(MailVO mail,List<ReceVO> resultList)throws Exception;
	
	public void registPushForWork(WorkVO work)throws Exception;
	
}
