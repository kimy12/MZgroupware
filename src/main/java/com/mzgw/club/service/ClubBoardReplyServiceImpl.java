package com.mzgw.club.service;

import java.util.Map;

import com.mzgw.club.dao.ClubBoardReplyDAO;
import com.mzgw.dto.ClubBoardReplyVO;
import com.mzgw.util.Criteria;

public class ClubBoardReplyServiceImpl implements ClubBoardReplyService {
	
	private ClubBoardReplyDAO clubBoardReplyDAO;

	public void setClubBoardReplyDAO(ClubBoardReplyDAO clubBoardReplyDAO) {
	this.clubBoardReplyDAO = clubBoardReplyDAO;
}
	@Override
	public Map<String, Object> getClubBoardReplyListByBoardNo(ClubBoardReplyVO reply, Criteria cri) throws Exception {
		return clubBoardReplyDAO.selectClubBoardReplyListByBoardNo(reply, cri);
	}

	@Override
	public void registClubBoardReply(ClubBoardReplyVO reply) throws Exception {
		clubBoardReplyDAO.insertClubBoardReply(reply);
	}

	@Override
	public void modifyClubBoardReply(ClubBoardReplyVO reply) throws Exception {
		clubBoardReplyDAO.updateClubBoardReply(reply);
		
	}

	@Override
	public void removeClubBoardReply(ClubBoardReplyVO reply) throws Exception {
		clubBoardReplyDAO.deleteClubBoardRelpy(reply);
		
		
	}
	
	

	



	
	
	
}


	