package com.mzgw.calendar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mzgw.calendar.service.CalendarService;
import com.mzgw.dto.CalendarVO;

@Controller
@RequestMapping("/schedule")
public class CalendarController {
	
	@Autowired
	private CalendarService calService;
	
	@GetMapping("calendar")
	public void calendar() {}
	
	@RequestMapping("/registSchedule")
	@ResponseBody
	public ResponseEntity<String> registSchedule(@RequestBody CalendarVO cal) throws Exception{
		ResponseEntity<String> entity = null;
		
		calService.registSchedule(cal);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/getCalendar")
	@ResponseBody
	public ResponseEntity<List<CalendarVO>> getCalendar(@RequestBody CalendarVO cal) throws Exception{
		ResponseEntity<List<CalendarVO>> entity = null;
		
		List<CalendarVO> scheduleList = calService.getScheduleList(cal);
		
		entity = new ResponseEntity<List<CalendarVO>>(scheduleList, HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/modifySchedule")
	@ResponseBody
	public ResponseEntity<String> modifyCalendar(@RequestBody CalendarVO cal) throws Exception{
		ResponseEntity<String> entity = null;
		
		calService.modifySchedule(cal);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/dragModify")
	@ResponseBody
	public ResponseEntity<String> dragModify(CalendarVO cal) throws Exception{
		ResponseEntity<String> entity = null;
		
		calService.dragModifySchedule(cal);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/resizeModify")
	@ResponseBody
	public ResponseEntity<String> resizeModify(CalendarVO cal) throws Exception{
		ResponseEntity<String> entity = null;
		
		calService.dragModifySchedule(cal);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/removeSchedule")
	@ResponseBody
	public ResponseEntity<String> removeSchedule(int sno) throws Exception{
		ResponseEntity<String> entity = null;
		
		calService.removeSchedule(sno);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
}
