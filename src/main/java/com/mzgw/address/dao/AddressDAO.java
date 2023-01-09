package com.mzgw.address.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AddressVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;

public interface AddressDAO {
	
	public Map<String, Object> empList(String nowSort, Criteria cri) throws Exception;
	
	public void insertAddress(EmpVO ncnm)throws SQLException;
	
	public Map<String, Object> selectPrivateAddress(EmpVO no, String nowSort, Criteria cri) throws Exception;

	public void insertPrivateAddress(AddressVO vo) throws SQLException;
	
	public void deleteAddress(AddressVO vo)throws SQLException;
	
	public void updatePrivateAddress(AddressVO vo)throws SQLException;
	
	public Map<String, Object> selectEmpListAfterIndex (Criteria cri) throws Exception;
}
