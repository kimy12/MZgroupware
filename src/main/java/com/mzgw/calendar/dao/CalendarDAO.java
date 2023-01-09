package com.mzgw.calendar.dao;

import java.sql.SQLException;
import java.util.List;

import com.mzgw.dto.CalendarVO;

public interface CalendarDAO {
	
	public List<CalendarVO> selectScheduleList(CalendarVO cal) throws SQLException;
	
	public void insertSchedule(CalendarVO cal) throws SQLException;
	
	public void updateSchedule(CalendarVO cal) throws SQLException;
	
	public void dragUpdateSchedule(CalendarVO cal) throws SQLException;
	
	public void deleteSchedule(int sno) throws SQLException;
}
