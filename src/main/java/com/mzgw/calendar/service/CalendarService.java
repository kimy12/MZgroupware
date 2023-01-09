package com.mzgw.calendar.service;

import java.util.List;

import com.mzgw.dto.CalendarVO;

public interface CalendarService {
	
	public List<CalendarVO> getScheduleList(CalendarVO cal) throws Exception;
	
	public void registSchedule(CalendarVO cal) throws Exception;
	
	public void modifySchedule(CalendarVO cal) throws Exception;
	
	public void dragModifySchedule(CalendarVO cal) throws Exception;
	
	public void removeSchedule(int sno) throws Exception;

}
