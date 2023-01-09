package com.mzgw.setle.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.DeptVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.SetleVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;
import com.mzgw.util.PageMaker;

public class SetleDAOImpl implements SetleDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<SetleVO> selectSetleList(Criteria cri) throws Exception{
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<SetleVO> SetleList = session.selectList("Setle-Mapper.selectSearchSetleList", cri, rowBounds);
		
		return SetleList;
	}


	@Override
	public void insertSetle(SetleVO vo) throws Exception{

		session.update("Setle-Mapper.insertSetle",vo);
		
	}

	@Override
	public int selectSetleSeq() throws Exception{
		
		return session.selectOne("Setle-Mapper.selectSetleSeq");
	}

	@Override
	public Map<String, Object> selectSetleListByWriterNo(Criteria cri, String nowSort, EmpVO emp, int sttusNo) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri,emp);
		map.put("nowSort", nowSort);
		map.put("sttusNo", sttusNo);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		
		List<SetleVO> setleList = session.selectList("Setle-Mapper.selectSetleListByWriterNo", map, rowBounds);
		
		int totalCount = session.selectOne("Setle-Mapper.selectSetleListCountByWriterNo",map);
		
		Map<String, Object> selectOne = session.selectOne("Setle-Mapper.selectsetlePerCalc", map);
		
		pageMaker.setTotalCount(totalCount);
		
		
		dataMap.putAll(selectOne);
		dataMap.put("setleList", setleList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> selectDeleteSetleListByWriterNo(Criteria cri, String nowSort, EmpVO emp) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri,emp);
		map.put("nowSort", nowSort);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		
		List<SetleVO> setleList = session.selectList("Setle-Mapper.selectDeleteSetleListByWriterNo", map, rowBounds);
		
		int totalCount = session.selectOne("Setle-Mapper.selectDeleteSetleListCountByWriterNo",map);
		
		pageMaker.setTotalCount(totalCount);
		
		
		
		dataMap.put("setleList", setleList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectSetleListByDepartNm(Criteria cri,String nowSort, EmpVO emp) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri,emp);
		map.put("nowSort", nowSort);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		
		
		List<SetleVO> setleList = session.selectList("Setle-Mapper.selectSetleListByDepartNm", map, rowBounds);
		
		int totalCount = session.selectOne("Setle-Mapper.selectSetleListCountByDepartNm",map);
		
		pageMaker.setTotalCount(totalCount);
		
		
		
		dataMap.put("setleList", setleList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public List<SetleVO> selectSetleListBySetleEmpNo(Criteria cri, EmpVO emp) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateSetle(SetleVO setle) throws Exception {
		// TODO Auto-generated method stub
		session.update("Setle-Mapper.updateSetle",setle);
	}

	@Override
	public void deleteSetle(int setleNo) throws Exception {
		// TODO Auto-generated method stub
		session.update("Setle-Mapper.deleteSetle",setleNo);
	}

	@Override
	public SetleVO selectSetleBySetleNo(int setleNo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("Setle-Mapper.selectSetleBySetleNo", setleNo);
	}

	@Override
	public void updateSetleSttusNo(SetleVO setle) throws Exception {
		// TODO Auto-generated method stub
		session.update("Setle-Mapper.updateSetleSttusNo", setle);
	}
	@Override
	public List<SetleVO> selectRecentSetleListBySetleEmpSetleNo(EmpVO user)
			throws Exception {
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(user);
		RowBounds rowBounds = new RowBounds(0,3);
		
		List<SetleVO> recentSetleList = session.selectList("Setle-Mapper.selectRecentSetleListBySetleEmpSetleNo", map, rowBounds);
		
		
		return recentSetleList;
		
	}

	@Override
	public Map<String, Object> selectSetleListBySetleEmpSetleNo(Criteria cri, String nowSort, EmpVO user)
			throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri,user);
		map.put("nowSort", nowSort);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		
		List<SetleVO> setleList = session.selectList("Setle-Mapper.selectSetleListBySetleEmpSetleNo", map, rowBounds);
		
		int totalCount = session.selectOne("Setle-Mapper.selectSetleListCountBySetleEmpSetleNo",map);
		
		pageMaker.setTotalCount(totalCount);
		
		
		
		dataMap.put("setleList", setleList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void updateSetleDel(SetleVO setle) throws Exception {
		// TODO Auto-generated method stub
		session.update("Setle-Mapper.updateSetleDel",setle);
	}

	@Override
	public Map<String, Object> selectsetlePerCalc(EmpVO emp) throws Exception {
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(emp);
		Map<String, Object> selectOne = session.selectOne("Setle-Mapper.selectsetlePerCalc", map);
		return selectOne;
	}
	

}
