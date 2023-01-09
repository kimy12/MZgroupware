package com.mzgw.manager.service;

import java.util.Map;

import com.mzgw.dto.CompanyTopbarVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.WorkTimeVO;
import com.mzgw.util.Criteria;

public interface ManagerService {
	
	public Map<String, Object> getEmpList(Criteria cri) throws Exception;
	
	public CompanyTopbarVO getTopbarColor() throws Exception;
	
	public WorkTimeVO getWorkTime() throws Exception;
	
	public void registEmp(EmpVO emp) throws Exception;
	
	public void modifyTopbarColor(String color) throws Exception;
	
	public void modifyWorkTime(WorkTimeVO workTime) throws Exception;
}
