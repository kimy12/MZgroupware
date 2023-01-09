package com.mzgw.dto;

import java.util.Date;
import java.util.List;

public class PdsPublicVO {
	
	private String e_writer;
	private Date e_regdate;
	private int e_unityatchmnflno;
	private Date e_updatedate;
	private String e_title;
	
	private List<AttachVO> attachList;
	
	
	
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	public String getE_writer() {
		return e_writer;
	}
	public void setE_writer(String e_writer) {
		this.e_writer = e_writer;
	}
	public Date getE_regdate() {
		return e_regdate;
	}
	public void setE_regdate(Date e_regdate) {
		this.e_regdate = e_regdate;
	}
	public int getE_unityatchmnflno() {
		return e_unityatchmnflno;
	}
	public void setE_unityatchmnflno(int e_unityatchmnflno) {
		this.e_unityatchmnflno = e_unityatchmnflno;
	}
	public Date getE_updatedate() {
		return e_updatedate;
	}
	public void setE_updatedate(Date e_updatedate) {
		this.e_updatedate = e_updatedate;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	
	
}
