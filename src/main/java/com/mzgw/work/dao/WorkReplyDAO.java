package com.mzgw.work.dao;


import java.util.Map;

import com.mzgw.dto.WorkReplyVO;
import com.mzgw.util.Criteria;

public interface WorkReplyDAO {

	public Map<String, Object> selectWorkReplyListByJno(WorkReplyVO wreply, Criteria cri) throws Exception;
	
	public void inserWorkReply(WorkReplyVO wreply) throws Exception;
	
	public void updatWorkReply(WorkReplyVO wreply) throws Exception;
	
	public void deleteWorkRelpy(WorkReplyVO wreply) throws Exception;
}
