package com.mzgw.work.service;

import java.util.Map;

import com.mzgw.dto.WorkReplyVO;
import com.mzgw.util.Criteria;
import com.mzgw.work.dao.WorkReplyDAO;

public class WorkReplyServiceImpl implements WorkReplyService {
	
	private WorkReplyDAO workReplyDAO;
	public void setWorkReplyDAO(WorkReplyDAO workReplyDAO) {
		this.workReplyDAO = workReplyDAO;
	}
	
	@Override
	public Map<String, Object> getWorkReplyListByJno(WorkReplyVO wreply, Criteria cri) throws Exception {
		return workReplyDAO.selectWorkReplyListByJno(wreply, cri);
	}


	@Override
	public void registWorkReply(WorkReplyVO wreply) throws Exception {
		workReplyDAO.inserWorkReply(wreply);
		
	}


	@Override
	public void modifyWorkReply(WorkReplyVO wreply) throws Exception {
		workReplyDAO.updatWorkReply(wreply);
		
	}


	@Override
	public void removeWorkReply(WorkReplyVO wreply) throws Exception {
		workReplyDAO.deleteWorkRelpy(wreply);
		
	}
	
}


	