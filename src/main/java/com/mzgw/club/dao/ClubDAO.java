package com.mzgw.club.dao;

import java.sql.SQLException;
import java.util.List;

import com.mzgw.dto.ClubConceptVO;
import com.mzgw.dto.ClubMemVO;
import com.mzgw.dto.ClubVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;

public interface ClubDAO {
	
	public List<ClubVO> clubList()throws SQLException;
	
	public List<ClubVO> selectClubList(Criteria cri)throws SQLException;
	
	public List<ClubConceptVO> conceptList() throws SQLException;
	
	public void insertClubMem(ClubMemVO clubMem) throws SQLException;
	
	public void deleteClub(int club_no) throws SQLException;
	
	public void insertClubPresident(EmpVO emp) throws SQLException;
	
	public void insertClub(ClubVO club) throws SQLException;
	
	public void insertClubConcept(ClubConceptVO concept) throws SQLException;
	
	public int cntMember (ClubMemVO no) throws SQLException;
	
	public int clubSeqNextVal() throws SQLException;
	
	public int selectClubCount()throws SQLException;
	
	public List<ClubMemVO> memList (EmpVO ncnm) throws SQLException;
	
	public List<ClubVO> clubDetail(int clubTypeNo) throws SQLException;
	
	public List<ClubMemVO> memListForDetail (int no) throws SQLException;
	
	public void updateStatus (ClubMemVO no) throws SQLException;
	
	public List<ClubConceptVO> conceptListByClubno(int no) throws SQLException;

	public void updateClub(ClubVO club)throws SQLException;

	void deleteClubConcept(ClubVO club) throws SQLException;
	
	public void deleteMem (ClubMemVO no) throws SQLException;
	
	//public int cntForClubMember(int no)throws SQLException;
}
