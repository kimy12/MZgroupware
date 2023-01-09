package com.mzgw.dto;

import java.util.Date;
import java.util.List;

public class PdsDepVO {
	private String d_writer;
	private Date d_regdate;
	private int d_unityatchmnflno;
	private Date d_updatedate;
	private String d_title;
	private String dept;
	
	private List<AttachVO> attachList;
	
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	public String getD_writer() {
		return d_writer;
	}
	public void setD_writer(String d_writer) {
		this.d_writer = d_writer;
	}
	public Date getD_regdate() {
		return d_regdate;
	}
	public void setD_regdate(Date d_regdate) {
		this.d_regdate = d_regdate;
	}
	public int getD_unityatchmnflno() {
		return d_unityatchmnflno;
	}
	public void setD_unityatchmnflno(int d_unityatchmnflno) {
		this.d_unityatchmnflno = d_unityatchmnflno;
	}
	public Date getD_updatedate() {
		return d_updatedate;
	}
	public void setD_updatedate(Date d_updatedate) {
		this.d_updatedate = d_updatedate;
	}
	public String getD_title() {
		return d_title;
	}
	public void setD_title(String d_title) {
		this.d_title = d_title;
	}
	
}
