package com.mzgw.dto;

import java.util.Date;

public class BReplyVO {

	private int breply_no;
	private int board_no;
	private int boardtype_no;
	private String empl_no;
	private String writer;
	private String breply_cont;
	private Date breply_regdate;
	private Date breply_mofdate;
	private String dept;
	private String ncnm;
	
	


	public String getNcnm() {
		return ncnm;
	}

	public void setNcnm(String ncnm) {
		this.ncnm = ncnm;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public int getBreply_no() {
		return breply_no;
	}

	public void setBreply_no(int breply_no) {
		this.breply_no = breply_no;
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

	public String getEmpl_no() {
		return empl_no;
	}

	public void setEmpl_no(String empl_no) {
		this.empl_no = empl_no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getBreply_cont() {
		return breply_cont;
	}

	public void setBreply_cont(String breply_cont) {
		this.breply_cont = breply_cont;
	}

	public Date getBreply_regdate() {
		return breply_regdate;
	}

	public void setBreply_regdate(Date breply_regdate) {
		this.breply_regdate = breply_regdate;
	}

	public Date getBreply_mofdate() {
		return breply_mofdate;
	}

	public void setBreply_mofdate(Date breply_mofdate) {
		this.breply_mofdate = breply_mofdate;
	}


}
