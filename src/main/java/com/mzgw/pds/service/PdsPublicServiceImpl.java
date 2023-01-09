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
import com.mzgw.dto.PdsPrivateVO;
import com.mzgw.dto.PdsPublicVO;
import com.mzgw.pds.dao.PdsFavDAO;
import com.mzgw.pds.dao.PdsPublicDAO;
import com.mzgw.util.Criteria;

public class PdsPublicServiceImpl implements PdsPublicService{
	
	private PdsPublicDAO pdsPublicDAO;
	public void setPdsPublicDAO(PdsPublicDAO pdsPublicDAO) {
		this.pdsPublicDAO = pdsPublicDAO;
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
	public Map<String, Object> getPdsPublicService(Criteria cri, String nowSort) throws Exception {
		
		Map<String, Object> dataMap = pdsPublicDAO.pdsPublicList(nowSort, cri);
		
		List<PdsPublicVO> pdsPublicList = (List<PdsPublicVO>)dataMap.get("pdsPublicFolders");
		
		dataMap.put("pdsPublicList", pdsPublicList);
		
		return dataMap;
	}

	@Override
	public void insert(PdsPublicVO pds) throws SQLException {
		int e_unityatchmnflno = pdsPublicDAO.getSeqNextValue();
		pds.setE_unityatchmnflno(e_unityatchmnflno);
		
		
		if(pds.getAttachList() != null)
			for(AttachVO attach : pds.getAttachList()) {
				int ano = attachDAO.getAnoSeqNextValue();
				attach.setUnityatchmnflno(e_unityatchmnflno);
				attach.setAno(ano);
				attachDAO.insertAttach(attach);
			}
		System.out.println("PdsPublicVO:찍찍?"+pds);
		pdsPublicDAO.insertPdsPublic(pds);
	}

	@Override
	public Map<String, Object> getAttachList(int e_unityatchmnflno, EmpVO ncnm, Criteria cri, String nowSort) throws Exception {
		Map<String, Object> dataMapForAttach = attachDAO.selectAttachByEUnityatchmnflno(e_unityatchmnflno,nowSort,cri);
		
		@SuppressWarnings("unchecked")
		List<AttachVO> pdsAttachList = (List<AttachVO>) dataMapForAttach.get("pdsPublicList");
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
	public void deleteFolderForE(List<Integer> deleteArray) throws SQLException {
		for(int no : deleteArray) {
			pdsPublicDAO.deleteFolder(no);
		}
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
	public void modifyTitle(PdsPublicVO pds) throws SQLException {
		pdsPublicDAO.updateTitle(pds);
	}
	
//	@Override
//	public Map<String, Object> getOnlyAttachList(PdsPublicVO e_unityatchmnflno) throws SQLException {
//		Map<String, Object> dataMap = new HashMap<String, Object>();
//		
//		List<RefrnVO> pdsRefrn = refrnDAO.selectRefrnPpl(e_unityatchmnflno);
//		dataMap.put("pdsRefrn", pdsRefrn);
//		return dataMap;
//	}
	
	@Override
	public void insertAttach(PdsPublicVO pds) throws SQLException {
		
		if(pds.getAttachList() != null)
			for(AttachVO attach : pds.getAttachList()) {
				int ano = attachDAO.getAnoSeqNextValue();
				attach.setUnityatchmnflno(pds.getE_unityatchmnflno());
				attach.setAno(ano);
				attachDAO.insertAttach(attach);
			}
	}

	@Override
	public void modifyDelFromAtch(List<AttachVO> attachList) throws SQLException {
		for (AttachVO vo : attachList) {
			attachDAO.updateDelForFile(vo);
		}
	}

}



















