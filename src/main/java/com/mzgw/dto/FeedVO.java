package com.mzgw.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FeedVO {
	
	private String empNo;
	private int likeGoob;
	private int unity;
	private String mssage;
	private String profileImg;
	private int replyNo;
	private String nicName;
	private String feedName;
	private String userDept;
	private String replyName;
	private String backImg; // 사진파일	
	private List<MultipartFile> uploadFile; // 변경된 사진 파일명.
	
	private List<AttachVO> attachList;

    public List<AttachVO> getAttachList() {
      return attachList;
    }
	
	public void setAttachList(List<AttachVO> attachList) {
      this.attachList = attachList;
    }
	
	public String getEmpNo() {
		return empNo;
	}
	
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	
	public int getLikeGoob() {
		return likeGoob;
	}

	public void setLikeGoob(int likeGoob) {
		this.likeGoob = likeGoob;
	}

	public int getUnity() {
		return unity;
	}
	
	public void setUnity(int unity) {
		this.unity = unity;
	}
	
	public String getMssage() {
		return mssage;
	}
	
	public void setMssage(String mssage) {
		this.mssage = mssage;
	}
	
	public String getProfileImg() {
		return profileImg;
	}
	
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
	public int getReplyNo() {
		return replyNo;
	}
	
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getNicName() {
		return nicName;
	}

	public void setNicName(String nicName) {
		this.nicName = nicName;
	}

	public String getUserDept() {
		return userDept;
	}

	public void setUserDept(String userDept) {
		this.userDept = userDept;
	}

	public String getReplyName() {
		return replyName;
	}

	public void setReplyName(String replyName) {
		this.replyName = replyName;
	}


	public String getBackImg() {
		return backImg;
	}

	public void setBackImg(String backImg) {
		this.backImg = backImg;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getFeedName() {
		return feedName;
	}

	public void setFeedName(String feedName) {
		this.feedName = feedName;
	}

	
	
	
	
	
	
}
