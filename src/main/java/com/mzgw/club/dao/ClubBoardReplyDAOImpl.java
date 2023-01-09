package com.mzgw.club.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.ClubBoardReplyVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.PageMaker;

public class ClubBoardReplyDAOImpl implements ClubBoardReplyDAO {
	
	private SqlSession session;
	

	public void setSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public Map<String, Object> selectClubBoardReplyListByBoardNo(ClubBoardReplyVO reply, Criteria cri) throws Exception {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		Map<String, Object> map = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		

		int totalCount = session.selectOne("ClubBoardReply-Mapper.selectClubReplyListCount", reply);
		System.out.println(totalCount);
		pageMaker.setTotalCount(totalCount);
		
		List<Object> boardReplyList = session.selectList("ClubBoardReply-Mapper.selectclubReplyList",reply, rowBounds);

		map.put("boardReplyList", boardReplyList);
		map.put("pageMaker", pageMaker);
		
		return map;
	}


	@Override
	public void insertClubBoardReply(ClubBoardReplyVO reply) throws Exception {
		session.update("ClubBoardReply-Mapper.insertClubBoardReply", reply);
	}


	@Override
	public void updateClubBoardReply(ClubBoardReplyVO reply) throws Exception {
		session.update("ClubBoardReply-Mapper.updateClubBoardReply", reply);
		
	}


	@Override
	public void deleteClubBoardRelpy(ClubBoardReplyVO reply) throws Exception {
		session.delete("ClubBoardReply-Mapper.deleteClubBoardReply", reply);
		
	}
		
	


	

}
