package com.mzgw.dto;

import java.util.Date;
import java.util.List;

public class SetleVO {

	private int 	setleNo    ;
	private String 	setleSj    ;
	private String 	setleCn    ;
	private String  setleWriter;
	private String  writerDepart;
	private Date 	writngOn   ;
	private Date	aplctDate;
	private Date 	agrStartDate;
	private Date 	agrEndDate;
	private Date 	evlStartDate;
	private Date 	evlEndDate;
	private int 	sttusNo    ;
	private int 	setleAttach;
	private int 	setleFormNo;
	private String	formInputs  ;
	private String  lastSetleEmp;
	private String	deletleOn;
	
	
	
	public String getDeletleOn() {
		return deletleOn;
	}
	public void setDeletleOn(String deletleOn) {
		this.deletleOn = deletleOn;
	}
	private AttachVO writedFormFile;
	private SetleFormVO setleForm;
	private List<AttachVO> setleAttachList;
	private List<SetleEmpVO> setleEmpList;
	private EmpVO   writerEmpVO;
	private EmpVO   lastSetleEmpVO;
	
	
	
	
	
	
	public EmpVO getWriterEmpVO() {
		return writerEmpVO;
	}
	public void setWriterEmpVO(EmpVO writerEmpVO) {
		this.writerEmpVO = writerEmpVO;
	}
	public EmpVO getLastSetleEmpVO() {
		return lastSetleEmpVO;
	}
	public void setLastSetleEmpVO(EmpVO lastSetleEmpVO) {
		this.lastSetleEmpVO = lastSetleEmpVO;
	}
	public String getLastSetleEmp() {
		return lastSetleEmp;
	}
	public void setLastSetleEmp(String lastSetleEmp) {
		this.lastSetleEmp = lastSetleEmp;
	}
	public Date getAplctDate() {
		return aplctDate;
	}
	public void setAplctDate(Date aplctDate) {
		this.aplctDate = aplctDate;
	}
	public int getSetleNo() {
		return setleNo;
	}
	public void setSetleNo(int setleNo) {
		this.setleNo = setleNo;
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
	public String getSetleWriter() {
		return setleWriter;
	}
	public void setSetleWriter(String setleWriter) {
		this.setleWriter = setleWriter;
	}
	public String getWriterDepart() {
		return writerDepart;
	}
	public void setWriterDepart(String writerDepart) {
		this.writerDepart = writerDepart;
	}
	public Date getWritngOn() {
		return writngOn;
	}
	public void setWritngOn(Date writngOn) {
		this.writngOn = writngOn;
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
	public int getSttusNo() {
		return sttusNo;
	}
	public void setSttusNo(int sttusNo) {
		this.sttusNo = sttusNo;
	}
	public int getSetleAttach() {
		return setleAttach;
	}
	public void setSetleAttach(int setleAttach) {
		this.setleAttach = setleAttach;
	}
	public int getSetleFormNo() {
		return setleFormNo;
	}
	public void setSetleFormNo(int setleFormNo) {
		this.setleFormNo = setleFormNo;
	}
	public String getFormInputs() {
		return formInputs;
	}
	public void setFormInputs(String formInputs) {
		this.formInputs = formInputs;
	}
	public AttachVO getWritedFormFile() {
		return writedFormFile;
	}
	public void setWritedFormFile(AttachVO writedFormFile) {
		this.writedFormFile = writedFormFile;
	}
	public SetleFormVO getSetleForm() {
		return setleForm;
	}
	public void setSetleForm(SetleFormVO setleForm) {
		this.setleForm = setleForm;
	}
	public List<AttachVO> getSetleAttachList() {
		return setleAttachList;
	}
	public void setSetleAttachList(List<AttachVO> setleAttachList) {
		this.setleAttachList = setleAttachList;
	}
	public List<SetleEmpVO> getSetleEmpList() {
		return setleEmpList;
	}
	public void setSetleEmpList(List<SetleEmpVO> setleEmpList) {
		this.setleEmpList = setleEmpList;
	}
	
	
	
	
	

	
	
	
}
