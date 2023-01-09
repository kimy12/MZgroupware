package com.mzgw.club.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.ClubConceptVO;
import com.mzgw.dto.ClubMemVO;
import com.mzgw.dto.ClubVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;

public interface ClubService {
	
	public Map<String, Object> getClubList(EmpVO ncnm) throws SQLException;
	
	public Map<String, Object> getCustomClubList(Criteria cri) throws SQLException;
	
	public void inserClubMember(ClubMemVO clubMem) throws SQLException;
	
	public void registClub(ClubVO club, List<ClubConceptVO> concept) throws Exception;
	
	public int countStaff (ClubMemVO no)throws SQLException;
	
	public Map<String, Object> getClubDetail(int no) throws SQLException;
	
	public void updateStatus(ClubMemVO no)throws SQLException;
	
	public void deleteMem(ClubMemVO no)throws SQLException;
	
	public void removeClub(int club_no)throws SQLException;

	void updateClub(ClubVO club, List<ClubConceptVO> concept) throws Exception;
	
//	public Map<String, Object> getConceptListByClubNo(int no) throws SQLException;
	
}
