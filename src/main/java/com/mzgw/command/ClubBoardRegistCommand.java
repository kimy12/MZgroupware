package com.mzgw.command;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mzgw.dto.ClubBoardVO;


public class ClubBoardRegistCommand {
	
	private int clubboard_no;
	private int clubboardtype_no;
	private String clubboard_writer;
	private String clubboard_title;
	private Date clubboard_rgdt;
	private Date clubboard_upddt;
	private String clubboard_cont;
	private String clubboard_cnt;
	private int clubboard_like;
	private int unityatchmnflno;
	private int pin;
	private int club_no;
	private String dept;
	private String ncnm;
	private List<MultipartFile> uploadFile;
	
	
	
	
	
	public String getNcnm() {
		return ncnm;
	}



	public void setNcnm(String ncnm) {
		this.ncnm = ncnm;
	}



	public String getClubboard_cont() {
		return clubboard_cont;
	}



	public void setClubboard_cont(String clubboard_cont) {
		this.clubboard_cont = clubboard_cont;
	}



	public int getClubboard_no() {
		return clubboard_no;
	}



	public void setClubboard_no(int clubboard_no) {
		this.clubboard_no = clubboard_no;
	}



	public int getClubboardtype_no() {
		return clubboardtype_no;
	}



	public void setClubboardtype_no(int clubboardtype_no) {
		this.clubboardtype_no = clubboardtype_no;
	}



	public String getClubboard_writer() {
		return clubboard_writer;
	}



	public void setClubboard_writer(String clubboard_writer) {
		this.clubboard_writer = clubboard_writer;
	}



	public String getClubboard_title() {
		return clubboard_title;
	}



	public void setClubboard_title(String clubboard_title) {
		this.clubboard_title = clubboard_title;
	}



	public Date getClubboard_rgdt() {
		return clubboard_rgdt;
	}



	public void setClubboard_rgdt(Date clubboard_rgdt) {
		this.clubboard_rgdt = clubboard_rgdt;
	}



	public Date getClubboard_upddt() {
		return clubboard_upddt;
	}



	public void setClubboard_upddt(Date clubboard_upddt) {
		this.clubboard_upddt = clubboard_upddt;
	}



	public String getClubboard_cnt() {
		return clubboard_cnt;
	}



	public void setClubboard_cnt(String clubboard_cnt) {
		this.clubboard_cnt = clubboard_cnt;
	}



	public int getClubboard_like() {
		return clubboard_like;
	}



	public void setClubboard_like(int clubboard_like) {
		this.clubboard_like = clubboard_like;
	}



	public int getUnityatchmnflno() {
		return unityatchmnflno;
	}



	public void setUnityatchmnflno(int unityatchmnflno) {
		this.unityatchmnflno = unityatchmnflno;
	}



	public int getPin() {
		return pin;
	}



	public void setPin(int pin) {
		this.pin = pin;
	}



	public int getClub_no() {
		return club_no;
	}



	public void setClub_no(int club_no) {
		this.club_no = club_no;
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



	public ClubBoardVO toClubBoardVO() {
		ClubBoardVO clubBoard = new ClubBoardVO();
		
			clubBoard.setClubboard_no(this.clubboard_no);
			clubBoard.setClubboardtype_no(this.clubboardtype_no);
			clubBoard.setClubboard_writer(this.clubboard_writer);
			clubBoard.setClubboard_title(this.clubboard_title);
			clubBoard.setClubboard_cont(this.clubboard_cont);
			clubBoard.setClubboard_rgdt(this.clubboard_rgdt);
			clubBoard.setClubboard_upddt(this.clubboard_upddt);
			clubBoard.setClubboard_cnt(this.clubboard_cnt);
			clubBoard.setClubboard_like(this.clubboard_like);
			clubBoard.setUnityatchmnflno(this.unityatchmnflno);
			clubBoard.setPin(this.pin);
			clubBoard.setClub_no(this.club_no);
			clubBoard.setDept(this.dept);
			clubBoard.setNcnm(this.ncnm);
				
		return clubBoard;
		
		
	}
	
	

}
