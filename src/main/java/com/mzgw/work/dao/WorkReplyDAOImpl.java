package com.mzgw.work.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.WorkReplyVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.PageMaker;

public class WorkReplyDAOImpl implements WorkReplyDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	


	@Override
	public Map<String, Object> selectWorkReplyListByJno(WorkReplyVO wreply, Criteria cri) throws Exception {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		Map<String, Object> map = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		

		int totalCount = session.selectOne("WorkReply-Mapper.selectWReplyListCount", wreply);
		System.out.println(totalCount);
		pageMaker.setTotalCount(totalCount);
		
		List<Object> boardReplyList = session.selectList("WorkReply-Mapper.selectWReplyList",wreply, rowBounds);

		map.put("boardReplyList", boardReplyList);
		map.put("pageMaker", pageMaker);
		
		return map;
	}


	@Override
	public void inserWorkReply(WorkReplyVO wreply) throws Exception {
		session.update("WorkReply-Mapper.insertWorkReply", wreply);
	}


	@Override
	public void updatWorkReply(WorkReplyVO wreply) throws Exception {
		session.update("WorkReply-Mapper.updateWorkdReply", wreply);
		
	}


	@Override
	public void deleteWorkRelpy(WorkReplyVO wreply) throws Exception {
		session.delete("WorkReply-Mapper.deleteWorkReply", wreply);
		
	}

}
