package com.mzgw.calendar.service;

import java.util.List;

import com.mzgw.calendar.dao.CalendarDAO;
import com.mzgw.dto.CalendarVO;

public class CalendarServiceImpl implements CalendarService {
	
	private CalendarDAO calendarDAO;
	public void setCalendarDAO(CalendarDAO calendarDAO) {
		this.calendarDAO = calendarDAO;
	}

	@Override
	public void registSchedule(CalendarVO cal) throws Exception {
		
		calendarDAO.insertSchedule(cal);
	}

	@Override
	public List<CalendarVO> getScheduleList(CalendarVO cal) throws Exception {
		List<CalendarVO> scheduleList = calendarDAO.selectScheduleList(cal);
		
		return scheduleList;
	}

	@Override
	public void modifySchedule(CalendarVO cal) throws Exception {
		
		calendarDAO.updateSchedule(cal);
	}

	@Override
	public void removeSchedule(int sno) throws Exception {
		calendarDAO.deleteSchedule(sno);
		
	}

	@Override
	public void dragModifySchedule(CalendarVO cal) throws Exception {
		calendarDAO.dragUpdateSchedule(cal);
		
	}

	
}
