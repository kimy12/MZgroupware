package com.mzgw.setle.dao;

import java.util.List;

import com.mzgw.dto.SetleEmpVO;

public interface SetleEmpDAO {

	public List<SetleEmpVO> selectSetleEmpListBySetleNo(int setleNo) throws Exception;
	
	public void insertSetleEmp(SetleEmpVO setleEmp)throws Exception;
	
	public void deleteAllSetlEmpBySetleNo(int setleNo) throws Exception;
	
	public void updateSttusAgree(SetleEmpVO setleEmp) throws Exception;

	public void updateSttusDisagree(SetleEmpVO setleEmp) throws Exception;
}
