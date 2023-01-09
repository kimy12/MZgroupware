package com.mzgw.attach.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;


public interface AttachDAO {

	public void insertAttach(AttachVO attach) throws SQLException;

	public int selectUnitySeq() throws SQLException;
	
	public int isCntOfFiles(int ano) throws SQLException;
	
	public int getAnoSeqNextValue() throws SQLException;
	
	public AttachVO selectAttachPds(AttachVO attach)throws SQLException;
	
	public AttachVO selectAttachWork(AttachVO attach) throws SQLException;
	
	public AttachVO selectAttachMail(AttachVO attach) throws SQLException;
	
	public Map<String, Object> selectDeletedAttachByM(EmpVO ncnm, String nowSort, Criteria cri) throws Exception;
	
	public Map<String, Object> selectAttachByUnityatchmnflno(int m_unityatchmnflno,String nowSort, Criteria cri)throws Exception;
	
	public Map<String, Object> selectAttachByDUnityatchmnflno(int d_unityatchmnflno, String nowSort, Criteria cri) throws Exception;
	
	public Map<String, Object> selectAttachByEUnityatchmnflno(int e_unityatchmnflno, String nowSort, Criteria cri) throws Exception;
	
	public void updateDelForFile(AttachVO attach)throws SQLException;
	
	public void deleteAttachNotice(AttachVO attach) throws SQLException;
	
	public AttachVO selectAttachByUni(int uni)throws SQLException;
	
	public void deleteAttach(int uni) throws SQLException;
	
	public void deleteAttachByAno(int ano) throws SQLException;
	
	public void recoverFilesByAno(int ano) throws SQLException;

	public void deleteAttachByAnoAndUni(int ano, int unityatchmnflno) throws Exception;

	public List<AttachVO> selectAttachFromBoard(int uni) throws SQLException;

	List<AttachVO> selectAttachByUniToSeltle(int uni) throws SQLException;
	
	public AttachVO selectGalleryListImage(AttachVO atch) throws SQLException;
	
	public List<AttachVO> selectGalleryImages(AttachVO attach) throws SQLException;

}
