package com.mzgw.club.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.ClubBoardVO;
import com.mzgw.dto.ClubLikeToVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.PageMaker;

public class ClubBoardDAOImpl implements ClubBoardDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public  Map<String, Object> getClubNoticeBoardList(int clubNo,Criteria cri,String nowSort) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		System.out.println(offset);
		System.out.println(limit);
		System.out.println(clubNo);
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nowSort", nowSort);
		map.put("cri", cri);
		map.put("club_no", clubNo);
		map.put("clubboardtype_no", 1);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<ClubBoardVO> clubNoticeBoardList = session.selectList("ClubBoard-Mapper.selectClubNoticeBoardList",map,rowBounds);

		int totalCount = session.selectOne("ClubBoard-Mapper.selectClubBoardListCount",map);

		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("clubNoticeBoardList", clubNoticeBoardList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("nowSort", nowSort);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getClubBoardList(int clubNo,Criteria cri,String nowSort) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		System.out.println(offset);
		System.out.println(limit);
		System.out.println(clubNo);
		
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nowSort", nowSort);
		map.put("cri", cri);
		map.put("club_no", clubNo);
		map.put("clubboardtype_no", 2);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		
		System.out.println(map.get("cri"));
		
		
		List<ClubBoardVO> selectClubBoardList = session.selectList("ClubBoard-Mapper.selectClubBoardList",map,rowBounds);
		
		int totalCount = session.selectOne("ClubBoard-Mapper.selectClubBoardListCount",map);
		
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("selectClubBoardList", selectClubBoardList);
		dataMap.put("pageMaker", pageMaker);
		
		
		return dataMap;
	}
	
//	첨부파일 시퀀스
	@Override
	public int getSeqNextValue() throws SQLException {
		return session.selectOne("ClubBoard-Mapper.selectclubBoardSeqNext");
	}
	
	@Override
	public void insertClubBoard(ClubBoardVO clubBoard) throws SQLException {
		session.insert("ClubBoard-Mapper.insertClubBoard", clubBoard);
	}
	
	
	@Override
	public  Map<String, Object> getClubGalleryList(int clubNo,Criteria cri,String nowSort) throws SQLException {
		

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		System.out.println(offset);
		System.out.println(limit);
		System.out.println(clubNo);
		
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nowSort", nowSort);
		map.put("cri", cri);
		map.put("club_no", clubNo);
		map.put("clubboardtype_no", 3);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		
		List<ClubBoardVO> selectGalleryListByClubNo = session.selectList("ClubBoard-Mapper.selectGalleryListByClubNo",map,rowBounds);
		
		
		int totalCount = session.selectOne("ClubBoard-Mapper.selectGalleryListByClubNoCount",map);
		
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("selectGalleryListByClubNo", selectGalleryListByClubNo);
		dataMap.put("pageMaker", pageMaker);
		
		
		return dataMap;
		
		
	}
	@Override
	public void increaseViewCnt(ClubBoardVO clubBoard) throws SQLException {
		session.insert("ClubBoard-Mapper.increaseViewCnt",clubBoard);
		
	}
	@Override
	public ClubBoardVO selectBoardByBoardNo(ClubBoardVO clubBoard) throws SQLException {
		
		ClubBoardVO cboard = session.selectOne("ClubBoard-Mapper.selectBoardByBoardNo",clubBoard);

		return cboard;
	}
	@Override
	public List<AttachVO> fileUploadList(ClubBoardVO clubBoard) throws SQLException {
		List<AttachVO> uploadList = session.selectList("ClubBoard-Mapper.clubBoardAttachList",clubBoard);
		return uploadList;
	}
	@Override
	public void modifyAttach(ClubBoardVO clubBoard) throws SQLException {
		session.update("ClubBoard-Mapper.modifyAttach",clubBoard);
		
	}
	@Override
	public void deleteClubBoard(ClubBoardVO clubBoard) throws SQLException {
		session.delete("ClubBoard-Mapper.deleteClubBoard",clubBoard);
		
	}
	@Override
	public ClubBoardVO selectGalleryDetail(int no) throws SQLException {
		return session.selectOne("ClubBoard-Mapper.selectGalleryDetail",no);
	}
	@Override
	public void deleteGalleryContent(ClubBoardVO clubBoard) throws SQLException {
		session.delete("ClubBoard-Mapper.deleteGalleryContent",clubBoard);
	}
	@Override
	public void insertLike(ClubLikeToVO likeTo) throws SQLException {
		session.insert("ClubBoard-Mapper.insertLike", likeTo);
		
	}
	@Override
	public void deleteLike(ClubLikeToVO likeTo) throws SQLException {
		session.update("ClubBoard-Mapper.deleteLike",likeTo);
		
	}
	@Override
	public void boardLikeup(ClubLikeToVO likeTo) throws SQLException {
		session.update("ClubBoard-Mapper.boardLikeup",likeTo);
		
	}
	@Override
	public void boardLikedown(ClubLikeToVO likeTo) throws SQLException {
		session.update("ClubBoard-Mapper.boardLikedown",likeTo);
		
	}
	@Override
	public ClubLikeToVO selectLikeEmp(ClubLikeToVO likeTo) throws SQLException {
		ClubLikeToVO like = session.selectOne("ClubBoard-Mapper.selectLikeEmp", likeTo);
		return like;
	}
	@Override
	public EmpVO selectEmpByBno(ClubBoardVO clubBoard) throws SQLException {
		EmpVO emp = session.selectOne("ClubBoard-Mapper.selectEmpByBno", clubBoard);
		return emp;
	}
	@Override
	public int pinTotalCount(int club_no) throws SQLException {
		return session.selectOne("ClubBoard-Mapper.pinTotalCount",club_no);
	}
	

}
