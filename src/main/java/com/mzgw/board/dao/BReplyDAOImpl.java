package com.mzgw.board.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.BReplyVO;
import com.mzgw.util.Criteria;

public class BReplyDAOImpl implements BReplyDAO {
	
	private SqlSession session;
	

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<BReplyVO> selectBReplyList(int board_no) throws SQLException {
		return session.selectList("BReply-Mapper.selectBReplyList", board_no);
		
	}

	

	@Override
	public void insertReply(BReplyVO breply) throws SQLException {
		session.update("BReply-Mapper.insertBReply" ,breply);
		
	}

	@Override
	public void updateReply(BReplyVO breply) throws SQLException {

		session.update("BReply-Mapper.updateBReply", breply);
	}

	@Override
	public void deleteReply(int breply_no) throws SQLException {

		session.delete("BReply-Mapper.deleteBReply", breply_no);
	}

	

}
