package com.mzgw.pds.service;

import java.io.File;
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
import com.mzgw.dto.RefrnVO;
import com.mzgw.pds.dao.PdsFavDAO;
import com.mzgw.pds.dao.PdsPrivateDAO;
import com.mzgw.refrn.dao.RefrnDAO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeFileName;

public class PdsPrivateServiceImpl implements PdsPrivateService{
	
	private PdsPrivateDAO pdsPrivateDAO;
	public void setPdsPrivateDAO(PdsPrivateDAO pdsPrivateDAO) {
		this.pdsPrivateDAO = pdsPrivateDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	private RefrnDAO refrnDAO;
	public void setRefrnDAO(RefrnDAO refrnDAO) {
		this.refrnDAO = refrnDAO;
	}
	
	private PdsFavDAO pdsFavDAO;
	public void setPdsFavDAO(PdsFavDAO pdsFavDAO) {
		this.pdsFavDAO = pdsFavDAO;
	}
	
	@Override
	public void insert(PdsPrivateVO pds, List<RefrnVO>refList) throws SQLException {
		
		int m_unityatchmnflno = pdsPrivateDAO.getSeqNextValue();
		pds.setM_unityatchmnflno(m_unityatchmnflno);
		
		
//		int i = 0;
		if(pds.getAttachList() != null)
			for (AttachVO attach : pds.getAttachList()) {
				int ano = attachDAO.getAnoSeqNextValue();
				attach.setUnityatchmnflno(m_unityatchmnflno);
				attach.setAno(ano);
				attachDAO.insertAttach(attach);
			}
		int k=1;
		if(refList.size() >0 || refList.get(0).getEmp_nickname() != null) {
			int refrn_unity_no = pdsPrivateDAO.getRefrnSeqNextValue();
			pds.setRefrn_unity_no(refrn_unity_no);
			
			for(RefrnVO vo : refList) {
				vo.setRefrn_unity_no(refrn_unity_no);
				vo.setRefrn_no(k++);
				refrnDAO.insertRefrn(vo);
				}
		}
		pdsPrivateDAO.insertPdsPrivate(pds);
	}
	
	@Override
	public void refrnInsert(List<RefrnVO>refList)throws SQLException {
		
		
		if(refList.size() >0 || refList.get(0).getEmp_nickname() != null) {
			int k = 1;
			for(RefrnVO vo : refList) {
				vo.setRefrn_no(k++);
				refrnDAO.insertRefrn(vo);
			}
		}
	}
	

	@Override
	public void insertAttach(PdsPrivateVO pds) throws SQLException {
		
		if(pds.getAttachList() != null)
		System.out.println("pds.getAttachList():" + pds.getAttachList());
			for(AttachVO attach : pds.getAttachList()) {
				int ano = attachDAO.getAnoSeqNextValue();
				attach.setUnityatchmnflno(pds.getM_unityatchmnflno());
				attach.setAno(ano);
				attachDAO.insertAttach(attach);
			}
	}
	
	@Override
	public Map<String, Object> getPdsPrivateService(EmpVO ncnm, Criteria cri, String nowSort) throws Exception {
		
		Map<String, Object> dataMap = pdsPrivateDAO.pdsPrivateList(ncnm, nowSort, cri);
		
		@SuppressWarnings("unchecked")
		List<PdsPrivateVO> pdsPrivateList = (List<PdsPrivateVO>)dataMap.get("pdsPrivateFolders");
		
		dataMap.put("pdsPrivateList", pdsPrivateList);
		
		return dataMap;
	}
	

	@Override
	public Map<String, Object> getPdsBinList(EmpVO ncnm, Criteria cri, String nowSort) throws Exception {
		Map<String, Object> dataMapForBin = attachDAO.selectDeletedAttachByM(ncnm, nowSort, cri);
		
		List<AttachVO> pdsBinFilesList = (List<AttachVO>)dataMapForBin.get("pdsBinList");
		
		dataMapForBin.put("pdsBinFilesList", pdsBinFilesList);
		return dataMapForBin;
	}
	
	@Override
	public Map<String, Object> getAttachList(int m_unityatchmnflno, EmpVO ncnm, Criteria cri, String nowSort) throws Exception {
		Map<String, Object> dataMapForAttach = attachDAO.selectAttachByUnityatchmnflno(m_unityatchmnflno, nowSort, cri);
		
		List<AttachVO> pdsAttachList = (List<AttachVO>) dataMapForAttach.get("pdsPrivateList");
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
	public Map<String, Object> getOnlyAttachList(PdsPrivateVO m_unityatchmnflno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<RefrnVO> pdsRefrn = refrnDAO.selectRefrnPpl(m_unityatchmnflno);
		dataMap.put("pdsRefrn", pdsRefrn);
		return dataMap;
	}

	
	@Override
	public List<String> downloadAttachList(List<AttachVO> attach) throws SQLException {
		List<AttachVO> attachList = new ArrayList<>();
		List<String> filePathList = new ArrayList<>(); 
		
		for(AttachVO atch : attach) {
			attachList.add(attachDAO.selectAttachPds(atch));
		}
		
		for(int i = 0; i < attachList.size(); i++) {
			String temp = attachList.get(i).getUploadPath() + File.separator + attachList.get(i).getFileName(); 
			filePathList.add(temp);
		}
			
		return filePathList;
	}
	
	@Override
	public Map<String, Object> getRefrnList(EmpVO ncnm) throws SQLException {
		
		Map<String, Object> dataMapForRefrn = new HashMap<String, Object>();
		
		List<PdsPrivateVO> pdsRefrnPrivateList = pdsPrivateDAO.refrnPrivateList(ncnm);
		
		dataMapForRefrn.put("pdsRefrnPrivateList", pdsRefrnPrivateList);
		
		return dataMapForRefrn;
	}
	
	@Override
	public void modifyTitle(PdsPrivateVO pds) throws SQLException {
		pdsPrivateDAO.updateTitle(pds);
	}
	
	@Override
	public void deleteRefrn(RefrnVO vo) throws SQLException {
		refrnDAO.deleteAllByUnity(vo);
	}
	
	
	
	@Override
	public void modifyDel(List<Integer>deleteArray) throws SQLException {
		
		for(int no : deleteArray) {
			int cnt = attachDAO.isCntOfFiles(no);
			pdsPrivateDAO.toBin(no);
		}
	}


	@Override
	public AttachVO getAttach(AttachVO attach) throws SQLException {
		
		AttachVO attachPds = attachDAO.selectAttachPds(attach);
		
		return attachPds;
	}

	@Override
	public void modifyDelFromAtch(List<AttachVO> attachList) throws SQLException {
		
		for (AttachVO vo : attachList) {
			attachDAO.updateDelForFile(vo);
		}
	}

	@Override
	public void modifyRecover(List<Integer> deleteArray) throws SQLException {
		for(int no : deleteArray) {
			pdsPrivateDAO.recoverFromBin(no);
		}
		
	}

	@Override
	public void deleteFolder(List<Integer> deleteArray) throws SQLException {
		
		for(int no : deleteArray) {
			pdsPrivateDAO.deleteFolder(no);
		}
	}

	@Override
	public void deletefiles (List<Integer>deleteArrayString) throws SQLException {
		for(int ano : deleteArrayString) {
			attachDAO.deleteAttachByAno(ano);
		}
	}

	@Override
	public void recoverfiles(List<Integer> recoverArray) throws SQLException {
		for(int ano : recoverArray) {
			attachDAO.recoverFilesByAno(ano);
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

	
	

	

	
}
