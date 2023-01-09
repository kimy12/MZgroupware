package com.mzgw.dto;

import java.util.Date;

public class BoardTypeVO {
	private int boardtype_no;
	private int opened;
	private String boardName;
	private String maker;
	private Date regdate;
	
	public int getBoardtype_no() {
		return boardtype_no;
	}
	public void setBoardtype_no(int boardtype_no) {
		this.boardtype_no = boardtype_no;
	}
	public int getOpened() {
		return opened;
	}
	public void setOpened(int opened) {
		this.opened = opened;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
