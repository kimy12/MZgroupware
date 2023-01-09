package com.mzgw.command;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mzgw.dto.PdsDepVO;
import com.mzgw.dto.RefrnVO;

public class PdsDepCommand {
	private String d_writer;
	private String d_title;
	private int d_unityatchmnflno;
	private String dept;
	private List<MultipartFile> uploadFile;
	
	private String emp_nickname;

	public String getD_writer() {
		return d_writer;
	}

	public void setD_writer(String d_writer) {
		this.d_writer = d_writer;
	}

	public String getD_title() {
		return d_title;
	}

	public void setD_title(String d_title) {
		this.d_title = d_title;
	}

	public int getD_unityatchmnflno() {
		return d_unityatchmnflno;
	}

	public void setD_unityatchmnflno(int d_unityatchmnflno) {
		this.d_unityatchmnflno = d_unityatchmnflno;
	}


	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getEmp_nickname() {
		return emp_nickname;
	}

	public void setEmp_nickname(String emp_nickname) {
		this.emp_nickname = emp_nickname;
	}
	
	public PdsDepVO toPdsDepVO() {
		PdsDepVO pdsDep = new PdsDepVO();
		pdsDep.setD_writer(this.d_writer);
		pdsDep.setD_title(this.d_title);
		pdsDep.setD_unityatchmnflno(this.d_unityatchmnflno);
		pdsDep.setDept(this.dept);
		return pdsDep;
	}
}
