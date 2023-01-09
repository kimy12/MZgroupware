package com.mzgw.setle.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.SetleReplyVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.PageMaker;

public class SetleReplyDAOImpl implements SetleReplyDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	

	@Override
	public void updateSetleReplyBySetleReplyNo(SetleReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		session.update("SetleReply-Mapper.updateSetleReplyBySetleReplyNo", reply);
	}

	@Override
	public void deleteSetleReplyBySetleReplyNo(SetleReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		session.update("SetleReply-Mapper.deleteSetleReplyBySetleReplyNo", reply.getSetleReplyNo());
	}

	@Override
	public void insertSetleReply(SetleReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		session.update("SetleReply-Mapper.insertSetleReply", reply);
	}

	@Override
	public Map<String, Object> selectSetleReplyListBySetleNo(SetleReplyVO reply, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		Map<String, Object> map = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		
		int totalCount = session.selectOne("SetleReply-Mapper.selectSetleReplyListCountBySetleNo", reply.getSetleNo());
		pageMaker.setTotalCount(totalCount);
		
		List<Object> setleReplyList = session.selectList("SetleReply-Mapper.selectSetleReplyListBySetleNo", reply.getSetleNo(), rowBounds);
		
		map.put("setleReplyList", setleReplyList);
		map.put("pageMaker", pageMaker);
		
		return map;
		
	}


	@Override
	public int selectSetleReplyNoSeq() throws Exception {
		
		return session.selectOne("SetleReply-Mapper.selectSetleReplyNoSeq");
	}

}
