package com.mzgw.push.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.EmpVO;
import com.mzgw.dto.PushVO;

public class PushDAOImpl implements PushDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<PushVO> selectUnreadPushListByEmplNo(String empl_no) throws Exception {
		// TODO Auto-generated method stub
		RowBounds rowBounds = new RowBounds(0,4);
		return session.selectList("Push-Mapper.selectUnreadPushListByEmplNo",empl_no,rowBounds);
	}

	@Override
	public void insertPush(PushVO push) throws Exception {
		// TODO Auto-generated method stub
		session.update("Push-Mapper.insertPush",push);
	}

	@Override
	public void updateRead(int pushNo) throws Exception {
		// TODO Auto-generated method stub
		session.update("Push-Mapper.updateRead",pushNo);
	}

	@Override
	public int selectPushNoSeq() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("Push-Mapper.selectPushNoSeq");
	}

	@Override
	public PushVO selectUnreadPushByEmplNoAndDate(EmpVO emp) throws Exception {
		// TODO Auto-generated method stub
		  List<PushVO> selectList = session.selectList("Push-Mapper.selectUnreadPushByEmplNoAndDate",emp);
		  PushVO push = null;
		  if(selectList != null && !selectList.isEmpty()) {
			  push = selectList.get(0);
		  }
		  
		  return push;
	}

}
