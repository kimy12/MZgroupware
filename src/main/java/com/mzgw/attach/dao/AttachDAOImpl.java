package com.mzgw.attach.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.PdsDepVO;
import com.mzgw.dto.PdsPrivateVO;
import com.mzgw.dto.PdsPublicVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;
import com.mzgw.util.PageMaker;

public class AttachDAOImpl implements AttachDAO {
	
	private SqlSession session;
	
	
	public void setSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public void insertAttach(AttachVO attach) throws SQLException {
		session.update("Attach-Mapper.insertAttach", attach);
	}


	@Override
	public int selectUnitySeq() throws SQLException {
		return session.selectOne("Attach-Mapper.selectUnitySeq");
	}

	@Override
	public Map<String, Object> selectDeletedAttachByM(EmpVO ncnm, String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri, ncnm);
		map.put("nowSort", nowSort);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<PdsPrivateVO> pdsBinList = session.selectList("Attach-Mapper.selectDeletedAttachByM", map, rowBounds);
		int totalCount = session.selectOne("Attach-Mapper.selectDeletedAttachByMCount", map);
		
		pageMaker.setTotalCount(totalCount);
		dataMap.put("nowSort", nowSort);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("pdsBinList", pdsBinList);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectAttachByUnityatchmnflno(int m_unityatchmnflno, String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri);
		map.put("nowSort", nowSort);
		map.put("m_unityatchmnflno", m_unityatchmnflno);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<AttachVO> pdsPrivateList = session.selectList("Attach-Mapper.selectAttachByUnityatchmnflno", map, rowBounds);
		
		int totalCount = session.selectOne("Attach-Mapper.selectAttachByUnityatchmnflnoCount", map);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("nowSort", nowSort);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("pdsPrivateList", pdsPrivateList);
		return dataMap;
	}
	
	@Override
	public Map<String, Object> selectAttachByEUnityatchmnflno(int e_unityatchmnflno, String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri);
		map.put("nowSort", nowSort);
		map.put("e_unityatchmnflno", e_unityatchmnflno);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<AttachVO> pdsPublicList = session.selectList("Attach-Mapper.selectAttachByEUnityatchmnflno", map, rowBounds);
		
		int totalCount = session.selectOne("Attach-Mapper.selectAttachByEUnityatchmnflnoCount", map);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("nowSort", nowSort);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("pdsPublicList", pdsPublicList);
		return dataMap;
	}
	
	@Override
	public Map<String, Object> selectAttachByDUnityatchmnflno(int d_unityatchmnflno, String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri);
		map.put("nowSort", nowSort);
		map.put("d_unityatchmnflno", d_unityatchmnflno);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<PdsDepVO> pdsDepList = session.selectList("Attach-Mapper.selectAttachByDUnityatchmnflno", map, rowBounds);
		int totalCount = session.selectOne("Attach-Mapper.selectAttachByDUnityatchmnflnoCount", map);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("nowSort", nowSort);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("pdsDepList", pdsDepList);
		
		return dataMap;
	}


	@Override
	public int getAnoSeqNextValue() throws SQLException {
		return session.selectOne("Attach-Mapper.selectAnoSeq");
	}



	@Override
	public AttachVO selectAttachPds(AttachVO attach) throws SQLException {
		
		return session.selectOne("Attach-Mapper.selectAttachPds",attach);
	}
	
	@Override
	public AttachVO selectAttachWork(AttachVO attach) throws SQLException {
		
		return session.selectOne("Attach-Mapper.selectAttachWork",attach);
	}
	
	@Override
	public AttachVO selectAttachMail(AttachVO attach) throws SQLException {
		
		return session.selectOne("Attach-Mapper.selectAttachMail",attach);
	}


	@Override
	public void updateDelForFile(AttachVO attach) throws SQLException {
		session.update("Attach-Mapper.updateDel", attach);
	}


	


	@Override
	 	public List<AttachVO> selectAttachByUniToSeltle(int uni) throws SQLException {
     		return session.selectList("Attach-Mapper.selectAttachByUniToSetle", uni);
     	}
	@Override
	public AttachVO selectAttachByUni(int uni) throws SQLException {
		return session.selectOne("Attach-Mapper.selectAttachByUni", uni);
	}


	@Override
	public void deleteAttach(int uni) throws SQLException {
		session.selectOne("Attach-Mapper.deleteAttach", uni);
	}


	

	@Override
	public void deleteAttachByAno(int ano) throws SQLException {
		session.delete("Attach-Mapper.deleteAttachByAno", ano);
	}


	@Override
	public void recoverFilesByAno(int ano) throws SQLException {
		session.update("Attach-Mapper.recoverDel", ano);
	}


	@Override
	public int isCntOfFiles(int ano) throws SQLException {
		return session.selectOne("isFileCount", ano);
	}


	@Override
	public void deleteAttachByAnoAndUni(int ano, int unityatchmnflno) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("ano", ano);
		map.put("unityatchmnflno", unityatchmnflno);
		session.delete("Attach-Mapper.deleteAttachByAnoAndUni",map);
	}
	
	@Override
	public List<AttachVO> selectAttachFromBoard(int uni) throws SQLException {
		return session.selectList("Attach-Mapper.selectAttachFromBoard", uni);
	}
	
	@Override
	public List<AttachVO> selectGalleryImages(AttachVO attach) throws SQLException {
		return session.selectList("Attach-Mapper.selectGalleryImagesForDetail", attach);
	}
	
	@Override
	public AttachVO selectGalleryListImage(AttachVO atch) throws SQLException {
		return session.selectOne("Attach-Mapper.selectGalleryListImage", atch);
	}


	@Override
	public void deleteAttachNotice(AttachVO attach) throws SQLException {
		
		session.update("Attach-Mapper.deleteAttachNotice", attach);
		
	}


	
}
