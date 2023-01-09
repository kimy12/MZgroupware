package com.mzgw.address.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.AddressVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;
import com.mzgw.util.PageMaker;

public class AddressDAOImpl implements AddressDAO {
	

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public Map<String, Object> empList(String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri);
		map.put("nowSort", nowSort);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<EmpVO> addressList = session.selectList("Emp-Mapper.selectEmpListForAddress",  map, rowBounds);
		int totalCount = session.selectOne("Emp-Mapper.selectEmpListForAddressCount", map);
		
		pageMaker.setTotalCount(totalCount);
		dataMap.put("nowSort", nowSort);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("addressList", addressList);
		return dataMap;
	}
	@Override
	public void insertAddress(EmpVO ncnm) throws SQLException {
		session.update("Emp-Mapper.updateAddress", ncnm);
	}
	@Override
	public Map<String, Object> selectPrivateAddress(EmpVO no, String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri, no);
		map.put("nowSort", nowSort);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<AddressVO> privateAddressList = session.selectList("Address-Mapper.selectPrivateAddress",  map, rowBounds);
		int totalCount = session.selectOne("Address-Mapper.selectPrivateAddressCount",  map);
		
		pageMaker.setTotalCount(totalCount);
		dataMap.put("nowSort", nowSort);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("privateAddressList", privateAddressList);
		return dataMap;
	}
	
//	@Override
//	public Map<String, Object> selectEmpListAfterIndex(KorIndexingVO vo, Criteria cri) throws Exception {
//		int offset = cri.getStartRowNum();
//		int limit = cri.getPerPageNum();
//		RowBounds rowBounds = new RowBounds(offset,limit);
//		
//		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri, vo);
//		Map<String, Object> dataMap = new HashMap<String, Object>();
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		
//		List<EmpVO> publicList = session.selectList("Emp-Mapper.addressIndexing", map, rowBounds);
//		int totalCount = session.selectOne("Emp-Mapper.addressIndexingCount", map);
//		pageMaker.setTotalCount(totalCount);
//		dataMap.put("pageMaker", pageMaker);
//		dataMap.put("publicList", publicList);
//		return dataMap;
//	}
	
	@Override
	public Map<String, Object> selectEmpListAfterIndex(Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<EmpVO> publicList = session.selectList("Emp-Mapper.addressIndexing", map, rowBounds);
		int totalCount = session.selectOne("Emp-Mapper.addressIndexingCount", map);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("publicList", publicList);
		return dataMap;
	}
	@Override
	public void insertPrivateAddress(AddressVO vo) throws SQLException {
		session.update("Address-Mapper.insertPrivateAddress",vo);
	}
	@Override
	public void deleteAddress(AddressVO vo) throws SQLException {
		session.update("Address-Mapper.deleteAddress",vo);
	}
	@Override
	public void updatePrivateAddress(AddressVO vo) throws SQLException {
		session.update("Address-Mapper.updatePrivateAddress",vo);
	}
	
}
