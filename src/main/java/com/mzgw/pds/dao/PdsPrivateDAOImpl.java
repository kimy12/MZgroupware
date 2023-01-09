package com.mzgw.pds.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.EmpVO;
import com.mzgw.dto.PdsPrivateVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;
import com.mzgw.util.PageMaker;

public class PdsPrivateDAOImpl implements PdsPrivateDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int getSeqNextValue() throws SQLException {
		return session.selectOne("Pds-Mapper.selectPdsPrivateSeqNext");
	}
	
	@Override
	public int getRefrnSeqNextValue() throws SQLException {
		return session.selectOne("Refrn-Mapper.selectRefrnSeqNext");
	}

	@Override
	public void insertPdsPrivate(PdsPrivateVO pds) throws SQLException {
		session.update("Pds-Mapper.insertPdsPrivate", pds);
	}

	@Override
	public Map<String, Object> pdsPrivateList(EmpVO ncnm, String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri, ncnm);
		map.put("nowSort", nowSort);
		//map.put("ncnm", ncnm);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<PdsPrivateVO> pdsPrivateFolders = session.selectList("Pds-Mapper.selectPdsPrivateFolders", map, rowBounds);
		
		int totalCount = session.selectOne("Pds-Mapper.selectPdsPrivateFoldersCount", map);
		
		pageMaker.setTotalCount(totalCount);
		dataMap.put("nowSort", nowSort);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("pdsPrivateFolders", pdsPrivateFolders);
		
		return dataMap;
	}

	@Override
	public List<PdsPrivateVO> refrnPrivateList(EmpVO ncnm)  throws SQLException {
		return session.selectList("Pds-Mapper.selectRefrnListAtPrivate",ncnm);
	}
	
	@Override
	public void updateTitle(PdsPrivateVO pds) throws SQLException {
		session.update("Pds-Mapper.insertPdsPrivateTitle",pds);
	}

	@Override
	public void toBin(int no) throws SQLException {
		session.update("Pds-Mapper.updateDel", no);
	}

	@Override
	public List<PdsPrivateVO> pdsBinList(EmpVO ncnm) throws SQLException {
		return session.selectList("Pds-Mapper.selectPdsBin", ncnm);
	}

	@Override
	public void recoverFromBin(int no) throws SQLException {
		session.update("Pds-Mapper.recoverDel", no);
	}

	@Override
	public void deleteFolder(int no) throws SQLException {
		session.delete("Pds-Mapper.deleteFolder", no);
	}

	@Override
	public PdsPrivateVO pdsPrivateListByM(PdsPrivateVO pds) throws SQLException {
		return session.selectOne("Pds-Mapper.selectPdsPrivateByM",pds);
	}

	@Override
	public void updatePdsPrivate(PdsPrivateVO pds) throws SQLException {
		session.update("Pds-Mapper.updatePdsPrivate",pds);
	}

	


}
