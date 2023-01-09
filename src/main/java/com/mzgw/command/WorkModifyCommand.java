package com.mzgw.command;

import com.mzgw.dto.WorkVO;

public class WorkModifyCommand extends WorkRegistCommand{
	
	private int jobCode;
	private String[] deleteFile;
	
	
	
	public int getJobCode() {
		return jobCode;
	}
	public void setJobCode(int jobCode) {
		this.jobCode = jobCode;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	@Override
	public WorkVO toWorkVO(){
		WorkVO work = super.toWorkVO();
		work.setJobCode(this.jobCode);	
		
		return work;
	}
}
