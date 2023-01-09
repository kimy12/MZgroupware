package com.mzgw.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.BoardTypeVO;
import com.mzgw.dto.BoardVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.LikeToVO;
import com.mzgw.util.Criteria;

public interface CustomBoardDAO {
	
//커스텀 게시판
	public BoardTypeVO selectBoardDetail(int bno) throws SQLException;
	
	public BoardTypeVO selectCustomBoard(int bno) throws SQLException;
	
	public List<BoardVO> selectCustomBoardList(int bno) throws SQLException;
	
	public void insertBoard(BoardTypeVO boardType) throws SQLException;
	
	public void updateBoard(BoardTypeVO boardType) throws SQLException;
	
	public void deleteBoard(int bno) throws SQLException;
	
	
//	첨부파일 시퀀스
	public int getSeqNextValue() throws SQLException;
	
//업로드한 파일리스트
	public List<AttachVO> fileUploadList(BoardVO board) throws SQLException;
	
	
	public void modifyAttach(BoardVO board) throws SQLException;
	
	
//	게시물 
	public Map<String, Object> selectBoardListByBtno(int btno,Criteria cri,String nowSort) throws Exception ;

	public void insertCustomBoard(BoardVO board) throws SQLException;
	
	public BoardVO selectBoardByBno(BoardVO board) throws SQLException;
	
	void increaseViewCnt(BoardVO board) throws SQLException;

	void updateBoard( BoardVO board) throws SQLException;
	
	void deleteCustomBoard( BoardVO board) throws SQLException;
	
	public EmpVO selectEmpByBno(BoardVO board) throws SQLException;
	
	public LikeToVO selectLikeEmp(LikeToVO likeTo) throws SQLException;
	
	
	
	// 좋아요기능
	
	public void insertLike(LikeToVO likeTo) throws SQLException;
	
	public void deleteLike(LikeToVO likeTo) throws SQLException;
	
	public void boardLikeup(LikeToVO likeTo) throws SQLException;
	
	public void boardLikedown(LikeToVO likeTo) throws SQLException;
	
}