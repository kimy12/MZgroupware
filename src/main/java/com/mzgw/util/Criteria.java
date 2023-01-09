package com.mzgw.util;

public class Criteria {
	
	private int page=1;
	private int perPageNum = 10;
	private String searchType="";
	private String keyword="";

	private int startRowNum=0;
	
	private String dclzStatus="";
	private String start="20180101";
	private String end="20220519";
	
	private String firstLetter;
	private String lastLetter;

	public String getFirstLetter() {
		return firstLetter;
	}
	public void setFirstLetter(String firstLetter) {
		this.firstLetter = firstLetter;
	}
	public String getLastLetter() {
		return lastLetter;
	}
	public void setLastLetter(String lastLetter) {
		this.lastLetter = lastLetter;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start.replaceAll("-", "/");
	}
	public String getEnd() {
		return end.replaceAll("-", "/");
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getDclzStatus() {
		return dclzStatus;
	}
	public void setDclzStatus(String dclzStatus) {
		this.dclzStatus = dclzStatus;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<1) {
			this.page=1;
		}else {
			this.page = page;
		}
		setStartRowNum();
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum < 1) {
			this.perPageNum = 10;
		}else {
			this.perPageNum = perPageNum;
		}
		setStartRowNum();
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	private void setStartRowNum() {
		this.startRowNum=(this.page-1)*perPageNum;		
	}
	public int getStartRowNum() {
		return this.startRowNum;
	}
	
	
	public int getStartRow() {
		return (this.page-1)*perPageNum;				
	}
	
	public int getEndRow() {
		return getStartRow()+perPageNum;
	}
	
}






