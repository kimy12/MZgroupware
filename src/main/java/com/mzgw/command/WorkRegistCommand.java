package com.mzgw.command;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mzgw.dto.WorkMemVO;
import com.mzgw.dto.WorkVO;

public class WorkRegistCommand {
	
	private int jobCode;
	private String jobNm;
	private String jobCn;
	private Date jobBgnde;
	private Date jobEndde;
	private Date jobUpdde;
	private int jobSttus;
	private int unitNo;
	private String jobWriter;
	private String jobDept;
	private String upEmp;
	private List<String> setleEmpList;

	private List<MultipartFile> uploadFile;
	
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	
	
	public int getJobCode() {
		return jobCode;
	}

	public void setJobCode(int jobCode) {
		this.jobCode = jobCode;
	}

	public String getJobNm() {
		return jobNm;
	}

	public void setJobNm(String jobNm) {
		this.jobNm = jobNm;
	}

	public String getJobCn() {
		return jobCn;
	}

	public void setJobCn(String jobCn) {
		this.jobCn = jobCn;
	}

	public Date getJobBgnde() {
		return jobBgnde;
	}

	public void setJobBgnde(Date jobBgnde) {
		this.jobBgnde = jobBgnde;
	}

	public Date getJobEndde() {
		return jobEndde;
	}

	public void setJobEndde(Date jobEndde) {
		this.jobEndde = jobEndde;
	}

	public Date getJobUpdde() {
		return jobUpdde;
	}

	public void setJobUpdde(Date jobUpdde) {
		this.jobUpdde = jobUpdde;
	}

	public int getJobSttus() {
		return jobSttus;
	}

	public void setJobSttus(int jobSttus) {
		this.jobSttus = jobSttus;
	}

	public int getUnitNo() {
		return unitNo;
	}

	public void setUnitNo(int unitNo) {
		this.unitNo = unitNo;
	}

	public String getJobWriter() {
		return jobWriter;
	}

	public void setJobWriter(String jobWriter) {
		this.jobWriter = jobWriter;
	}

	public String getJobDept() {
		return jobDept;
	}

	public void setJobDept(String jobDept) {
		this.jobDept = jobDept;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

	
	
	public List<String> getSetleEmpList() {
		return setleEmpList;
	}


	public void setSetleEmpList(List<String> setleEmpList) {
		this.setleEmpList = setleEmpList;
	}
	
	public String getUpEmp() {
		return upEmp;
	}


	public void setUpEmp(String upEmp) {
		this.upEmp = upEmp;
	}


	public WorkVO toWorkVO() {
		WorkVO work = new WorkVO();
		
		work.setJobCode(this.jobCode);
		work.setJobNm(this.jobNm);
		work.setJobCn(this.jobCn);
		work.setJobBgnde(this.jobBgnde);
		work.setJobEndde(this.jobEndde);
		work.setJobUpdde(this.jobUpdde);
		work.setJobSttus(this.jobSttus);
		work.setUnitNo(this.unitNo);
		work.setJobWriter(this.jobWriter);
		work.setJobDept(this.jobDept);
		work.setUpEmp(this.upEmp);
		
	
		
		List<WorkMemVO> list = new ArrayList<WorkMemVO>();
		
		
		for(String mem : setleEmpList) {
			WorkMemVO vo = new WorkMemVO();
			vo.setJobMemCode(mem);
			vo.setJobCode(0);
			list.add(vo);
		}
		
		work.setWorkMemList(list);
		
		
		return work;
	}
	
	
}
