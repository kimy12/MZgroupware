package com.mzgw.dto;

import java.util.Date;

public class ClubBoardReplyVO {

	private int clubreply_no;
	private int clubboard_no;
	private int clubboardtype_no;
	private String clubboard_cont;
	private String empl_no;
	private Date clubreply_rgdt;
	private Date clubreply_upddt;
	private String writer;
	private String dept;
	private String ncnm;
	
	
	
	
	public String getNcnm() {
		return ncnm;
	}
	public void setNcnm(String ncnm) {
		this.ncnm = ncnm;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getClubreply_no() {
		return clubreply_no;
	}
	public void setClubreply_no(int clubreply_no) {
		this.clubreply_no = clubreply_no;
	}
	public int getClubboard_no() {
		return clubboard_no;
	}
	public void setClubboard_no(int clubboard_no) {
		this.clubboard_no = clubboard_no;
	}
	public int getClubboardtype_no() {
		return clubboardtype_no;
	}
	public void setClubboardtype_no(int clubboardtype_no) {
		this.clubboardtype_no = clubboardtype_no;
	}
	public String getClubboard_cont() {
		return clubboard_cont;
	}
	public void setClubboard_cont(String clubboard_cont) {
		this.clubboard_cont = clubboard_cont;
	}
	public String getEmpl_no() {
		return empl_no;
	}
	public void setEmpl_no(String empl_no) {
		this.empl_no = empl_no;
	}
	public Date getClubreply_rgdt() {
		return clubreply_rgdt;
	}
	public void setClubreply_rgdt(Date clubreply_rgdt) {
		this.clubreply_rgdt = clubreply_rgdt;
	}
	public Date getClubreply_upddt() {
		return clubreply_upddt;
	}
	public void setClubreply_upddt(Date clubreply_upddt) {
		this.clubreply_upddt = clubreply_upddt;
	}
	
	
	
}
