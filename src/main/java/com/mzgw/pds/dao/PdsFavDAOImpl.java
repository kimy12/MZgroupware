package com.mzgw.pds.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.FavVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;
import com.mzgw.util.PageMaker;

public class PdsFavDAOImpl implements PdsFavDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertFav(FavVO fav) throws SQLException {
		session.update("Fav-Mapper.insertFav", fav);
	}

	@Override
	public List<FavVO> favList(EmpVO ncnm) throws SQLException {
		return session.selectList("Fav-Mapper.selectFavListByNcnm", ncnm);
	}

	@Override
	public void deleteFav(FavVO fav) throws SQLException {
		session.update("Fav-Mapper.deleteFav", fav);
	}

	@Override
	public Map<String, Object> myFavListAll(EmpVO ncnm, String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri, ncnm);
		map.put("nowSort", nowSort);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<AttachVO> favAttachList = session.selectList("Fav-Mapper.selectFavAll", map, rowBounds);
		int totalCount= session.selectOne("Fav-Mapper.selectFavAllCount", map);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("nowSort", nowSort);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("favAttachList", favAttachList);
		
		return dataMap;
	}


}
