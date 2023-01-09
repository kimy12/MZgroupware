package com.mzgw.manager.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AnnualVO;
import com.mzgw.dto.DclzManagerVO;
import com.mzgw.dto.DclzMeditationVO;
import com.mzgw.dto.DclzVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.manager.dao.DclzManagerDAO;
import com.mzgw.util.Criteria;
import com.mzgw.util.PageMaker;



public class DclzManagerServiceImpl implements DclzManagerService {
		
	private DclzManagerDAO dclzManagerDAO;
	public void setDclzManagerDAO(DclzManagerDAO dclzManagerDAO) {
		this.dclzManagerDAO = dclzManagerDAO;
	}


	@Override
	public Map<String, Object> getDclzManagerList(Criteria cri, DclzVO dclz) throws Exception {
		
		Criteria searchCri = (Criteria)cri;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dclzManagerDAO.selectEmpListCount(searchCri));
		
		Calendar day1=Calendar.getInstance();
		Calendar day2=Calendar.getInstance();
		
		day1.add(Calendar.DATE,7-day1.get(Calendar.DAY_OF_WEEK)+1);
		day2.add(Calendar.DATE,1-day2.get(Calendar.DAY_OF_WEEK)+1);
		SimpleDateFormat sdt= new SimpleDateFormat("yyyy/MM/dd");
		
		String endTime = sdt.format(day1.getTime());
		String beginTime = sdt.format(day2.getTime());

		dclz.setBeginTime(beginTime);
		dclz.setEndTime(endTime);
		
		List<EmpVO> empList = dclzManagerDAO.selectEmpList(searchCri);
		
		List<DclzVO> dclzList = dclzManagerDAO.selectDclzList(dclz,searchCri);
		
		List<DclzVO> totalwork = dclzManagerDAO.selectTotalWork(dclz);

		
		dataMap.put("empList", empList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("dclzList",dclzList);
		dataMap.put("totalwork",totalwork);
		
		return dataMap;
	}


	@Override
	public Map<String, Object> getDclzWeekList(DclzManagerVO dmv) throws Exception {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<DclzManagerVO> weekList = dclzManagerDAO.selectDclzWeekList(dmv);
		dataMap.put("weekList", weekList);
		
		return dataMap;
	}


	@Override
	public Map<String, Object> getManagerDclzMediationList(Criteria cri) throws Exception {
		Criteria searchCri = (Criteria)cri;
		Map<String, Object> dataMap = new HashMap<String, Object>();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dclzManagerDAO.selectDclzMediationListCount(searchCri));
		
		List<DclzMeditationVO> dclzMediationList = dclzManagerDAO.selectManagerDclzMediationList(searchCri);
		
		dataMap.put("dclzMediationList", dclzMediationList);
		dataMap.put("pageMaker", pageMaker);		
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getManagerAnnualList(Criteria cri) throws Exception {
		Criteria searchCri = (Criteria)cri;
		Map<String, Object> dataMap = new HashMap<String, Object>();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dclzManagerDAO.selectAnnualListCount(searchCri));
		
		List<AnnualVO> annualList = dclzManagerDAO.selectAnnualList(searchCri);
		
		dataMap.put("annualList", annualList);
		dataMap.put("pageMaker", pageMaker);		
		
		return dataMap;
	}

	@Override
	public void modifyDclzMediation(DclzMeditationVO dclzmed) throws Exception {
		
		dclzManagerDAO.updateDclz(dclzmed);
		dclzManagerDAO.updateDclzMediation(dclzmed);
		
	}


	@Override
	public void removeDclzMediation(DclzMeditationVO dclzmed) throws Exception {

		dclzManagerDAO.deleteDclzMediation(dclzmed);
		
	}


	


}
