package com.mzgw.dto;

import java.util.Date;
import java.util.List;

public class PdsPrivateVO {
	private String m_writer;
	private Date m_regdate;
	private int m_unityatchmnflno;
	private String m_del;
	private Date m_updatedate;
	private String m_title;
	private int refrn_unity_no;
	
	private List<AttachVO> attachList;
	
	private List<RefrnVO> refrnList;
	
	
	
	public List<RefrnVO> getRefrnList() {
		return refrnList;
	}

	public void setRefrnList(List<RefrnVO> refrnList) {
		this.refrnList = refrnList;
	}

	public int getRefrn_unity_no() {
		return refrn_unity_no;
	}

	public void setRefrn_unity_no(int refrn_unity_no) {
		this.refrn_unity_no = refrn_unity_no;
	}

	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}

	public List<AttachVO> getAttachList() {
	      return attachList;
	    }
	
	public String getM_writer() {
		return m_writer;
	}
	public void setM_writer(String m_writer) {
		this.m_writer = m_writer;
	}
	public Date getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	public int getM_unityatchmnflno() {
		return m_unityatchmnflno;
	}
	public void setM_unityatchmnflno(int m_unityatchmnflno) {
		this.m_unityatchmnflno = m_unityatchmnflno;
	}
	public String getM_del() {
		return m_del;
	}
	public void setM_del(String m_del) {
		this.m_del = m_del;
	}
	public Date getM_updatedate() {
		return m_updatedate;
	}
	public void setM_updatedate(Date m_updatedate) {
		this.m_updatedate = m_updatedate;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	
	
	
}
