package com.mzgw.club.dao;


import java.util.Map;

import com.mzgw.dto.ClubBoardReplyVO;
import com.mzgw.util.Criteria;

public interface ClubBoardReplyDAO {

	public Map<String, Object> selectClubBoardReplyListByBoardNo(ClubBoardReplyVO breply, Criteria cri) throws Exception;
	
	public void insertClubBoardReply(ClubBoardReplyVO breply) throws Exception;
	
	public void updateClubBoardReply(ClubBoardReplyVO breply) throws Exception;
	
	public void deleteClubBoardRelpy(ClubBoardReplyVO breply) throws Exception;
}
