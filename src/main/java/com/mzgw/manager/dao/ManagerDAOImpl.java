package com.mzgw.manager.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.CompanyTopbarVO;
import com.mzgw.dto.DeptVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.WorkTimeVO;
import com.mzgw.util.Criteria;

public class ManagerDAOImpl implements ManagerDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<EmpVO> selectEmpList(Criteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<EmpVO> empList = session.selectList("Manager-Mapper.selectEmpList",cri,rowBounds);
		return empList;
	}
	
	@Override
	public int selectEmpListCount(Criteria cri) throws Exception {
		int totalCount = session.selectOne("Manager-Mapper.selectEmpListCount",cri);
		
		return totalCount;
	}
	
	@Override
	public List<DeptVO> selectDeptName() throws SQLException {
		List<DeptVO> deptName = session.selectList("Manager-Mapper.selectDeptName");
		return deptName;
	}
	
	@Override
	public WorkTimeVO selectWorkTime() throws SQLException {
		
		return session.selectOne("Manager-Mapper.selectWorkTime");
	}
	
	@Override
	public void insertEmp(EmpVO emp) throws SQLException {
		
		session.update("Manager-Mapper.insertEmp",emp);

	}

	@Override
	public void updateWorkTime(WorkTimeVO workTime) throws SQLException {
		
		session.update("Manager-Mapper.updateWorkTime", workTime);
		
	}

	@Override
	public CompanyTopbarVO selectTopbarColor() throws Exception {
		
		return session.selectOne("Manager-Mapper.selectCompanyTopbar");
	}

	@Override
	public void updateTopbarColor(String color) throws SQLException {
		
		session.update("Manager-Mapper.updateTopbarColor",color);
		
	}




}
