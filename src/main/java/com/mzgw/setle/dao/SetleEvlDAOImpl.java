package com.mzgw.setle.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.EvlVO;
import com.mzgw.dto.SetleEvlVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;
import com.mzgw.util.PageMaker;

public class SetleEvlDAOImpl implements SetleEvlDAO {

	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	

	@Override
	public List<SetleEvlVO> selectSetleEvlListBySetleNo(int setleNo, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return session.selectList("SetleEvl-Mapper.selectSetleEvlListBySetleNo", setleNo,rowBounds);
	}

	@Override
	public SetleEvlVO selectSetleEvlByEvlNo(int evlNo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("SetleEvl-Mapper.selectSetleEvlByEvlNo", evlNo);
	}

	@Override
	public int selectSetleEvlSeq() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("SetleEvl-Mapper.selectSetleEvlSeq");
	}

	@Override
	public void insertSetleEvl(SetleEvlVO setleEvl) throws Exception {
		// TODO Auto-generated method stub
		session.update("SetleEvl-Mapper.insertSetleEvl",setleEvl);
	}


	@Override
	public int selectSetleEvlListCountBySetleNo(int setleNo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("SetleEvl-Mapper.selectSetleEvlListCountBySetleNo", setleNo);
	}


	@Override
	public void updateSetleEvl(SetleEvlVO setleEvl) throws Exception {
		// TODO Auto-generated method stub
		session.update("SetleEvl-Mapper.updateSetleEvl",setleEvl);
	}


	@Override
	public void deleteSetleEvl(SetleEvlVO setleEvl) throws Exception {
		// TODO Auto-generated method stub
		session.update("SetleEvl-Mapper.deleteSetleEvl",setleEvl);
	}


	@Override
	public Map<String, Object> selectEvlAll(Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<EvlVO> evlList = session.selectList("Evl-Mapper.selectEvlResult", map, rowBounds);
		int totalCount = session.selectOne("Evl-Mapper.selectEvlResultCount", map);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("evlList", evlList);
		return dataMap;
	}

}
