package com.mzgw.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.BReplyVO;
import com.mzgw.dto.BoardTypeVO;
import com.mzgw.dto.BoardVO;
import com.mzgw.dto.LikeToVO;
import com.mzgw.dto.PopupVO;
import com.mzgw.util.Criteria;

public interface BoardService {
   
   Map<String, Object> searchBoardByBtno(int board_no, String nowSort, Criteria cri) throws Exception;
   
   Map<String, Object> getNotice(BoardVO board) throws SQLException;
   
   Map<String, Object> getNoticeForModify(BoardVO board) throws SQLException;
   
   void insertNoticeBoard(BoardVO board,List<AttachVO> attachList) throws SQLException;
   
   public void removeFilesInNoticeModify(AttachVO attach) throws Exception;
   
   public void noticeAndFileModify(BoardVO board, List<AttachVO> attachList) throws SQLException;
   
   void updateNoticeBoard (BoardVO board) throws SQLException;
   
   void deleteNoticeBoard(BoardVO board) throws SQLException;
   
   List<BoardTypeVO> getBoardMenu() throws Exception;
   
   Map<String, Object> getPinlist(BoardVO board) throws SQLException;
   
   //pincount
   int pinTotalCount(int boardtype_no) throws SQLException;
   
   // popup 가져오기
   List<BoardVO> getPopups() throws Exception;
   
   int getPopupCount() throws Exception;
   
   /* 메일에 업로드한 파일 리스트 가져오기 */
   Map<String, Object> getfileUploadList(int unityatchmnflno) throws SQLException;
   
   //댓글개수
   int getbreplyTotalCount(int board_no) throws SQLException;
   
   //freeboard
   
   
   BoardVO getFreeBoard(BoardVO board) throws SQLException;
   
   public BoardVO getFreeBoardForModify(BoardVO board) throws SQLException;
   
   public void insertFreeBoard(BoardVO board,List<AttachVO> attachList) throws SQLException;
   
   void updateFreeBoard (BoardVO board) throws SQLException;
   
   void deleteFreeBoard (BoardVO board) throws SQLException;

   //eventboard
   
   
   void insertEboard (BoardVO board) throws SQLException;
   
   void updateEboard (BoardVO board) throws SQLException;
   
   //경조사게시판 detail
   BoardVO getEboardDetail(BoardVO board) throws SQLException;
      
   void deleteEboard(int board_no) throws SQLException;
   
   
//   BoardVO getEventBoard(BoardVO board) throws SQLException;
//   
//   BoardVO getCEventBoard(BoardVO board) throws SQLException;
//   
//   void insertEventBoard (BoardVO board,List<AttachVO> attachList) throws SQLException;
//   
//   void updateEventBoard (BoardVO board) throws SQLException;
//   
//   void deleteEventBoard (BoardVO board) throws SQLException;

   
   public void FreeAndFileModify(BoardVO board) throws SQLException;
   
//   좋아요 기능
   
   public LikeToVO selectLikeEmp(LikeToVO likeTo) throws SQLException;
   
   public void insertLike(LikeToVO likeTo) throws SQLException;
   
   public void deleteLike(LikeToVO likeTo) throws SQLException;
   
   public void boardLikeup(LikeToVO likeTo) throws SQLException;
   
   public void boardLikedown(LikeToVO likeTo) throws SQLException;
   
   public List<PopupVO> mainPopUpList()throws SQLException;
   
}