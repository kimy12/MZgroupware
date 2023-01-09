package com.mzgw.club.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.ClubBoardVO;
import com.mzgw.dto.ClubLikeToVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;

public interface ClubBoardDAO {

	public  Map<String, Object> getClubNoticeBoardList(int clubNo,Criteria cri,String nowSort)throws SQLException;
	
	public  Map<String, Object> getClubBoardList(int clubNo,Criteria cri,String nowSort)throws SQLException;
	
	
//	첨부파일 시퀀스
	public int getSeqNextValue() throws SQLException;
	
// 자유게시판 글등록
	public void insertClubBoard(ClubBoardVO clubBoard) throws SQLException;
	
// 조회수 증가
	void increaseViewCnt(ClubBoardVO clubBoard) throws SQLException;
	
	
	public ClubBoardVO selectBoardByBoardNo(ClubBoardVO clubBoard) throws SQLException;
	
	public ClubBoardVO selectGalleryDetail(int no) throws SQLException;
	
//업로드한 파일리스트
	public List<AttachVO> fileUploadList(ClubBoardVO clubBoard) throws SQLException;
	
	//업로드 파일 수정
	public void modifyAttach(ClubBoardVO clubBoard) throws SQLException;
	
	//게시물 삭제
	void deleteClubBoard(ClubBoardVO clubBoard) throws SQLException;
	
	public  Map<String, Object> getClubGalleryList(int clubNo,Criteria cri,String nowSort) throws SQLException;
	
	public void deleteGalleryContent (ClubBoardVO clubBoard)throws SQLException;
	
//	좋아요 기능	
	
	public ClubLikeToVO selectLikeEmp(ClubLikeToVO likeTo) throws SQLException;
	
	public void insertLike(ClubLikeToVO likeTo) throws SQLException;
	
	public void deleteLike(ClubLikeToVO likeTo) throws SQLException;
	
	public void boardLikeup(ClubLikeToVO likeTo) throws SQLException;
	
	public void boardLikedown(ClubLikeToVO likeTo) throws SQLException;
	
	public EmpVO selectEmpByBno(ClubBoardVO clubBoard) throws SQLException;
	
	//핀 갯수 가져오기
	int pinTotalCount(int club_no) throws SQLException;
}
