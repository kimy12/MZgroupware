package com.mzgw.pds.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.EmpVO;
import com.mzgw.dto.PdsDepVO;
import com.mzgw.dto.PdsPublicVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;
import com.mzgw.util.PageMaker;

public class PdsDepDAOImpl implements PdsDepDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public void insertPdsDep(PdsDepVO pds) throws SQLException {
		session.update("Pds-Mapper.insertPdsDep", pds);
	}
	@Override
	public int getSeqNextValue() throws SQLException {
		return session.selectOne("Pds-Mapper.selectPdsDepSeqNext");
	}
	@Override
	public int getRefrnSeqNextValue() throws SQLException {
		return session.selectOne("Refrn-Mapper.selectRefrnSeqNext");
	}
	@Override
	public Map<String, Object> pdsDepList(EmpVO dept, String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri, dept);
		map.put("nowSort", nowSort);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<PdsDepVO> pdsDepFolders = session.selectList("Pds-Mapper.selectPdsDepFolders", map, rowBounds);
		int totalCount = session.selectOne("Pds-Mapper.selectPdsDepFoldersCount", map);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("nowSort", nowSort);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("pdsDepFolders", pdsDepFolders);
		
		return dataMap;
	}
	
	@Override
	public void updateTitle(PdsDepVO pds) throws SQLException {
		session.update("Pds-Mapper.insertPdsDepTitle",pds);
	}
	
	@Override
	public void deleteFolder(int no) throws SQLException {
		session.delete("Pds-Mapper.deleteFolderForD", no);
	}
}
