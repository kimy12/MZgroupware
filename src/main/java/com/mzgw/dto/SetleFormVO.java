package com.mzgw.dto;

public class SetleFormVO {
	private int 	setleFormNo;
	private String 	formNm     ;
	private String 	formCn     ;
	private int 	formFile   ;
	private String  formFileString;
	
	private AttachVO attachForm;
	
	
	

	public String getFormFileString() {
		return formFileString;
	}

	public void setFormFileString(String formFileString) {
		this.formFileString = formFileString;
	}

	public int getSetleFormNo() {
		return setleFormNo;
	}

	public void setSetleFormNo(int setleFormNo) {
		this.setleFormNo = setleFormNo;
	}

	public String getFormNm() {
		return formNm;
	}

	public void setFormNm(String formNm) {
		this.formNm = formNm;
	}

	public String getFormCn() {
		return formCn;
	}

	public void setFormCn(String formCn) {
		this.formCn = formCn;
	}

	public int getFormFile() {
		return formFile;
	}

	public void setFormFile(int formFile) {
		this.formFile = formFile;
	}

	public AttachVO getAttachForm() {
		return attachForm;
	}

	public void setAttachForm(AttachVO attachForm) {
		this.attachForm = attachForm;
	}
	
	
}
