package com.mzgw.setle.service;

import java.util.List;
import java.util.Map;

import com.mzgw.dto.SetleReplyVO;
import com.mzgw.setle.dao.SetleReplyDAO;
import com.mzgw.util.Criteria;

public class SetleReplyServiceImpl implements SetleReplyService {

	private SetleReplyDAO setleReplyDAO;
	
	
	public void setSetleReplyDAO(SetleReplyDAO setleReplyDAO) {
		this.setleReplyDAO = setleReplyDAO;
	}

	@Override
	public void modifySetleReplyBySetleReplyNo(SetleReplyVO reply) throws Exception {
		setleReplyDAO.updateSetleReplyBySetleReplyNo(reply);

	}

	@Override
	public void removeSetleReplyBySetleReplyNo(SetleReplyVO reply) throws Exception {
		setleReplyDAO.deleteSetleReplyBySetleReplyNo(reply);

	}

	@Override
	public void registSetleReply(SetleReplyVO reply) throws Exception {
		int replyNo = setleReplyDAO.selectSetleReplyNoSeq();
		
		reply.setSetleReplyNo(replyNo);
		
		setleReplyDAO.insertSetleReply(reply);

	}

	@Override
	public Map<String, Object> getSetleReplyListBySetleNo(SetleReplyVO reply, Criteria cri) throws Exception {

		
		
		return setleReplyDAO.selectSetleReplyListBySetleNo(reply, cri);
	}

}
