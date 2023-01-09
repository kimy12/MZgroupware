package com.mzgw.dto;

import java.sql.Date;
import java.util.List;

public class MailVO implements Comparable<MailVO>{

	private int emailNo;
	private String id;
	private String ncnm;
	private int sendTotal;
	private String sendEmp;
	private String sendName;
	private String receName;
	
	private String emailSj;
	private String emailCn;
	
	private Date writngOn;
	private Date dsptchOn;
	
	private String emailSttus;
	private int unityNo;
	
	private String sendEmpMail;
	private int mailSize;
	private String removeCode;
	private int tempor;
	
	private int gap;
	private String tableCode;
	
	private List<ReceVO> receList;
	public List<ReceVO> getReceList(){
		return receList;
	}
	
    private List<AttachVO> attachList;

    public List<AttachVO> getAttachList() {
      return attachList;
    }

    public void setAttachList(List<AttachVO> attachList) {
      this.attachList = attachList;
    }
	
    public int getEmailNo() {
		return emailNo;
	}

	public void setEmailNo(int emailNo) {
		this.emailNo = emailNo;
	}
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNcnm() {
		return ncnm;
	}

	public void setNcnm(String ncnm) {
		this.ncnm = ncnm;
	}

	public String getSendName() {
		return sendName;
	}

	public void setSendName(String sendName) {
		this.sendName = sendName;
	}

	public String getSendEmp() {
		return sendEmp;
	}

	public void setSendEmp(String sendEmp) {
		this.sendEmp = sendEmp;
	}

	public String getEmailSj() {
		return emailSj;
	}

	public void setEmailSj(String emailSj) {
		this.emailSj = emailSj;
	}

	public String getEmailCn() {
		return emailCn;
	}

	public void setEmailCn(String emailCn) {
		this.emailCn = emailCn;
	}

	public Date getWritngOn() {
		return writngOn;
	}

	public void setWritngOn(Date writngOn) {
		this.writngOn = writngOn;
	}

	public Date getDsptchOn() {
		return dsptchOn;
	}

	public void setDsptchOn(Date dsptchOn) {
		this.dsptchOn = dsptchOn;
	}

	public String getEmailSttus() {
		return emailSttus;
	}

	public void setEmailSttus(String emailSttus) {
		this.emailSttus = emailSttus;
	}

	public int getUnityNo() {
		return unityNo;
	}

	public void setUnityNo(int unityNo) {
		this.unityNo = unityNo;
	}

	public String getSendEmpMail() {
		return sendEmpMail;
	}

	public void setSendEmpMail(String sendEmpMail) {
		this.sendEmpMail = sendEmpMail;
	}

	public int getMailSize() {
		return mailSize;
	}

	public void setMailSize(int mailSize) {
		this.mailSize = mailSize;
	}

	public String getRemoveCode() {
		return removeCode;
	}

	public void setRemoveCode(String removeCode) {
		this.removeCode = removeCode;
	}

	public int getTempor() {
		return tempor;
	}

	public void setTempor(int tempor) {
		this.tempor = tempor;
	}

	public String getReceName() {
		return receName;
	}

	public void setReceName(String receName) {
		this.receName = receName;
	}
	
	public int getGap() {
		return gap;
	}

	public void setGap(int gap) {
		this.gap = gap;
	}
	
	public int getSendTotal() {
		return sendTotal;
	}

	public void setSendTotal(int sendTotal) {
		this.sendTotal = sendTotal;
	}

	@Override
	public int compareTo(MailVO o) {
		return o.getEmailNo() - getEmailNo();
	}

	public String getTableCode() {
		return tableCode;
	}

	public void setTableCode(String tableCode) {
		this.tableCode = tableCode;
	}

	

	
	
	
}
