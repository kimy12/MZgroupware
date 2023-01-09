package com.mzgw.manager.dao;

import java.sql.SQLException;
import java.util.List;

import com.mzgw.dto.AnnualVO;
import com.mzgw.dto.DclzManagerVO;
import com.mzgw.dto.DclzMeditationVO;
import com.mzgw.dto.DclzVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;

public interface DclzManagerDAO {
	
	public List<DclzVO> selectDclzList(DclzVO dclz,Criteria cri) throws SQLException;
	
	public List<DclzVO> selectTotalWork(DclzVO dclz) throws Exception;
	
	public List<EmpVO> selectEmpList(Criteria cri) throws SQLException;
	
	public List<DclzMeditationVO> selectManagerDclzMediationList(Criteria cri) throws SQLException;
	
	public int selectDclzMediationListCount(Criteria cri) throws SQLException;
	
	public  List<DclzManagerVO> selectDclzWeekList(DclzManagerVO dmv) throws Exception;
	
	public int selectEmpListCount(Criteria cri) throws Exception;
	
	public void updateDclzMediation(DclzMeditationVO dclzmed) throws Exception;
	
	public void updateDclz(DclzMeditationVO dclzmed) throws Exception;
	
	public void deleteDclzMediation(DclzMeditationVO dclzmed) throws Exception;
	
//	ANNUAL
	public List<AnnualVO> selectAnnualList(Criteria cri) throws SQLException;
	
	public int selectAnnualListCount(Criteria cri) throws SQLException;
}
