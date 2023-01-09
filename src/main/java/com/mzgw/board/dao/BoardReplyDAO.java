package com.mzgw.board.dao;


import java.util.Map;

import com.mzgw.dto.BReplyVO;
import com.mzgw.util.Criteria;

public interface BoardReplyDAO {

	public Map<String, Object> selectBoardReplyListByBoardNo(BReplyVO breply, Criteria cri) throws Exception;
	
	public void insertBoardReply(BReplyVO breply) throws Exception;
	
	public void updateBoardReply(BReplyVO breply) throws Exception;
	
	public void deleteBoardRelpy(BReplyVO breply) throws Exception;
}
