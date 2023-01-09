package com.mzgw.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.CompanyTopbarVO;
import com.mzgw.dto.DeptVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.WorkTimeVO;
import com.mzgw.manager.dao.ManagerDAO;
import com.mzgw.util.Criteria;
import com.mzgw.util.PageMaker;

public class ManagerServiceImpl implements ManagerService {
	
	private ManagerDAO managerDAO;
	public void setManagerDAO(ManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}
	
	@Override
	public void registEmp(EmpVO emp) throws Exception {
		
		managerDAO.insertEmp(emp);

	}

	@Override
	public Map<String, Object> getEmpList(Criteria cri) throws Exception {
		
		Criteria searchCri = (Criteria)cri;
		Map<String, Object> dataMap = new HashMap<String, Object>();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(managerDAO.selectEmpListCount(searchCri));

		List<EmpVO> empList = managerDAO.selectEmpList(searchCri);
		List<DeptVO> deptName = managerDAO.selectDeptName();
		
		dataMap.put("empList", empList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("deptName", deptName);
		
		return dataMap;
	}

	@Override
	public WorkTimeVO getWorkTime() throws Exception {
		
		return managerDAO.selectWorkTime();
	}

	@Override
	public void modifyWorkTime(WorkTimeVO workTime) throws Exception {
		
		managerDAO.updateWorkTime(workTime);
		
	}

	@Override
	public CompanyTopbarVO getTopbarColor() throws Exception {
		
		return managerDAO.selectTopbarColor();
	}

	@Override
	public void modifyTopbarColor(String color) throws Exception {
		
		managerDAO.updateTopbarColor(color);
		
	}

}
