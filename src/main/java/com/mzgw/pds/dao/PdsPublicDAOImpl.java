package com.mzgw.pds.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.PdsPublicVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;
import com.mzgw.util.PageMaker;

public class PdsPublicDAOImpl implements PdsPublicDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public Map<String, Object> pdsPublicList(String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri);
		map.put("nowSort", nowSort);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<PdsPublicVO> pdsPublicFolders = session.selectList("Pds-Mapper.selectPdsPublicFolders", map, rowBounds);
		int totalCount = session.selectOne("Pds-Mapper.selectPdsPublicFoldersCount", map);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("nowSort", nowSort);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("pdsPublicFolders", pdsPublicFolders);
		
		return dataMap;
	}

	@Override
	public void insertPdsPublic(PdsPublicVO pds) throws SQLException {
		session.update("Pds-Mapper.insertPdsPublic", pds);
	}

	@Override
	public int getSeqNextValue() throws SQLException {
		return session.selectOne("Pds-Mapper.selectPdsPublicSeqNext");
	}

	@Override
	public int getRefrnSeqNextValue() throws SQLException {
		return session.selectOne("Refrn-Mapper.selectRefrnSeqNext");
	}

	@Override
	public void deleteFolder(int no) throws SQLException {
		session.delete("Pds-Mapper.deleteFolderForE", no);
	}

	@Override
	public void updateTitle(PdsPublicVO pds) throws SQLException {
		session.update("Pds-Mapper.insertPdsPublicTitle",pds);
	}

}
