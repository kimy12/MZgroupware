package com.mzgw.club.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mzgw.club.dao.ClubDAO;
import com.mzgw.dto.ClubConceptVO;
import com.mzgw.dto.ClubMemVO;
import com.mzgw.dto.ClubVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.PageMaker;

public class ClubServiceImpl implements ClubService{
	
	private ClubDAO clubDAO;
	public void setClubDAO(ClubDAO clubDAO) {
		this.clubDAO = clubDAO;
	}
	
	@Override
	public Map<String, Object> getClubList(EmpVO empl_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ClubVO> clubList = clubDAO.clubList();
		List<ClubConceptVO> conceptList = clubDAO.conceptList();
		List<ClubMemVO> memList = clubDAO.memList(empl_no);
		
		boolean nullCheck = clubList != null || memList != null;
		
		if(nullCheck) {
			for(ClubVO club : clubList) {
				for(ClubMemVO clubmem : memList) {
					if(club.getClub_no() == clubmem.getClub_no()) {
						club.setClubMember("1");
					}
				}
			}
		}
		
		dataMap.put("conceptList", conceptList);
		dataMap.put("clubList", clubList);
		return dataMap;
	}

	@Override
	public void inserClubMember(ClubMemVO clubMem) throws SQLException {
		clubDAO.insertClubMem(clubMem);
	}

	@Override
	public int countStaff(ClubMemVO no) throws SQLException {
		int cnt = clubDAO.cntMember(no);
		
		return cnt;
	}

	@Override
	public Map<String, Object> getClubDetail(int no) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ClubVO> clubDetail = clubDAO.clubDetail(no);
		
		List<ClubMemVO> clubMemList = clubDAO.memListForDetail(no);
		List<ClubConceptVO> conceptList = clubDAO.conceptListByClubno(no);
		dataMap.put("conceptList", conceptList);
		dataMap.put("clubMemList", clubMemList);
		dataMap.put("clubDetail", clubDetail);
		return dataMap;
	}

	@Override
	public void updateStatus(ClubMemVO no) throws SQLException {
		clubDAO.updateStatus(no);
	}

	@Override
	public Map<String, Object> getCustomClubList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ClubVO> clubList = clubDAO.selectClubList(cri);
		
		int totalCount = clubDAO.selectClubCount();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setDisplayPageNum(5);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("clubList", clubList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void removeClub(int club_no) throws SQLException {
		
		clubDAO.deleteClub(club_no);
		
	}

	@Override
	public void registClub(ClubVO club, List<ClubConceptVO> concept) throws Exception {
		EmpVO emp = new EmpVO();
		int seq = clubDAO.clubSeqNextVal();

		emp.setClub_no(seq);
		emp.setPstate("Y");
		emp.setState("Y");
		emp.setNcnm(club.getPresident());
		club.setClub_no(seq);
		
		clubDAO.insertClubPresident(emp);
		clubDAO.insertClub(club);
		
		for(ClubConceptVO con : concept) {
			con.setClub_no(seq);
			clubDAO.insertClubConcept(con);
		}
		
	}

	@Override
	public void deleteMem(ClubMemVO no) throws SQLException {
		clubDAO.deleteMem(no);
	}
	
	@Override
	public void updateClub(ClubVO club, List<ClubConceptVO> concept) throws Exception {
		
		clubDAO.updateClub(club);
		
		clubDAO.deleteClubConcept(club);
		
		for(ClubConceptVO con : concept) {
			con.setClub_no(club.getClub_no());
			
			clubDAO.insertClubConcept(con);
		}
		
	}
	
}
