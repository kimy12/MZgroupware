package com.mzgw.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.BReplyVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.PageMaker;

public class BoardReplyDAOImpl implements BoardReplyDAO {
	
	private SqlSession session;
	

	public void setSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public Map<String, Object> selectBoardReplyListByBoardNo(BReplyVO breply, Criteria cri) throws Exception {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		Map<String, Object> map = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		

		int totalCount = session.selectOne("CustomBoardReply-Mapper.selectBReplyListCount", breply);
		System.out.println(totalCount);
		pageMaker.setTotalCount(totalCount);
		
		List<Object> boardReplyList = session.selectList("CustomBoardReply-Mapper.selectBReplyList",breply, rowBounds);

		map.put("boardReplyList", boardReplyList);
		map.put("pageMaker", pageMaker);
		
		return map;
	}


	@Override
	public void insertBoardReply(BReplyVO breply) throws Exception {
		session.update("CustomBoardReply-Mapper.insertBoardReply", breply);
	}


	@Override
	public void updateBoardReply(BReplyVO breply) throws Exception {
		session.update("CustomBoardReply-Mapper.updateBoardReply", breply);
		
	}


	@Override
	public void deleteBoardRelpy(BReplyVO breply) throws Exception {
		session.delete("CustomBoardReply-Mapper.deleteBoardReply", breply);
		
	}
		
	


	

}
