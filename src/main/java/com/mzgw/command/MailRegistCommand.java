package com.mzgw.command;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mzgw.dto.MailVO;
import com.mzgw.dto.ReceVO;
import com.mzgw.dto.RefeVO;

public class MailRegistCommand {
	
	
	private String sendEmp;
	private String emailSj;
	private String emailCn;
	private String sendEmpMail;
	private int unityNo;
	private int mailSize;
	private List<MultipartFile> uploadFile;
	
	
	private String empList;
	private String mailList;
	
	private String refList;
	private String refeMailList;
	
	private int tempor;
	
	
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

	public String getSendEmpMail() {
		return sendEmpMail;
	}

	public void setSendEmpMail(String sendEmpMail) {
		this.sendEmpMail = sendEmpMail;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getEmpList() {
		return empList;
	}

	public void setEmpList(String empList) {
		this.empList = empList;
	}

	public String getMailList() {
		return mailList;
	}

	public void setMailList(String mailList) {
		this.mailList = mailList;
	}
	
	public String getRefList() {
		return refList;
	}

	public void setRefList(String refList) {
		this.refList = refList;
	}

	public String getRefeMailList() {
		return refeMailList;
	}

	public void setRefeMailList(String refeMailList) {
		this.refeMailList = refeMailList;
	}
	

	public int getUnityNo() {
		return unityNo;
	}

	public void setUnityNo(int unityNo) {
		this.unityNo = unityNo;
	}
	
	public int getMailSize() {
		return mailSize;
	}

	public void setMailSize(int mailSize) {
		this.mailSize = mailSize;
	}

	public MailVO toMailVO(){
		MailVO mail = new MailVO();
		
		mail.setSendEmp(this.sendEmp);
		mail.setEmailSj(this.emailSj);
		mail.setEmailCn(this.emailCn);
		mail.setSendEmpMail(this.sendEmpMail);
		mail.setUnityNo(this.unityNo);
		mail.setTempor(this.tempor);
		mail.setMailSize(this.mailSize);
		
		return mail;
	}
	
	
	public List<ReceVO> toReceEmpList(){
		
		List<ReceVO> recEmpList = new ArrayList<ReceVO>();
		
		System.out.println(empList + "커맨드 확인");
		
		String[] strArr = empList.split(",");
		String[] mailArr = mailList.split(",");
		
		for(int i =0;i < strArr.length; i++) {
			ReceVO vo = new ReceVO();
			
			vo.setReceEmp(strArr[i]);
			vo.setReceEmail(mailArr[i]);
			
			recEmpList.add(vo);
		}
		
		return recEmpList;
	}
	
	public List<RefeVO> toRefeEmpList(){
		
		List<RefeVO> refEmpList = new ArrayList<RefeVO>();
		
		String[] rfeArr = refList.split(",");
		String[] rfemailArr = refeMailList.split(",");
		
		for(int i =0;i < rfeArr.length; i++) {
			RefeVO vo = new RefeVO();
			
			vo.setRefeEmp(rfeArr[i]);
			vo.setRefeEmail(rfemailArr[i]);
			
			refEmpList.add(vo);
			
		}

		return refEmpList;
	}
	
	
}
