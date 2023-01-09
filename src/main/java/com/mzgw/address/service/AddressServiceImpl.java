package com.mzgw.address.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mzgw.address.dao.AddressDAO;
import com.mzgw.dto.AddressVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;

public class AddressServiceImpl implements AddressService {
	private AddressDAO addressDAO;
	public void setAddressDAO(AddressDAO addressDAO) {
		this.addressDAO = addressDAO;
	}
	@Override
	public Map<String, Object> getEmpList(Criteria cri, String nowSort) throws Exception {
		Map<String, Object> dataMap = addressDAO.empList(nowSort, cri);
		List<EmpVO> empList = (List<EmpVO>)dataMap.get("addressList");
		dataMap.put("empList", empList);
		return dataMap;
	}
	@Override
	public void insertAddress(List<EmpVO> array) throws SQLException {
		for(EmpVO vo : array) {
			addressDAO.insertAddress(vo);
		}
	}
	@Override
	public Map<String, Object> getPrivateList(EmpVO no, Criteria cri, String nowSort) throws Exception {
		Map<String, Object> dataMap = addressDAO.selectPrivateAddress(no, nowSort, cri);
		List<AddressVO> addressList = (List<AddressVO>)dataMap.get("privateAddressList");
		dataMap.put("addressList", addressList);
		return dataMap;
	}
	@Override
	public void insertPrivate(AddressVO vo) throws SQLException {
		addressDAO.insertPrivateAddress(vo);
	}
	@Override
	public void deleteAddress(List<AddressVO> array) throws SQLException {
		for(AddressVO vo : array) {
			addressDAO.deleteAddress(vo);
		}
	}
	@Override
	public void modifyPrivateAddress(AddressVO vo) throws SQLException {
		addressDAO.updatePrivateAddress(vo);
	}
	@Override
	public Map<String, Object> getEmpListByIndex(Criteria cri) throws Exception {
		Map<String, Object> dataMap = addressDAO.selectEmpListAfterIndex(cri);
		List<EmpVO> empList = (List<EmpVO>)dataMap.get("publicList");
		dataMap.put("empList", empList);
		return dataMap;
	}
}
