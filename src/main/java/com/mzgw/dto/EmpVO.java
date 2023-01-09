package com.mzgw.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class EmpVO {
	
	private String empl_no;
	private String id;
	private String name;
	private String password;
	private String clsfcode;
	private String mbtlnum;
	private String phone;
	private String zip;
	private String bassadres;
	private String detailadres;
	private Date encpn;
	private String photo;
	private Date last_conect_on;
	private String email;
	private String acnutno;
	private String dept;
	private String ncnm;
	private String ip;
	private Date retireon;
	private String dprlr_empl_no;
	private String authority;
	private String rank;
	private String gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private Date last_check;
	
	private String loginempno;
	
	private String pstate;
	private String state;
	private int club_no;
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPstate() {
		return pstate;
	}
	public void setPstate(String pstate) {
		this.pstate = pstate;
	}
	public int getClub_no() {
		return club_no;
	}
	public void setClub_no(int club_no) {
		this.club_no = club_no;
	}
	public String getLoginempno() {
		return loginempno;
	}
	public void setLoginempno(String loginempno) {
		this.loginempno = loginempno;
	}
	public Date getLast_check() {
		return last_check;
	}
	public void setLast_check(Date last_check) {
		this.last_check = last_check;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	private int enabled;
	private String chkId;
	
	public String getChkId() {
		return chkId;
	}
	public void setChkId(String chkId) {
		this.chkId = chkId;
	}
	public String getEmpl_no() {
		return empl_no;
	}
	public void setEmpl_no(String empl_no) {
		this.empl_no = empl_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getClsfcode() {
		return clsfcode;
	}
	public void setClsfcode(String clsfcode) {
		this.clsfcode = clsfcode;
	}
	public String getMbtlnum() {
		return mbtlnum;
	}
	public void setMbtlnum(String mbtlnum) {
		this.mbtlnum = mbtlnum;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getBassadres() {
		return bassadres;
	}
	public void setBassadres(String bassadres) {
		this.bassadres = bassadres;
	}
	public String getDetailadres() {
		return detailadres;
	}
	public void setDetailadres(String detailadres) {
		this.detailadres = detailadres;
	}
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAcnutno() {
		return acnutno;
	}
	public void setAcnutno(String acnutno) {
		this.acnutno = acnutno;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getNcnm() {
		return ncnm;
	}
	public void setNcnm(String ncnm) {
		this.ncnm = ncnm;
	}

	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getEncpn() {
		return encpn;
	}
	public void setEncpn(Date encpn) {
		this.encpn = encpn;
	}
	public Date getLast_conect_on() {
		return last_conect_on;
	}
	public void setLast_conect_on(Date last_conect_on) {
		this.last_conect_on = last_conect_on;
	}
	public Date getRetireon() {
		return retireon;
	}
	public void setRetireon(Date retireon) {
		this.retireon = retireon;
	}
	public String getDprlr_empl_no() {
		return dprlr_empl_no;
	}
	public void setDprlr_empl_no(String dprlr_empl_no) {
		this.dprlr_empl_no = dprlr_empl_no;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	

}
