package com.mzgw.dclz.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;


import com.mzgw.dto.AnnualVO;
import com.mzgw.dto.DclzMeditationVO;
import com.mzgw.dto.DclzVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;
import com.mzgw.util.PageMaker;

public class DclzDAOImpl implements DclzDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<DclzVO> selectDclzList() throws SQLException {
		
		List<DclzVO> dclzList = session.selectList("Dclz-Mapper.selectDclzList");
		return dclzList;

	}

	@Override
	public DclzVO selectWorkTime(String empl_no) throws SQLException {
		DclzVO workTime = session.selectOne("Dclz-Mapper.selectWorkTime",empl_no);
		
		return workTime;
	}
	
	@Override
	public void insertWorkTime(DclzVO dclz) throws SQLException {
		
		session.update("Dclz-Mapper.startWorktime",dclz);
	}

	@Override
	public void updateWorkEndTime(DclzVO dclz) throws SQLException {
		session.update("Dclz-Mapper.updateWorkEndTime",dclz);
		
	}
	
	@Override
	public DclzVO selectWeekTotalTime(DclzVO dclz) throws SQLException {
		DclzVO weekTotalTime = session.selectOne("Dclz-Mapper.selectWeekTotalTime", dclz);
		
		return weekTotalTime;
	}

	@Override
	public List<DclzVO> selectWeekWorkTime(DclzVO dclz) throws SQLException {
		List<DclzVO> workTimeList = session.selectList("Dclz-Mapper.selectWeekWorkTime", dclz);
		
		return workTimeList;
	}

	@Override
	public String selectThisMonthTime(DclzVO dclz) throws SQLException {
		
		return session.selectOne("Dclz-Mapper.selectThisMonthTime", dclz);
	}

	@Override
	public void insertWorkMediation(DclzMeditationVO dclzmed) throws SQLException {
		
		session.update("Dclz-Mapper.insertDclzMediation",dclzmed);
	}

	@Override
	public List<DclzMeditationVO> selectDclzMediationList(EmpVO emp) throws SQLException {
		
		return session.selectList("Dclz-Mapper.selectDclzMediation", emp);
	}

	@Override
	public List<DclzVO> selectEmpExcelWorkTime(DclzVO dclz) throws SQLException {
		List<DclzVO> empWorkList = session.selectList("Dclz-Mapper.selectEmpExcelWorkTime", dclz);
		
		return empWorkList;
	}

	//Annual
	@Override
	public Map<String, Object> selectAnnualList(Criteria cri, EmpVO emp) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = null;
		try {
			map = MakeVOToMap.toMap(cri);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		map.put("empl_no", emp.getEmpl_no());
		
		
		List<AnnualVO> annualList = session.selectList("Dclz-Mapper.selectAnnualList",map,rowBounds);
		int totalCount = session.selectOne("Dclz-Mapper.selectAnnualListCount",map);
		int totalUse = session.selectOne("Dclz-Mapper.selectAnnualTotalUse",emp);
		
		Map<String, Object> dataMap = new HashMap<>();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("annualList", annualList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("totalUse", totalUse);
		
		return dataMap;
	}

	





}
