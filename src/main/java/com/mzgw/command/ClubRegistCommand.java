package com.mzgw.command;

import java.util.ArrayList;
import java.util.List;

import com.mzgw.dto.ClubConceptVO;
import com.mzgw.dto.ClubVO;

public class ClubRegistCommand {
	private String club_nm;
	private String regdate;
	private int min_ppl;
	private int max_ppl;
	private String president;
	private String target;
	private String startdate;
	private String enddate;
	private String content;
	private String meetingtime;
	private int club_unity = -1;
	
	
	public int getClub_unity() {
		return club_unity;
	}
	public void setClub_unity(int club_unity) {
		this.club_unity = club_unity;
	}
	public String getMeetingtime() {
		return meetingtime;
	}
	public void setMeetingtime(String meetingtime) {
		this.meetingtime = meetingtime;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public ClubVO toClubVO() {
		ClubVO club = new ClubVO();
		
		club.setClub_nm(this.club_nm);
		club.setRegdate(this.regdate);
		club.setMin_ppl(this.min_ppl);
		club.setMax_ppl(this.max_ppl);
		club.setPresident(this.president);
		club.setTarget(this.target);
		club.setStartdate(this.startdate);
		club.setEnddate(this.enddate);
		club.setMeetingtime(this.meetingtime);
		club.setClub_unity(this.club_unity);
		
		return club;
	}
	
	public List<ClubConceptVO> toClubConeptList(){
		
		List<ClubConceptVO> conceptList = new ArrayList<>();
		
		String[] conceptArr = content.split(",");
		
		for(int i = 0; i < conceptArr.length; i++) {
			ClubConceptVO clubConcept = new ClubConceptVO();
			clubConcept.setContent(conceptArr[i]);
			
			conceptList.add(clubConcept);
		}
		
		return conceptList;
	}
	
	
}
