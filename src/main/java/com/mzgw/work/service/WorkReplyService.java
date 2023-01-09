package com.mzgw.work.service;

import java.util.Map;

import com.mzgw.dto.WorkReplyVO;
import com.mzgw.util.Criteria;

public interface WorkReplyService {
	

	public Map<String, Object> getWorkReplyListByJno(WorkReplyVO wreply ,Criteria cri) throws Exception;

	public void registWorkReply(WorkReplyVO wreply) throws Exception;
	
	public void modifyWorkReply(WorkReplyVO wreply) throws Exception;
	
	public void removeWorkReply(WorkReplyVO wreply) throws Exception;
	
	
	
}
