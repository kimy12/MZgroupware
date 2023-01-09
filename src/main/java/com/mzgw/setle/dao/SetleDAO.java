package com.mzgw.setle.dao;

import java.util.List;
import java.util.Map;

import com.mzgw.dto.DeptVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.SetleVO;
import com.mzgw.util.Criteria;

public interface SetleDAO {

	public List<SetleVO> selectSetleList(Criteria cri) throws Exception;
	
	public Map<String, Object> selectSetleListByWriterNo(Criteria cri,String nowSort, EmpVO emp, int sttusNo) throws Exception;
	
	public Map<String, Object> selectDeleteSetleListByWriterNo(Criteria cri,String nowSort, EmpVO emp) throws Exception;
	
	public Map<String, Object> selectSetleListByDepartNm(Criteria cri,String nowSort, EmpVO emp) throws Exception;
	
	public List<SetleVO> selectSetleListBySetleEmpNo(Criteria cri, EmpVO emp) throws Exception;
	
	public int selectSetleSeq() throws Exception;
	
	public SetleVO selectSetleBySetleNo(int setleNo) throws Exception;
	
	public void insertSetle(SetleVO setle) throws Exception;
	
	public void updateSetle(SetleVO setle) throws Exception;
	
	public void updateSetleDel(SetleVO setle) throws Exception;
	
	public void deleteSetle(int setleNo) throws Exception;

	public void updateSetleSttusNo(SetleVO setle) throws Exception;

	public Map<String, Object> selectSetleListBySetleEmpSetleNo(Criteria cri, String nowSort, EmpVO user) throws Exception;

	List<SetleVO> selectRecentSetleListBySetleEmpSetleNo(EmpVO user) throws Exception;
	
	public Map<String, Object> selectsetlePerCalc(EmpVO emp) throws Exception;
	
}
