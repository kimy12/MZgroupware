package com.mzgw.dto;

import java.util.Date;

public class SetleEvlVO {
	private int 	evlNo  ;
	private int 	setleNo;
	private String 	emplNo ;
	private String 	evlCn  ;
	private int 	evlLv  ;
	private int 	evlTy  ;
	private Date	evlRegdate;
	private String  empNcnm;
	private String  setleNcnm;
	
	
	
	
	
	public String getSetleNcnm() {
		return setleNcnm;
	}
	public void setSetleNcnm(String setleNcnm) {
		this.setleNcnm = setleNcnm;
	}
	public String getEmpNcnm() {
		return empNcnm;
	}
	public void setEmpNcnm(String empNcnm) {
		this.empNcnm = empNcnm;
	}
	public String getEvlCn() {
		return evlCn;
	}
	public void setEvlCn(String evlCn) {
		this.evlCn = evlCn;
	}
	public int getSetleNo() {
		return setleNo;
	}
	public void setSetleNo(int setleNo) {
		this.setleNo = setleNo;
	}
	public Date getEvlRegdate() {
		return evlRegdate;
	}
	public void setEvlRegdate(Date evlRegdate) {
		this.evlRegdate = evlRegdate;
	}
	public int getEvlNo() {
		return evlNo;
	}
	public void setEvlNo(int evlNo) {
		this.evlNo = evlNo;
	}
	
	public String getEmplNo() {
		return emplNo;
	}
	public void setEmplNo(String emplNo) {
		this.emplNo = emplNo;
	}

	public int getEvlLv() {
		return evlLv;
	}
	public void setEvlLv(int evlLv) {
		this.evlLv = evlLv;
	}
	public int getEvlTy() {
		return evlTy;
	}
	public void setEvlTy(int evlTy) {
		this.evlTy = evlTy;
	}
	
	
}
