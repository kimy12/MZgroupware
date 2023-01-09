package com.mzgw.depart.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.DclzVO;
import com.mzgw.dto.DeptVO;

public class DepartDAOImpl implements DepartDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<DeptVO> selectDepartList() throws SQLException{
		
		return session.selectList("Depart-Mapper.selectDepartList");
	}

	@Override
	public String selectDepartLeaderByDepartName(String departName) throws SQLException{
		
		return session.selectOne("Depart-Mapper.selectDepartLeaderByDepartName", departName);
	}

	




}
