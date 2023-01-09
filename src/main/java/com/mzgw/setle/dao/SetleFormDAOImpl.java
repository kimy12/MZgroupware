package com.mzgw.setle.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.SetleFormVO;

public class SetleFormDAOImpl implements SetleFormDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public SetleFormVO selectSetleFormBySetleFormNo(int setleFormNo) {
		// TODO Auto-generated method stub
		return session.selectOne("SetleForm-Mapper.selectSetleFormBySetleFormNo", setleFormNo);
	}

	@Override
	public List<SetleFormVO> selectSetleFormList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("SetleForm-Mapper.selectSetleFormList");
	}

	@Override
	public void insertSetleForm(SetleFormVO form) throws Exception {
		// TODO Auto-generated method stub
		session.update("SetleForm-Mapper.insertSetleForm",form);
	}

	@Override
	public int selectSetleFormSeq() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("SetleForm-Mapper.selectSetleFormSeq");
	}
	
	
	
}
