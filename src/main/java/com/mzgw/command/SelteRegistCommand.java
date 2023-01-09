package com.mzgw.command;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.mzgw.dto.SetleVO;

public class SelteRegistCommand {
	
	
	private String setleSj;
	private String setleCn;
	private String setleWriter;
	private String  writerDepart;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date agrStartDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date agrEndDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date evlStartDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date evlEndDate;
	private int setleFormNo;
	private int sttusNo;
	private String formInputs;
	private List<String> setleEmpList;
	
	private List<MultipartFile> uploadFile;
	
	
	
	
	
	
	
	
	
	public int getSttusNo() {
		return sttusNo;
	}
	public void setSttusNo(int sttusNo) {
		this.sttusNo = sttusNo;
	}
	public String getWriterDepart() {
		return writerDepart;
	}
	public void setWriterDepart(String writerDepart) {
		this.writerDepart = writerDepart;
	}
	public String getSetleWriter() {
		return setleWriter;
	}
	public void setSetleWriter(String setleWriter) {
		this.setleWriter = setleWriter;
	}
	public String getFormInputs() {
		return formInputs;
	}
	public void setFormInputs(String formInputs) {
		this.formInputs = formInputs;
	}
	
	public List<String> getSetleEmpList() {
		return setleEmpList;
	}
	public void setSetleEmpList(List<String> setleEmpList) {
		this.setleEmpList = setleEmpList;
	}
	public List<MultipartFile> getUploadFile() {
		
		
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getSetleSj() {
		return setleSj;
	}
	public void setSetleSj(String setleSj) {
		this.setleSj = setleSj;
	}
	public String getSetleCn() {
		return setleCn;
	}
	public void setSetleCn(String setleCn) {
		this.setleCn = setleCn;
	}
	public Date getAgrStartDate() {
		return agrStartDate;
	}
	public void setAgrStartDate(Date agrStartDate) {
		this.agrStartDate = agrStartDate;
	}
	public Date getAgrEndDate() {
		return agrEndDate;
	}
	public void setAgrEndDate(Date agrEndDate) {
		this.agrEndDate = agrEndDate;
	}
	public Date getEvlStartDate() {
		return evlStartDate;
	}
	public void setEvlStartDate(Date evlStartDate) {
		this.evlStartDate = evlStartDate;
	}
	public Date getEvlEndDate() {
		return evlEndDate;
	}
	public void setEvlEndDate(Date evlEndDate) {
		this.evlEndDate = evlEndDate;
	}
	public int getSetleFormNo() {
		return setleFormNo;
	}
	public void setSetleFormNo(int setleFormNo) {
		this.setleFormNo = setleFormNo;
	}
	

	public SetleVO toSetleVO() {
		SetleVO vo = new SetleVO();
		
		vo.setSetleSj(setleSj);
		vo.setSetleCn(setleCn);
		vo.setFormInputs(formInputs);
		vo.setWritngOn(new Date());
		vo.setSetleWriter(setleWriter);
		vo.setSetleFormNo(setleFormNo);
		vo.setAgrStartDate(agrStartDate);
		vo.setAgrEndDate(agrEndDate);
		vo.setEvlStartDate(evlStartDate);
		vo.setEvlEndDate(evlEndDate);
		vo.setWriterDepart(writerDepart);
		vo.setSttusNo(sttusNo);
		
		
		
		return vo;
	}
	
	
}
