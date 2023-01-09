package com.mzgw.dto;

import java.util.Date;

public class WorkReplyVO {
	
	private int job_reply_no;
	private int job_code;
	private String job_reply_cont;
	private String empl_no;
	private Date job_reply_rgdt;
	private String ncnm;
	private String dept;
	
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
	public int getJob_reply_no() {
		return job_reply_no;
	}
	public void setJob_reply_no(int job_reply_no) {
		this.job_reply_no = job_reply_no;
	}
	public int getJob_code() {
		return job_code;
	}
	public void setJob_code(int job_code) {
		this.job_code = job_code;
	}
	public String getJob_reply_cont() {
		return job_reply_cont;
	}
	public void setJob_reply_cont(String job_reply_cont) {
		this.job_reply_cont = job_reply_cont;
	}
	public String getEmpl_no() {
		return empl_no;
	}
	public void setEmpl_no(String empl_no) {
		this.empl_no = empl_no;
	}
	public Date getJob_reply_rgdt() {
		return job_reply_rgdt;
	}
	public void setJob_reply_rgdt(Date job_reply_rgdt) {
		this.job_reply_rgdt = job_reply_rgdt;
	}
	
	
	
	

}
