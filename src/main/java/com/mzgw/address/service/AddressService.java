package com.mzgw.address.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AddressVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;

public interface AddressService {
	
	public Map<String, Object> getEmpList(Criteria cri, String nowSort) throws Exception;
	
	public Map<String, Object> getEmpListByIndex(Criteria cri) throws Exception;
	
	public void insertAddress (List<EmpVO>array) throws SQLException;
	
	public Map<String, Object> getPrivateList(EmpVO no, Criteria cri, String nowSort) throws Exception;

	public void insertPrivate (AddressVO vo) throws SQLException;
	
	public void deleteAddress(List<AddressVO> array) throws SQLException;
	
	public void modifyPrivateAddress(AddressVO vo) throws SQLException;
	
}
