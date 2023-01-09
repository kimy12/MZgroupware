package com.mzgw.refrn.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.PdsPrivateVO;
import com.mzgw.dto.PdsPublicVO;
import com.mzgw.dto.RefrnVO;

public class RefrnDAOImpl implements RefrnDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public int getReferSeqNextValue() throws SQLException {
		return session.selectOne("Refrn-Mapper.selectRefrnSeqNext");
	}
	@Override
	public void insertRefrn(RefrnVO refrn) throws SQLException {
		session.update("Refrn-Mapper.insertRefrn", refrn);
	}
	@Override
	public List<RefrnVO> selectRefrnPpl(PdsPrivateVO unity) throws SQLException {
		return session.selectList("Refrn-Mapper.selectRefrnPpl",unity);
	}
	
//	@Override
//	public List<RefrnVO> selectRefrnPpl(PdsPublicVO unity) throws SQLException {
//		return session.selectList("Refrn-Mapper.selectRefrnPpl",unity);
//	}
	@Override
	public void deleteAllByUnity(RefrnVO unity) throws SQLException {
		session.update("Refrn-Mapper.deleteAllByUnity",unity);
	}
}
