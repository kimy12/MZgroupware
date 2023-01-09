package com.mzgw.club.service;

import java.util.Map;

import com.mzgw.dto.ClubBoardReplyVO;
import com.mzgw.util.Criteria;

public interface ClubBoardReplyService {
	

	public Map<String, Object> getClubBoardReplyListByBoardNo(ClubBoardReplyVO reply ,Criteria cri) throws Exception;

	public void registClubBoardReply(ClubBoardReplyVO reply) throws Exception;
	
	public void modifyClubBoardReply(ClubBoardReplyVO reply) throws Exception;
	
	public void removeClubBoardReply(ClubBoardReplyVO reply) throws Exception;
	
	
	
}
