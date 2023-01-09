package com.mzgw.setle.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.EvlVO;
import com.mzgw.dto.SetleEvlVO;
import com.mzgw.setle.dao.SetleEvlDAO;
import com.mzgw.util.Criteria;
import com.mzgw.util.PageMaker;

public class SetleEvlServiceImpl implements SetleEvlService {

	private SetleEvlDAO setleEvlDAO;
	
	
	
	public SetleEvlDAO getSetleEvlDAO() {
		return setleEvlDAO;
	}

	public void setSetleEvlDAO(SetleEvlDAO setleEvlDAO) {
		this.setleEvlDAO = setleEvlDAO;
	}


	@Override
	public Map<String, Object> getSetleEvlListBySetleNo(int setleNo, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<SetleEvlVO> setleEvlList = setleEvlDAO.selectSetleEvlListBySetleNo(setleNo, cri);
		
		int totalCount = setleEvlDAO.selectSetleEvlListCountBySetleNo(setleNo);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setDisplayPageNum(5);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("setleEvlList", setleEvlList);
		dataMap.put("pageMaker", pageMaker);
		
		
		return dataMap;
	}

	@Override
	public SetleEvlVO getSetleEvlByEvlNo(int evlNo) throws Exception {
		// TODO Auto-generated method stub
		return setleEvlDAO.selectSetleEvlByEvlNo(evlNo);
	}

	@Override
	public void registSetleEvl(SetleEvlVO setleEvl) throws Exception {

		int evlNo = setleEvlDAO.selectSetleEvlSeq();
		setleEvl.setEvlNo(evlNo);
		setleEvlDAO.insertSetleEvl(setleEvl);
		
	}

	@Override
	public void modifySetleEvl(SetleEvlVO setleEvl) throws Exception {
		// TODO Auto-generated method stub
		setleEvlDAO.updateSetleEvl(setleEvl);
	}

	@Override
	public void removeSetleEvl(SetleEvlVO setleEvl) throws Exception {
		// TODO Auto-generated method stub
		setleEvlDAO.deleteSetleEvl(setleEvl);
	}

	@Override
	public Map<String, Object> getEvlResultAll(Criteria cri) throws Exception {
		Map<String, Object> dataMap = setleEvlDAO.selectEvlAll(cri);
		List<EvlVO> evlListAll = (List<EvlVO>)dataMap.get("evlList");
		dataMap.put("evlListAll", evlListAll);
		return dataMap;
	}

}
