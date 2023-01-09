package com.mzgw.pds.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.FavVO;
import com.mzgw.dto.PdsDepVO;
import com.mzgw.dto.PdsPublicVO;
import com.mzgw.dto.RefrnVO;
import com.mzgw.pds.dao.PdsDepDAO;
import com.mzgw.pds.dao.PdsFavDAO;
import com.mzgw.refrn.dao.RefrnDAO;
import com.mzgw.util.Criteria;

public class PdsDepServiceImpl implements PdsDepService{
	
	private PdsDepDAO pdsDepDAO;
	public void setPdsDepDAO(PdsDepDAO pdsDepDAO) {
		this.pdsDepDAO = pdsDepDAO;
	}

	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	private PdsFavDAO pdsFavDAO;
	public void setPdsFavDAO(PdsFavDAO pdsFavDAO) {
		this.pdsFavDAO = pdsFavDAO;
	}

	@Override
	public void insertPdsDep(PdsDepVO pds) throws SQLException {
		int d_unityatchmnflno = pdsDepDAO.getSeqNextValue();
		pds.setD_unityatchmnflno(d_unityatchmnflno);
		
		
		if(pds.getAttachList() != null)
			for(AttachVO attach : pds.getAttachList()) {
				int ano = attachDAO.getAnoSeqNextValue();
				attach.setUnityatchmnflno(d_unityatchmnflno);
				attach.setAno(ano);
				attachDAO.insertAttach(attach);
			}
		pdsDepDAO.insertPdsDep(pds);
	}

	

	@Override
	public Map<String, Object> getPdsDepService(EmpVO dept, Criteria cri, String nowSort) throws Exception {
		
		Map<String, Object> dataMap = pdsDepDAO.pdsDepList(dept, nowSort, cri);
		
		List<PdsDepVO> pdsDepList = (List<PdsDepVO>)dataMap.get("pdsDepFolders");
		
		dataMap.put("pdsDepList", pdsDepList);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getAttachList(int d_unityatchmnflno, EmpVO ncnm, Criteria cri, String nowSort) throws Exception {
		Map<String, Object> dataMapForAttach = attachDAO.selectAttachByDUnityatchmnflno(d_unityatchmnflno, nowSort, cri);
		
		@SuppressWarnings("unchecked")
		List<AttachVO> pdsAttachList = (List<AttachVO>) dataMapForAttach.get("pdsDepList");
		List<FavVO> favList = pdsFavDAO.favList(ncnm);
		
		boolean nullCheck = pdsAttachList != null || favList != null;
		
		if(nullCheck) {
			for(AttachVO attach : pdsAttachList) {
				for(FavVO fav : favList) {
					if(attach.getAno() == fav.getAno()) {
						attach.setFav("1");
					}
				}
			}
		}
		
		dataMapForAttach.put("pdsAttachList", pdsAttachList);
		return dataMapForAttach;
	}
	@Override
	public void modifyTitle(PdsDepVO pds) throws SQLException {
		pdsDepDAO.updateTitle(pds);
	}
	
	@Override
	public List<Integer> iscntfiles(List<Integer> cntArray) throws SQLException {
		List<Integer> cntResults = new ArrayList<Integer>();
		
		for(int unity : cntArray) {
			cntResults.add(attachDAO.isCntOfFiles(unity));
		}
		
		return cntResults;
	}
	
	@Override
	public void deleteFolderForE(List<Integer> deleteArray) throws SQLException {
		for(int no : deleteArray) {
			pdsDepDAO.deleteFolder(no);
		}
	}
	
	@Override
	public void insertAttach(PdsDepVO pds) throws SQLException {
		
		if(pds.getAttachList() != null)
			for(AttachVO attach : pds.getAttachList()) {
				int ano = attachDAO.getAnoSeqNextValue();
				attach.setUnityatchmnflno(pds.getD_unityatchmnflno());
				attach.setAno(ano);
				attachDAO.insertAttach(attach);
			}
	}
}





















