package com.mzgw.dto;

import java.util.Date;

public class EvlVO {
	private String ncnm;
	private String dept;
	private Date encpn;
	private int setle_cnt;
	private String work;
	private String ability;
	private int evl_ing;
	private String average;
	
	
	public Date getEncpn() {
		return encpn;
	}
	public void setEncpn(Date encpn) {
		this.encpn = encpn;
	}
	public String getNcnm() {
		return ncnm;
	}
	public void setNcnm(String ncnm) {
		this.ncnm = ncnm;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getSetle_cnt() {
		return setle_cnt;
	}
	public void setSetle_cnt(int setle_cnt) {
		this.setle_cnt = setle_cnt;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getAbility() {
		return ability;
	}
	public void setAbility(String ability) {
		this.ability = ability;
	}
	public int getEvl_ing() {
		return evl_ing;
	}
	public void setEvl_ing(int evl_ing) {
		this.evl_ing = evl_ing;
	}
	public String getAverage() {
		return average;
	}
	public void setAverage(String average) {
		this.average = average;
	}
	
	
}
