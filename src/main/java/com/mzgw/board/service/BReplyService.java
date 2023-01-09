package com.mzgw.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.BReplyVO;
import com.mzgw.util.Criteria;

public interface BReplyService {

	List<BReplyVO> selectBReplyList(int board_no) throws SQLException;
	
	void insertReply(BReplyVO breply) throws SQLException;
	
	void updateReply(BReplyVO breply) throws SQLException;
	
	void deleteReply(int breply_no) throws SQLException;
	
}
