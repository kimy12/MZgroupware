package com.mzgw.calendar.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.CalendarVO;

public class CalendarDAOImpl implements CalendarDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertSchedule(CalendarVO cal) throws SQLException {
		
		session.update("Calendar-Mapper.insertSchedule",cal);
	}

	@Override
	public List<CalendarVO> selectScheduleList(CalendarVO cal) throws SQLException {
		
		return session.selectList("Calendar-Mapper.selectScheduleList",cal);
	}

	@Override
	public void updateSchedule(CalendarVO cal) throws SQLException {
		session.update("Calendar-Mapper.updateSchedule",cal);
	}

	@Override
	public void deleteSchedule(int sno) throws SQLException {
		session.update("Calendar-Mapper.deleteSchedule",sno);
		
	}

	@Override
	public void dragUpdateSchedule(CalendarVO cal) throws SQLException {
		session.update("Calendar-Mapper.dragUpdateSchedule",cal);
		
	}

}
