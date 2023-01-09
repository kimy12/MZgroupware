package com.mzgw.dto;

public class CalendarVO {
	
	private int sno;
	private String title;
	private String startd;
	private String end;
	private String type;
	private String textColor;
	private String backgroundColor;
	private String username;
	private String description;
	private String dept;
	private int allday;
	
	
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}

	public int getAllday() {
		return allday;
	}
	public void setAllday(int allday) {
		this.allday = allday;
	}
	public String getStart() {
		return startd;
	}
	public void setStart(String startd) {
		this.startd = startd;
	}
	
	public String getStartd() {
		return startd;
	}
	public void setStartd(String startd) {
		this.startd = startd;
	}
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	

}
