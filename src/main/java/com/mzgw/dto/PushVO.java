package com.mzgw.dto;

import java.util.Date;

public class PushVO {
	private int 	pushNo    ;
	private String 	pushEmp   ;
	private Date 	pushRgdate;
	private String 	pushType  ;
	private String 	pushCn    ;
	private String 	pushUrl   ;
	private int 	pushRead  ;
	public int getPushNo() {
		return pushNo;
	}
	public void setPushNo(int pushNo) {
		this.pushNo = pushNo;
	}
	public String getPushEmp() {
		return pushEmp;
	}
	public void setPushEmp(String pushEmp) {
		this.pushEmp = pushEmp;
	}
	public Date getPushRgdate() {
		return pushRgdate;
	}
	public void setPushRgdate(Date pushRgdate) {
		this.pushRgdate = pushRgdate;
	}
	public String getPushType() {
		return pushType;
	}
	public void setPushType(String pushType) {
		this.pushType = pushType;
	}
	public String getPushCn() {
		return pushCn;
	}
	public void setPushCn(String pushCn) {
		this.pushCn = pushCn;
	}
	public String getPushUrl() {
		return pushUrl;
	}
	public void setPushUrl(String pushUrl) {
		this.pushUrl = pushUrl;
	}
	public int getPushRead() {
		return pushRead;
	}
	public void setPushRead(int pushRead) {
		this.pushRead = pushRead;
	}
	
	
}
