package com.mzgw.board.service;

import java.util.Map;

import com.mzgw.board.dao.BoardReplyDAO;
import com.mzgw.dto.BReplyVO;
import com.mzgw.util.Criteria;

public class BoardReplyServiceImpl implements BoardReplyService {
	
	private BoardReplyDAO boardReplyDAO;

	public void setBoardReplyDAO(BoardReplyDAO boardReplyDAO) {
		this.boardReplyDAO = boardReplyDAO;
	}
	
	
	@Override
	public Map<String, Object> getBoardReplyListByBoardNo(BReplyVO breply, Criteria cri) throws Exception {
		return boardReplyDAO.selectBoardReplyListByBoardNo(breply, cri);
	}


	@Override
	public void registBoardReply(BReplyVO breply) throws Exception {
		boardReplyDAO.insertBoardReply(breply);
		
	}


	@Override
	public void modifyBoardReply(BReplyVO breply) throws Exception {
		boardReplyDAO.updateBoardReply(breply);
		
	}


	@Override
	public void removeBoardReply(BReplyVO breply) throws Exception {
		boardReplyDAO.deleteBoardRelpy(breply);
		
	}
	



	
	
	
}


	