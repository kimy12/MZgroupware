package com.mzgw.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.BoardTypeVO;
import com.mzgw.dto.BoardVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.LikeToVO;
import com.mzgw.util.Criteria;

public interface CustomBoardService {
	
//	커스텀 게시판
	public void registBoard(BoardTypeVO boardType) throws Exception;
	
	public BoardTypeVO getBoardDetail(int bno) throws Exception;
	
	public Map<String,Object> getCustomBoardList(int btno,Criteria cri, String nowSort) throws Exception;
	
	public void modifyBoard(BoardTypeVO boardType) throws Exception;
	
	public void removeBoard(int btno) throws Exception;
	
	
	
//	커스텀게시판 게시물
	
	public void registCustomBoard(BoardVO board) throws SQLException;
	
	public BoardVO getCustomBoardForModify(BoardVO board) throws SQLException;
	
	public BoardVO getCustomBoard(BoardVO board) throws SQLException;
	
	public void modify(BoardVO board) throws SQLException;
	
	public void remove(BoardVO board) throws SQLException;

	public BoardTypeVO selectCustomBoard(int btno) throws Exception;
	
	public EmpVO selectEmpByBno(BoardVO board) throws SQLException;
	
	public LikeToVO selectLikeEmp(LikeToVO likeTo) throws SQLException;
	
// 업로드 파일리스트
	
	public List<AttachVO> getfileUploadList(BoardVO board) throws Exception;
	/* 파일번호가져오기 */
	public AttachVO getAttachByAno(int ano) throws SQLException;
	//삭제할 파일 번호
	public void removeAttachByUni(int uni) throws SQLException;
	//파일 수정 
	public void modifyAttachByUni(BoardVO board) throws SQLException;
	
//	좋아요 기능
	
	public void insertLike(LikeToVO likeTo) throws SQLException;
	
	public void deleteLike(LikeToVO likeTo) throws SQLException;
	
	public void boardLikeup(LikeToVO likeTo) throws SQLException;
	
	public void boardLikedown(LikeToVO likeTo) throws SQLException;
	
	
	
}
