package com.mzgw.club.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.ClubConceptVO;
import com.mzgw.dto.ClubMemVO;
import com.mzgw.dto.ClubVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;

public class ClubDAOImpl implements ClubDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ClubVO> clubList() throws SQLException {
		return session.selectList("Club-Mapper.selectClubListAll");
	}

	@Override
	public List<ClubConceptVO> conceptList() throws SQLException {
		return session.selectList("Club-Mapper.selectClubConcept");
	}

	@Override
	public void insertClubMem(ClubMemVO clubMem) throws SQLException {
		session.update("Club-Mapper.insertClubMem", clubMem);
	}

	@Override
	public int cntMember(ClubMemVO no) throws SQLException {
		return session.selectOne("Club-Mapper.cntForMember", no);
	}

	@Override
	public List<ClubMemVO> memList(EmpVO ncnm) throws SQLException {
		return session.selectList("Club-Mapper.selectClubNoByNcnm",ncnm);
	}

	@Override
	public List<ClubVO> clubDetail(int clubTypeNo) throws SQLException {
		return session.selectList("Club-Mapper.selectClubByClubNo", clubTypeNo);
	}

	@Override
	public List<ClubMemVO> memListForDetail(int no) throws SQLException {
		return session.selectList("Club-Mapper.selectClubMemByClubNo", no);
	}
	
	@Override
	public void updateStatus (ClubMemVO no) throws SQLException {
		session.update("Club-Mapper.updateStatus",no);
	}
	
	@Override
	public void deleteMem (ClubMemVO no) throws SQLException {
		session.update("Club-Mapper.deleteMem",no);
	}

	@Override
	public List<ClubConceptVO> conceptListByClubno(int no) throws SQLException {
		return session.selectList("Club-Mapper.selectClubConceptByClubno", no);
	}

	@Override
	public int selectClubCount() throws SQLException {
		
		return session.selectOne("Club-Mapper.selectClubCount");
	}

	@Override
	public List<ClubVO> selectClubList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return session.selectList("Club-Mapper.selectClubList",cri, rowBounds);
	}

	@Override
	public void deleteClub(int club_no) throws SQLException {
		
		session.update("Club-Mapper.deleteClub",club_no);
		session.update("Club-Mapper.deleteClubMem",club_no);
		
	}

	@Override
	public int clubSeqNextVal() throws SQLException {
		
		return session.selectOne("Club-Mapper.clubSeqNextVal");
	}

	@Override
	public void insertClubPresident(EmpVO emp) throws SQLException {
		session.update("Club-Mapper.insertClubPresident",emp);
		
	}

	@Override
	public void insertClubConcept(ClubConceptVO concept) throws SQLException {
		session.update("Club-Mapper.insertClubConcept",concept);
		
	}

	@Override
	public void insertClub(ClubVO club) throws SQLException {
		session.update("Club-Mapper.insertClub",club);
		
	}

	@Override
	public void updateClub(ClubVO club) throws SQLException {
		// TODO Auto-generated method stub
		session.update("Club-Mapper.updateClub",club);
	}

	
	@Override
	public void deleteClubConcept(ClubVO club) throws SQLException {
		// TODO Auto-generated method stub
		session.update("Club-Mapper.deleteClubConcept",club.getClub_no());
	}

}
