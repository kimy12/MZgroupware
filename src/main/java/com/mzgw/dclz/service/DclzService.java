package com.mzgw.dclz.service;



import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.mzgw.dto.DclzMeditationVO;
import com.mzgw.dto.DclzVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;


public interface DclzService {
	
	//dczl
	public List<DclzVO> getDclzList()throws Exception;
	
	public List<DclzMeditationVO> getDclzMediationList(EmpVO emp)throws Exception;
	
	public List<DclzVO> getWeekTotalTime(List<DclzVO> weekList)throws Exception;
	
	public Map<String, String> getThisWeekAndMonthTime(String empl_no)throws Exception;
	
	public List<DclzVO> getWeekWorkList(DclzVO dclz)throws Exception;
	
	public List<DclzVO> getEmpMonthDclzList(DclzVO dclz)throws Exception;
	
	public DclzVO getTodayWorkTime(String empl_no) throws Exception;
	
	public void regWorkTime(DclzVO dclz) throws Exception;
	
	public void regWorkMediation(DclzMeditationVO dclzmed) throws Exception;
	
	public void modWorkEndTime(DclzVO dclz) throws Exception;
	
	public SXSSFWorkbook makeExcel(List<DclzVO> list, String sheetName)throws Exception;
	
	
	//annual
	public Map<String,Object> getAnnualList(Criteria cri, EmpVO emp) throws Exception;
}
