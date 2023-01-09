package com.mzgw.setle.service;

import java.util.List;
import java.util.Map;

import com.mzgw.dto.SetleReplyVO;
import com.mzgw.util.Criteria;

public interface SetleReplyService {

	public void modifySetleReplyBySetleReplyNo(SetleReplyVO reply) throws Exception;
	
	public void removeSetleReplyBySetleReplyNo(SetleReplyVO reply) throws Exception;
	
	public void registSetleReply(SetleReplyVO reply) throws Exception;
	
	public Map<String, Object> getSetleReplyListBySetleNo(SetleReplyVO reply, Criteria cri) throws Exception;
	
}
