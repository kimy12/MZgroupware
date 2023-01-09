package com.mzgw.push.service;

import java.util.List;

import com.mzgw.depart.dao.DepartDAO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.MailVO;
import com.mzgw.dto.PushVO;
import com.mzgw.dto.ReceVO;
import com.mzgw.dto.SetleEmpVO;
import com.mzgw.dto.SetleVO;
import com.mzgw.dto.WorkMemVO;
import com.mzgw.dto.WorkVO;
import com.mzgw.emp.dao.EmpDAO;
import com.mzgw.push.dao.PushDAO;
import com.mzgw.setle.dao.SetleDAO;
import com.mzgw.setle.dao.SetleEmpDAO;
import com.mzgw.setle.dao.SetleFormDAO;

public class PushServiceImpl implements PushService {

	private PushDAO pushDAO;
	public void setPushDAO(PushDAO pushDAO) {
		this.pushDAO = pushDAO;
	}
	private SetleDAO setleDAO;
	
	private DepartDAO departDAO;
	
	private SetleEmpDAO setleEmpDAO;
	
	private EmpDAO empDAO;
	
	private SetleFormDAO setleFormDAO;
	
	
	

	public void setSetleFormDAO(SetleFormDAO setleFormDAO) {
		this.setleFormDAO = setleFormDAO;
	}

	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}

	public void setSetleEmpDAO(SetleEmpDAO setleEmpDAO) {
		this.setleEmpDAO = setleEmpDAO;
	}

	public void setDepartDAO(DepartDAO departDAO) {
		this.departDAO = departDAO;
	}

	public void setSetleDAO(SetleDAO setleDAO) {
		this.setleDAO = setleDAO;
	}

	@Override
	public List<PushVO> getUnreadPushListByEmplNo(String empl_no) throws Exception {
		// TODO Auto-generated method stub
		return pushDAO.selectUnreadPushListByEmplNo(empl_no);
	}

	@Override
	public void changeRead(int pushNo) throws Exception {
		// TODO Auto-generated method stub
		pushDAO.updateRead(pushNo);
	}

	@Override
	public void registPushForSetleProcess(SetleVO setle) throws Exception {
		// TODO Auto-generated method stub
		
		setle = setleDAO.selectSetleBySetleNo(setle.getSetleNo());
		List<SetleEmpVO> setleEmpList = setleEmpDAO.selectSetleEmpListBySetleNo(setle.getSetleNo());
		
		for(SetleEmpVO emp : setleEmpList) {
			if(emp.getAgrSttus()!=3) {
				PushVO push = new PushVO();
				int pushNo = pushDAO.selectPushNoSeq();
				push.setPushNo(pushNo);
				push.setPushType("setle");
				push.setPushEmp(emp.getEmplNo());
				push.setPushCn(setle.getSetleSj());
				push.setPushUrl("/setle/setleDetail?setleNo="+setle.getSetleNo());
				pushDAO.insertPush(push);
			}
		}
	}

	@Override
	public void registPushForMail(MailVO mail,List<ReceVO> resultList) throws Exception {
		// TODO Auto-generated method stub
		
		
		for(ReceVO rec : resultList) {
			PushVO push = new PushVO();
			int pushNo = pushDAO.selectPushNoSeq();
			push.setPushNo(pushNo);
			push.setPushType("mail");
			push.setPushEmp(rec.getReceEmp());
			push.setPushCn(mail.getEmailSj());
			push.setPushUrl("/mail/detail?eno="+mail.getEmailNo());
			pushDAO.insertPush(push);
		}
		
		
	}

	@Override
	public void registPushForWork(WorkVO work) throws Exception {
		
		for(WorkMemVO mvo : work.getWorkMemList()) {
			PushVO push = new PushVO();
			int pushNo = pushDAO.selectPushNoSeq();
			push.setPushNo(pushNo);
			push.setPushType("work");
			push.setPushEmp(mvo.getJobMemCode());
			push.setPushCn(work.getJobNm());
			push.setPushUrl("/work/detail?wno="+work.getJobCode());
			pushDAO.insertPush(push);
		}

	}

	@Override
	public PushVO getNewPush(EmpVO emp) throws Exception {
		// TODO Auto-generated method stub
		
		return pushDAO.selectUnreadPushByEmplNoAndDate(emp);
	}

}
