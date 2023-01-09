package com.mzgw.dto;

import java.sql.Date;

public class AttachVO {
	
	private int unityatchmnflno;
	private int ano;
	private String originalname;
	private String fileName;
	private String uploadPath;
	private String fileType;
	private Date regdate;	
	private int filesize;
	private String del;
	
	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	private String fav = "";
	
	public String getFav() {
		return fav;
	}

	public void setFav(String fav) {
		this.fav = fav;
	}

	public int getUnityatchmnflno() {
		return unityatchmnflno;
	}
	
	public void setUnityatchmnflno(int unityatchmnflno) {
		this.unityatchmnflno = unityatchmnflno;
	}
	
	public int getAno() {
		return ano;
	}
	
	public void setAno(int ano) {
		this.ano = ano;
	}
	
	public String getOriginalname() {
		return originalname;
	}
	
	public void setOriginalname(String originalname) {
		this.originalname = originalname;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getUploadPath() {
		return uploadPath;
	}
	
	public void setUploadpath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	public String getFileType() {
		return fileType;
	}
	
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getFilesize() {
		return filesize;
	}

	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	
	
	
	
}
