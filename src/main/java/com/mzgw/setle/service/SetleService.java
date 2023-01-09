package com.mzgw.setle.service;

import java.util.List;
import java.util.Map;

import com.mzgw.dto.EmpVO;
import com.mzgw.dto.SetleEmpVO;
import com.mzgw.dto.SetleFormVO;
import com.mzgw.dto.SetleVO;
import com.mzgw.util.Criteria;

public interface SetleService {

	public void regist(SetleVO setle) throws Exception;
	
	public List<SetleVO> getSetleList(Criteria cri) throws Exception;
	
	public Map<String, Object> getSetleListByWriterNo(Criteria cri, String nowSort, EmpVO emp, int sttusNo) throws Exception;
	
	public Map<String, Object> getSetleListByDepart(Criteria cri, String nowSort, EmpVO emp) throws Exception;

	public SetleVO getSetleBySetleNo(int setleNo) throws Exception;

	public void changeSttus(SetleVO setle) throws Exception;

	public void modify(SetleVO setle, int lastAno,int[] removeAttaches) throws Exception;

	public Map<String, Object> getSetleLisBySetleEmpSetleNo(Criteria cri, String nowSort, EmpVO user) throws Exception;

	public void changeSttusAgree(SetleEmpVO setleEmp) throws Exception;
	
	public void changeSttusProcess(SetleVO setle) throws Exception;

	public void changeSttusDisgree(SetleEmpVO setleEmp) throws Exception;

	Map<String, Object> getDeleteSetleListByWriterNo(Criteria cri, String nowSort, EmpVO emp) throws Exception;
	
	public void changeSetleDel(SetleVO setle) throws Exception;

	public void removeSetle(int setleNo) throws Exception;
	
	public void addForm(SetleFormVO form)throws Exception;
	
	public List<SetleEmpVO> getSetleEmp(int setleNo) throws Exception;
	
	public Map<String, Object> getsetlePerCalc(EmpVO emp) throws Exception;
}
