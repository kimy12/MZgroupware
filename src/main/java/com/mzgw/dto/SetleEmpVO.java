package com.mzgw.dto;

public class SetleEmpVO {

	private int	 		setleNo  ;
	private String  	emplNo   ;
	private int  		agrSttus ;
	private String  	cotent   ="";
	private String		empNm	 ;
	private String		empSign  ;
	
	
	
	
	public String getEmpSign() {
		return empSign;
	}
	public void setEmpSign(String empSign) {
		this.empSign = empSign;
	}
	public String getEmpNm() {
		return empNm;
	}
	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}
	public int getSetleNo() {
		return setleNo;
	}
	public void setSetleNo(int setleNo) {
		this.setleNo = setleNo;
	}
	public String getEmplNo() {
		return emplNo;
	}
	public void setEmplNo(String emplNo) {
		this.emplNo = emplNo;
	}
	public int getAgrSttus() {
		return agrSttus;
	}
	public void setAgrSttus(int agrSttus) {
		this.agrSttus = agrSttus;
	}
	public String getCotent() {
		return cotent;
	}
	public void setCotent(String cotent) {
		this.cotent = cotent;
	}
	 
	 
	
}
