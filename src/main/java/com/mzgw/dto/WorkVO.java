package com.mzgw.dto;

import java.sql.Date;
import java.util.List;

public class WorkVO {

	private int jobCode;
	private String jobNm;
	private String jobCn;
	private Date jobBgnde;
	private Date jobEndde;
	private Date jobUpdde;
	private Date jobRedde;
	private int jobSttus;
	private int unitNo;
	private String jobWriter;
	private String jobDept;
	private String empId;
	private String empName;
	private String empDept;
	private String empRank;
	private String upEmp;
	private String empNcnm;
	
	private List<AttachVO> attachList;
	private List<WorkMemVO> workMemList;


    public List<AttachVO> getAttachList() {
      return attachList;
    }
    
    public void setAttachList(List<AttachVO> attachList) {
        this.attachList = attachList;
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

	public String getJobWriter() {
		return jobWriter;
	}

	public void setJobWriter(String jobWriter) {
		this.jobWriter = jobWriter;
	}

	public int getUnitNo() {
		return unitNo;
	}

	public void setUnitNo(int unitNo) {
		this.unitNo = unitNo;
	}

	public String getJobDept() {
		return jobDept;
	}

	public void setJobDept(String jobDept) {
		this.jobDept = jobDept;
	}

	public List<WorkMemVO> getWorkMemList() {
		return workMemList;
	}

	public void setWorkMemList(List<WorkMemVO> workMemList) {
		this.workMemList = workMemList;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpDept() {
		return empDept;
	}

	public void setEmpDept(String empDept) {
		this.empDept = empDept;
	}

	public String getEmpRank() {
		return empRank;
	}

	public void setEmpRank(String empRank) {
		this.empRank = empRank;
	}

	public Date getJobRedde() {
		return jobRedde;
	}

	public void setJobRedde(Date jobRedde) {
		this.jobRedde = jobRedde;
	}

	public String getUpEmp() {
		return upEmp;
	}

	public void setUpEmp(String upEmp) {
		this.upEmp = upEmp;
	}

	public String getEmpNcnm() {
		return empNcnm;
	}

	public void setEmpNcnm(String empNcnm) {
		this.empNcnm = empNcnm;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	
	
	
	
	
	
	
	
	
	
	
}
