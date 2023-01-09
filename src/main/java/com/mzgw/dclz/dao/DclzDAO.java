package com.mzgw.dclz.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AnnualVO;
import com.mzgw.dto.DclzMeditationVO;
import com.mzgw.dto.DclzVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;


public interface DclzDAO {
	
	//dclz
	public List<DclzVO> selectDclzList() throws SQLException;
	
	public List<DclzVO> selectEmpExcelWorkTime(DclzVO dclz) throws SQLException;
	
	public List<DclzMeditationVO> selectDclzMediationList(EmpVO emp) throws SQLException;
	
	public DclzVO selectWeekTotalTime(DclzVO dclz) throws SQLException;
	
	public String selectThisMonthTime(DclzVO dclz) throws SQLException;
	
	public List<DclzVO> selectWeekWorkTime(DclzVO dclz) throws SQLException;
	
	public DclzVO selectWorkTime(String empl_no) throws SQLException;
	
	
	public void insertWorkTime(DclzVO dclz) throws SQLException;
	
	public void insertWorkMediation(DclzMeditationVO dclzmed) throws SQLException;
	
	public void updateWorkEndTime(DclzVO dclz) throws SQLException;
	
	//annual
	public Map<String, Object> selectAnnualList(Criteria cri, EmpVO emp) throws SQLException;
	
	

		
}
