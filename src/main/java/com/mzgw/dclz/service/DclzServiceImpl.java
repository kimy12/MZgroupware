package com.mzgw.dclz.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.mzgw.dclz.dao.DclzDAO;
import com.mzgw.dto.DclzMeditationVO;
import com.mzgw.dto.DclzVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;

public class DclzServiceImpl implements DclzService{
	
	private DclzDAO dclzDAO;
	public void setDclzDAO(DclzDAO dclzDAO) {
		this.dclzDAO = dclzDAO;
	}
	
	public String getCurMonday() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");

 		Calendar c = Calendar.getInstance();
 		c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);	
 		String monday = formatter.format(c.getTime());
 		
		return monday;
	}
	
	public String getCurFriday() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");	
		
		Calendar c = Calendar.getInstance();		
		c.set(Calendar.DAY_OF_WEEK,Calendar.FRIDAY);	
		String friday = formatter.format(c.getTime());
		
		return friday;
	}
	
	public String getLastDayOfMonth() {
		String date = getCurMonday();
		
		String year = date.substring(0,4); 
 		String month = date.substring(5,7);
 		Calendar cal = Calendar.getInstance(); 
 		cal.set(Integer.parseInt(year),Integer.parseInt(month)-1,1); 
 		String lastDay = year+month+Integer.toString(cal.getActualMaximum(Calendar.DAY_OF_MONTH));
 		
 		return lastDay;		
	}
	
	public String getFirstDayOfMonth() {
		String date = getCurMonday();
		
		String year = date.substring(0,4); 
		String month = date.substring(5,7);
		Calendar cal = Calendar.getInstance(); 
		cal.set(Integer.parseInt(year),Integer.parseInt(month)-1,1); 
		
		return year+month+"01";		
	}
	
	@Override
	public SXSSFWorkbook makeExcel(List<DclzVO> list, String sheetName) throws Exception {
		SXSSFWorkbook workbook = new SXSSFWorkbook();
		SXSSFSheet sheet = workbook.createSheet(sheetName);
        
        //시트 열 너비 설정		
		sheet.setColumnWidth(0, 1500);			
		sheet.setColumnWidth(0, 5000);			
		sheet.setColumnWidth(0, 3000);			
		sheet.setColumnWidth(0, 3000);			
		sheet.setColumnWidth(0, 5000);			
		
        
        // 헤더 행 생성
        Row headerRow = sheet.createRow(0);        
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue("번호");
        
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("근무일자");
        
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("출근시간");
        
        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("퇴근시간");
        
        headerCell = headerRow.createCell(4);
        headerCell.setCellValue("총 근무시간");
        
        Row bodyRow = null;
        Cell bodyCell = null;
        for(int i=0; i<list.size(); i++) {
            DclzVO dclz = list.get(i); 
            // 행 생성
            bodyRow = sheet.createRow(i+1);
            
            bodyCell = bodyRow.createCell(0);
            bodyCell.setCellValue(i + 1);
            
            bodyCell = bodyRow.createCell(1);
            bodyCell.setCellValue(dclz.getWorkOn());
            
            bodyCell = bodyRow.createCell(2);
            bodyCell.setCellValue(dclz.getBeginTime());
            
            bodyCell = bodyRow.createCell(3);
            bodyCell.setCellValue(dclz.getEndTime());
            
            bodyCell = bodyRow.createCell(4);
            bodyCell.setCellValue(dclz.getWorkTime());
        }
        
        return workbook;
	}
	

	@Override
	public List<DclzVO> getDclzList() throws Exception {
		List<DclzVO> DclzList = dclzDAO.selectDclzList();
		return DclzList;
	}

	@Override
	public DclzVO getTodayWorkTime(String empl_no) throws Exception {
		
		return dclzDAO.selectWorkTime(empl_no);
	}
	
	@Override
	public void regWorkTime(DclzVO dclz) throws Exception {
		
		dclzDAO.insertWorkTime(dclz);
	}

	@Override
	public void modWorkEndTime(DclzVO dclz) throws Exception {
		
		dclzDAO.updateWorkEndTime(dclz);
		
	}
	
	@Override
	public List<DclzVO> getWeekTotalTime(List<DclzVO> weekList) throws Exception {
		
		List<DclzVO> week = new ArrayList<>();
		int i = 1;
		
		for(DclzVO dz : weekList) {
			DclzVO dclz = new DclzVO();

			dclz.setWeekStartDate(dz.getWeekStartDate());
			dclz.setWeekEndDate(dz.getWeekEndDate());
			dclz.setEmpl_no(dz.getEmpl_no());						
			dclz.setExcessTime(dclzDAO.selectWeekTotalTime(dclz).getExcessTime());				
			dclz.setTotalWorkTime(dclzDAO.selectWeekTotalTime(dclz).getTotalWorkTime());
			dclz.setNum(i++);
					
			week.add(dclz);
		}
	
		return week;
	}

	@Override
	public List<DclzVO> getWeekWorkList(DclzVO dclz) throws Exception {
		List<DclzVO> weekList = dclzDAO.selectWeekWorkTime(dclz);
		
		return weekList;
	}

	@Override
	public Map<String, String> getThisWeekAndMonthTime(String empl_no) throws Exception {
		DclzVO dclz = new DclzVO();
		Map<String, String> dataMap = new HashMap<>();
			
		dclz.setEmpl_no(empl_no);
		dclz.setWeekStartDate(getCurMonday());
		dclz.setWeekEndDate(getCurFriday());
		dataMap.put("thisWeekTime", dclzDAO.selectThisMonthTime(dclz));
			
		dclz.setWeekStartDate(getFirstDayOfMonth());
		dclz.setWeekEndDate(getLastDayOfMonth());
		dataMap.put("thisMonthTime", dclzDAO.selectThisMonthTime(dclz));
		
		return dataMap;
	}
	
	@Override
	public void regWorkMediation(DclzMeditationVO dclzmed) throws Exception {
		
		dclzDAO.insertWorkMediation(dclzmed);
		
	}

	@Override
	public List<DclzMeditationVO> getDclzMediationList(EmpVO emp) throws Exception {
		List<DclzMeditationVO> dclzMediationList = dclzDAO.selectDclzMediationList(emp);
		
		return dclzMediationList;
	}

	@Override
	public List<DclzVO> getEmpMonthDclzList(DclzVO dclz) throws Exception {
		dclz.setWeekStartDate(getFirstDayOfMonth());
		dclz.setWeekEndDate(getLastDayOfMonth());
		
		List<DclzVO> weekList = dclzDAO.selectEmpExcelWorkTime(dclz);
		
		return weekList;
	}

	@Override
	public Map<String, Object> getAnnualList(Criteria cri, EmpVO emp) throws Exception {
		
		Map<String,Object> dataMap = dclzDAO.selectAnnualList(cri, emp);
		
		return dataMap;
	}

	

	
	


}
