package com.mzgw.board.dao;

import java.sql.SQLException;
import java.util.List;


import com.mzgw.dto.BReplyVO;
import com.mzgw.util.Criteria;

public interface BReplyDAO {

	//자유게시판 댓글 조회
	List<BReplyVO> selectBReplyList(int board_no) throws SQLException;
	
	void insertReply(BReplyVO breply) throws SQLException;
	
	void updateReply(BReplyVO breply) throws SQLException;
	
	void deleteReply(int breply_no) throws SQLException;
}
