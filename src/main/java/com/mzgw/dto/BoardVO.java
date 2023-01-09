package com.mzgw.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardVO {

	private int board_no;
	private int boardtype_no;
	private String btName;
	private String board_writer;
	private String board_title;
	private String board_cont;
	private Date board_rgdt;
	private Date board_upddt;
	private int board_cnt;
	private String name;
	private String dept;
	private int board_like;
	private int unityatchmnflno;
	private int eboard_status;
	private String pin;
	private String isAtch;
	private String ncnm;
	private String boardncnm;
	private String board_head;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eboard_date;
	private String id;
	
	
	
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getEboard_date() {
		return eboard_date;
	}

	public void setEboard_date(Date eboard_date) {
		this.eboard_date = eboard_date;
	}

	public String getBoardncnm() {
		return boardncnm;
	}

	public void setBoardncnm(String boardncnm) {
		this.boardncnm = boardncnm;
	}

	public String getBoard_head() {
		return board_head;
	}

	public void setBoard_head(String board_head) {
		this.board_head = board_head;
	}

	public String getNcnm() {
		return ncnm;
	}

	public void setNcnm(String ncnm) {
		this.ncnm = ncnm;
	}

	private int p_no;
	private String start_date;
	private String end_date;

	private List<AttachVO> attachList;
	
	public String getIsAtch() {
		return isAtch;
	}
	
	public void setIsAtch(String isAtch) {
		this.isAtch = isAtch;
	}

	private int breply_count ;
	
	public int getBreply_count() {
		return breply_count;
	}

	public void setBreply_count(int breply_count) {
		this.breply_count = breply_count;
	}
	
	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public int getEboard_status() {
		return eboard_status;
	}

	public void setEboard_status(int eboard_status) {
		this.eboard_status = eboard_status;
	}


	public List<AttachVO> getAttachList() {
		return attachList;
	}

	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}

	public int getUnityatchmnflno() {
		return unityatchmnflno;
	}

	public void setUnityatchmnflno(int unityatchmnflno) {
		this.unityatchmnflno = unityatchmnflno;
	}

	public int getBoard_like() {
		return board_like;
	}

	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getBoardtype_no() {
		return boardtype_no;
	}

	public void setBoardtype_no(int boardtype_no) {
		this.boardtype_no = boardtype_no;
	}

	public String getBtName() {
		return btName;
	}

	public void setBtName(String btName) {
		this.btName = btName;
	}

	public String getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_cont() {
		return board_cont;
	}

	public void setBoard_cont(String board_cont) {
		this.board_cont = board_cont;
	}

	public Date getBoard_rgdt() {
		return board_rgdt;
	}

	public void setBoard_rgdt(Date board_rgdt) {
		this.board_rgdt = board_rgdt;
	}

	public Date getBoard_upddt() {
		return board_upddt;
	}

	public void setBoard_upddt(Date board_upddt) {
		this.board_upddt = board_upddt;
	}

	public int getBoard_cnt() {
		return board_cnt;
	}

	public void setBoard_cnt(int board_cnt) {
		this.board_cnt = board_cnt;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}


}