package com.mzgw.setle.dao;

import java.util.List;
import java.util.Map;

import com.mzgw.dto.SetleReplyVO;
import com.mzgw.util.Criteria;

public interface SetleReplyDAO {

	public void updateSetleReplyBySetleReplyNo(SetleReplyVO reply) throws Exception;
	
	public void deleteSetleReplyBySetleReplyNo(SetleReplyVO reply) throws Exception;
	
	public void insertSetleReply(SetleReplyVO reply) throws Exception;
	
	public int selectSetleReplyNoSeq() throws Exception;
	
	public  Map<String, Object> selectSetleReplyListBySetleNo(SetleReplyVO reply, Criteria cri) throws Exception;
	
	
}
