package com.mzgw.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mzgw.board.dao.BReplyDAO;
import com.mzgw.dto.BReplyVO;
import com.mzgw.util.Criteria;

public class BReplyServiceImpl implements BReplyService {

	private BReplyDAO breplyDAO;
	
	public void setBreplyDAO(BReplyDAO breplyDAO) {
		this.breplyDAO = breplyDAO;
	}

	@Override
	public List<BReplyVO> selectBReplyList(int board_no) throws SQLException {
		
		return breplyDAO.selectBReplyList(board_no);
		
	}

	@Override
	public void insertReply(BReplyVO breply) throws SQLException {

		breplyDAO.insertReply(breply);
	}

	@Override
	public void updateReply(BReplyVO breply) throws SQLException {

		breplyDAO.updateReply(breply);
	}

	@Override
	public void deleteReply(int breply_no) throws SQLException {

		breplyDAO.deleteReply(breply_no);
	}

	

}
