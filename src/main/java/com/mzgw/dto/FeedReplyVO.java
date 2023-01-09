package com.mzgw.dto;

import java.sql.Date;

public class FeedReplyVO {

	private int replyType;
	private int replyNo;
	private String replyEmp;
	private String replyText;
	private Date replyDate;
	private String replyName;
	private String feedEmp;
	
	public int getReplyNo() {
		return replyNo;
	}
	
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	
	public String getReplyEmp() {
		return replyEmp;
	}
	
	public void setReplyEmp(String replyEmp) {
		this.replyEmp = replyEmp;
	}
	
	public String getReplyText() {
		return replyText;
	}
	
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	
	public Date getReplyDate() {
		return replyDate;
	}
	
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public String getReplyName() {
		return replyName;
	}

	public void setReplyName(String replyName) {
		this.replyName = replyName;
	}

	public String getFeedEmp() {
		return feedEmp;
	}

	public void setFeedEmp(String feedEmp) {
		this.feedEmp = feedEmp;
	}

	public int getReplyType() {
		return replyType;
	}

	public void setReplyType(int replyType) {
		this.replyType = replyType;
	}
	
	
	
}
