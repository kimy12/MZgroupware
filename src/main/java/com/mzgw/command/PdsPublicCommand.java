package com.mzgw.command;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mzgw.dto.PdsPublicVO;
import com.mzgw.dto.RefrnVO;

public class PdsPublicCommand {
	private String e_writer;
	private String e_title;
	private int e_unityatchmnflno;
	private List<MultipartFile> uploadFile;
	
	private String emp_nickname;

	public String getE_writer() {
		return e_writer;
	}

	public void setE_writer(String e_writer) {
		this.e_writer = e_writer;
	}

	public String getE_title() {
		return e_title;
	}

	public void setE_title(String e_title) {
		this.e_title = e_title;
	}

	public int getE_unityatchmnflno() {
		return e_unityatchmnflno;
	}

	public void setE_unityatchmnflno(int e_unityatchmnflno) {
		this.e_unityatchmnflno = e_unityatchmnflno;
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
	
	public PdsPublicVO toPdsPublicVO() {
		PdsPublicVO pdsPublic = new PdsPublicVO();
		pdsPublic.setE_writer(this.e_writer);
		pdsPublic.setE_title(this.e_title);
		pdsPublic.setE_unityatchmnflno(this.e_unityatchmnflno);
		return pdsPublic;
	}
	
}
