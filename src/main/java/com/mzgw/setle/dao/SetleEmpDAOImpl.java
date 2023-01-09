package com.mzgw.setle.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.SetleEmpVO;

public class SetleEmpDAOImpl implements SetleEmpDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<SetleEmpVO> selectSetleEmpListBySetleNo(int setleNo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("SetleEmp-Mapper.selectSetleEmpListby",setleNo);
	}

	@Override
	public void insertSetleEmp(SetleEmpVO setleEmp) throws Exception {
		// TODO Auto-generated method stub
		session.update("SetleEmp-Mapper.insertSelteEmp", setleEmp);
	}
	@Override
	public void deleteAllSetlEmpBySetleNo(int setleNo) throws Exception {
		// TODO Auto-generated method stub
		session.delete("SetleEmp-Mapper.deleteAllSetlEmpBySetleNo", setleNo);
	}
	@Override
	public void updateSttusAgree(SetleEmpVO setleEmp) throws Exception {
		// TODO Auto-generated method stub
		session.update("SetleEmp-Mapper.updateSttusAgree", setleEmp);
	}
	@Override
	public void updateSttusDisagree(SetleEmpVO setleEmp) throws Exception {
		// TODO Auto-generated method stub
		session.update("SetleEmp-Mapper.updateSttusDisagree", setleEmp);
	}

}
