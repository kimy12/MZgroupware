package com.mzgw.club.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.BoardVO;
import com.mzgw.dto.ClubBoardVO;
import com.mzgw.dto.ClubLikeToVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;


public interface ClubBoardService {

	public Map<String, Object> getClubBoardList(int clubNo,Criteria cri, String nowSort) throws SQLException;
	
	public Map<String, Object> getClubNoticeList(int clubNo,Criteria cri, String nowSort) throws SQLException;
	
	public Map<String, Object> getClubFreeBoardList(int clubNo,Criteria cri, String nowSort) throws SQLException;
	
	public Map<String, Object> getGalleryImageList(AttachVO attach) throws SQLException;
	

	public void registClubBoard(ClubBoardVO clubBoard) throws SQLException;
	
	public ClubBoardVO getClubBoard(ClubBoardVO clubBoard) throws SQLException;
	
	public ClubBoardVO getClubBoardForModify(ClubBoardVO clubBoard) throws SQLException;
	
	public ClubBoardVO getGalleryDetail(int no) throws SQLException;
	
	public void remove(ClubBoardVO clubBoard) throws SQLException;
	
	
	// 업로드 파일리스트
		public List<AttachVO> getfileUploadList(ClubBoardVO clubBoard) throws Exception;
	// 파일 수정 
		public void modifyAttachByUnifromclub(ClubBoardVO clubBoard) throws SQLException;
	
	public AttachVO getGalleryListImage(AttachVO atch)throws SQLException;
	
	public AttachVO getGalleryImageForDetail(AttachVO atch) throws SQLException;
	
	public void deleteGalleryContent (ClubBoardVO clubBoard)throws SQLException;
	
	
//	좋아요 기능	
	

	public ClubLikeToVO selectLikeEmp(ClubLikeToVO likeTo) throws SQLException;
	
	public void insertLike(ClubLikeToVO likeTo) throws SQLException;
	
	public void deleteLike(ClubLikeToVO likeTo) throws SQLException;
	
	public void boardLikeup(ClubLikeToVO likeTo) throws SQLException;
	
	public void boardLikedown(ClubLikeToVO likeTo) throws SQLException;
	
	public EmpVO selectEmpByBno(ClubBoardVO clubBoard) throws SQLException;
	
	//pincount
	int pinTotalCount(int clubNo) throws SQLException;
	
}
