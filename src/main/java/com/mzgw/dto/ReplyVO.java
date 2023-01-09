package com.mzgw.dto;

import java.util.Date;

public class ReplyVO {

	private int reply_no;
	private int board_no;
	private int boardtype_no;
	private int empl_no;
	private String reply_cont;
	private Date reg_date;
	private Date mof_date;

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getBoardtype_no() {
		return boardtype_no;
	}

	public void setBoardtype_no(int boardtype_no) {
		this.boardtype_no = boardtype_no;
	}

	public int getEmpl_no() {
		return empl_no;
	}

	public void setEmpl_no(int empl_no) {
		this.empl_no = empl_no;
	}

	public String getReply_cont() {
		return reply_cont;
	}

	public void setReply_cont(String reply_cont) {
		this.reply_cont = reply_cont;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getMof_date() {
		return mof_date;
	}

	public void setMof_date(Date mof_date) {
		this.mof_date = mof_date;
	}

}
