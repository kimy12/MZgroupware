package com.mzgw.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.BReplyVO;
import com.mzgw.dto.BoardTypeVO;
import com.mzgw.dto.BoardVO;
import com.mzgw.dto.LikeToVO;
import com.mzgw.dto.PopupVO;
import com.mzgw.util.Criteria;


public interface BoardDAO {
	
	List<BoardTypeVO> selectBoardMenu() throws SQLException;
	
	//게시판 리스트 출력 
	List<BoardVO> searchBoardListByBtno (int boardtype_no, String nowSort, Criteria cri) throws Exception;
	
	int selectBoardListCount(Criteria cri,int boardtype_no) throws Exception;
	
	BoardVO selectNoticeDetail(BoardVO board) throws SQLException;
	
	void insertNoticeBoard (BoardVO board) throws SQLException;
	
	void updateNoticeBoard (BoardVO board) throws SQLException;
	
	void deleteNoticeBoard (BoardVO board) throws SQLException;

	int selectNoticeBoardSeqNext() throws SQLException;
	
	void increaseViewCnt(BoardVO board) throws SQLException;
	
	public BoardVO selectBoardByBno(BoardVO board) throws SQLException;
	
	List<BoardVO> getPinlist(BoardVO board) throws SQLException;
	
	int pinTotalCount(int boardtype_no) throws SQLException;
	
	//댓글개수
	int getbreplyTotalCount(int board_no) throws SQLException;
	
	/* 첨부파일 코드 번호 */
	public int getSeqNextValue() throws SQLException;
	
	List<AttachVO> fileUploadList(int unityatchmnflno) throws SQLException;
	

	List<BoardVO> getPopups() throws SQLException;
	
	int getPopupCount() throws Exception;
	
	//freeboard
	
	BoardVO getFreeBoard(BoardVO board) throws SQLException;
	
	void insertFreeBoard (BoardVO board) throws SQLException;
	
	void updateFreeBoard (BoardVO board) throws SQLException;
	
	void deleteFreeBoard (BoardVO board) throws SQLException;

	int selectFreeBoardSeqNext() throws SQLException;
	
	//eventboard
	
	
	void insertEboard (BoardVO board) throws SQLException;
	
	void updateEboard (BoardVO board) throws SQLException;
	
	//경조사게시판 detail
	//BoardVO board - resulttype db에서 가지고 와서 화면에 뿌리는 데이터타입           
	//(BoardVO board) - parametertype - db로 보내는 데이터 타입 
	BoardVO getEboardDetail(BoardVO board) throws SQLException;
	
	void deleteEboard (int board_no) throws SQLException;
	
	// 좋아요기능
	
		public void insertLike(LikeToVO likeTo) throws SQLException;
		
		public void deleteLike(LikeToVO likeTo) throws SQLException;
		
		public void boardLikeup(LikeToVO likeTo) throws SQLException;
		
		public void boardLikedown(LikeToVO likeTo) throws SQLException;
		
		public LikeToVO selectLikeEmp(LikeToVO likeTo) throws SQLException;
	
	
	
	
//	
//	BoardVO getEventBoard(BoardVO board) throws SQLException;
//	
//	BoardVO getCEventBoard(BoardVO board) throws SQLException;
//	
//	void insertEventBoard (BoardVO board) throws SQLException;
//	
//	void updateEventBoard (BoardVO board) throws SQLException;
//	
//	void deleteEventBoard (BoardVO board) throws SQLException;
//
//	int selectEventBoardSeqNext() throws SQLException;


	/* 팝업 리스트 */
	public List<PopupVO> getPopUpList()throws SQLException;
	
	
	
}
