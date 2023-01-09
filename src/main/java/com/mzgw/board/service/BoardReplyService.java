package com.mzgw.board.service;

import java.util.Map;

import com.mzgw.dto.BReplyVO;
import com.mzgw.util.Criteria;

public interface BoardReplyService {
	

	public Map<String, Object> getBoardReplyListByBoardNo(BReplyVO breply ,Criteria cri) throws Exception;

	public void registBoardReply(BReplyVO breply) throws Exception;
	
	public void modifyBoardReply(BReplyVO breply) throws Exception;
	
	public void removeBoardReply(BReplyVO breply) throws Exception;
	
	
	
}
