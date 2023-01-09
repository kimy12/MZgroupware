package com.mzgw.dto;

import java.util.Date;
import java.util.List;

public class ClubVO {
	private int club_no;
	private String club_nm;
	private String regdate;
	private int min_ppl;
	private int max_ppl;
	private String president;
	private String target;
	private String startdate;
	private String enddate;
	private String meetingtime;
	private int club_unity;
		
	private List<ClubConceptVO> conceptList;
	private int cntOfCurrentMem;
	
	
	
	public int getClub_unity() {
		return club_unity;
	}
	public void setClub_unity(int club_unity) {
		this.club_unity = club_unity;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getMeetingtime() {
		return meetingtime;
	}
	public void setMeetingtime(String meetingtime) {
		this.meetingtime = meetingtime;
	}
	public List<ClubConceptVO> getConceptList() {
		return conceptList;
	}
	public void setConceptList(List<ClubConceptVO> conceptList) {
		this.conceptList = conceptList;
	}
	
	public int getCntOfCurrentMem() {
		return cntOfCurrentMem;
	}
	public void setCntOfCurrentMem(int cntOfCurrentMem) {
		this.cntOfCurrentMem = cntOfCurrentMem;
	}
	
	private String clubMember = "";
	
	
	public String getClubMember() {
		return clubMember;
	}
	public void setClubMember(String clubMember) {
		this.clubMember = clubMember;
	}
	public int getClub_no() {
		return club_no;
	}
	public void setClub_no(int club_no) {
		this.club_no = club_no;
	}
	public String getClub_nm() {
		return club_nm;
	}
	public void setClub_nm(String club_nm) {
		this.club_nm = club_nm;
	}
	
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getMin_ppl() {
		return min_ppl;
	}
	public void setMin_ppl(int min_ppl) {
		this.min_ppl = min_ppl;
	}
	public int getMax_ppl() {
		return max_ppl;
	}
	public void setMax_ppl(int max_ppl) {
		this.max_ppl = max_ppl;
	}
	public String getPresident() {
		return president;
	}
	public void setPresident(String president) {
		this.president = president;
	}
	
	
	
}
