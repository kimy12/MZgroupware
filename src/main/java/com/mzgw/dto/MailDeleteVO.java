package com.mzgw.dto;

public class MailDeleteVO {
	
	private int[] removeCkArr;
	private int[] removeTable;
	
	private int emailNo;
	private String sendEmp;
	private String receEmp;
	
	private String tableCode;
	
	public int[] getRemoveCkArr() {
		return removeCkArr;
	}
	
	public void setRemoveCkArr(int[] removeCkArr) {
		this.removeCkArr = removeCkArr;
	}
	
	public int[] getRemoveTable() {
		return removeTable;
	}
	
	public void setRemoveTable(int[] removeTable) {
		this.removeTable = removeTable;
	}

	public String getTableCode() {
		return tableCode;
	}

	public void setTableCode(String tableCode) {
		this.tableCode = tableCode;
	}

	public int getEmailNo() {
		return emailNo;
	}

	public void setEmailNo(int emailNo) {
		this.emailNo = emailNo;
	}

	public String getSendEmp() {
		return sendEmp;
	}

	public void setSendEmp(String sendEmp) {
		this.sendEmp = sendEmp;
	}

	public String getReceEmp() {
		return receEmp;
	}

	public void setReceEmp(String receEmp) {
		this.receEmp = receEmp;
	}

	
	
	
	
}
