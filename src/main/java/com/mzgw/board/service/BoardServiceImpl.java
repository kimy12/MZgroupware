package com.mzgw.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.board.dao.BoardDAO;
import com.mzgw.board.dao.BoardDAOImpl;
import com.mzgw.dto.BoardVO;
import com.mzgw.dto.LikeToVO;
import com.mzgw.dto.PdsPrivateVO;
import com.mzgw.dto.PopupVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.PageMaker;

import java.util.List;

import com.mzgw.board.dao.BoardDAO;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.BReplyVO;
import com.mzgw.dto.BoardTypeVO;

public class BoardServiceImpl implements BoardService {

   private BoardDAO boardDAO;

   public void setBoardDAO(BoardDAO boardDAO) {
      this.boardDAO = boardDAO;
   }
   
   private AttachDAO attachDAO;
   public void setAttachDAO(AttachDAO attachDAO) {
      this.attachDAO = attachDAO;
   }
   
   @Override
   public Map<String, Object> searchBoardByBtno(int btno, String nowSort, Criteria cri) throws Exception {
      Criteria searchCri = (Criteria)cri;
      Map<String, Object> dataMap = new HashMap<String, Object>();
      
      List<BoardVO> searchBoardByBtno = boardDAO.searchBoardListByBtno(btno,nowSort,cri);
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(boardDAO.selectBoardListCount(searchCri,btno));
      
            
      dataMap.put("boardList", searchBoardByBtno);
      dataMap.put("pageMaker", pageMaker);
      dataMap.put("nowSort" ,nowSort);
      return dataMap;
   }
   
   @Override
   public Map<String, Object> getNotice(BoardVO board) throws SQLException {

      boardDAO.increaseViewCnt(board);

      Map<String, Object> dataMap = new HashMap<>();
      BoardVO notice = boardDAO.selectNoticeDetail(board);
      List<AttachVO> attachList = attachDAO.selectAttachFromBoard(board.getUnityatchmnflno());
      
      dataMap.put("notice", notice);
      dataMap.put("attachList", attachList);
   
      return dataMap;

   }
   
   @Override
   public Map<String, Object> getNoticeForModify(BoardVO board) throws SQLException {
      Map<String, Object> dataMap = new HashMap<>();
      BoardVO notice = boardDAO.selectNoticeDetail(board);
      List<AttachVO> attachList = attachDAO.selectAttachFromBoard(board.getUnityatchmnflno());
      
      dataMap.put("notice", notice);
      dataMap.put("attachList", attachList);
      
      return dataMap;
   }

   
   @Override
   public Map<String, Object> getPinlist(BoardVO board) throws SQLException {
      Map<String, Object> dataMap = new HashMap<String, Object>();
      
      List<BoardVO> getPinlist = boardDAO.getPinlist(board);
      
      dataMap.put("getPinlist", getPinlist);
      
      return dataMap;
   }

   
   @Override
   public void noticeAndFileModify(BoardVO board, List<AttachVO> attachList) throws SQLException {
      
      if(attachList == null && board.getIsAtch().equals("n")) {         
         board.setUnityatchmnflno(-1);
      }else {
    	 board.setUnityatchmnflno(board.getUnityatchmnflno());
      }
            
      if(attachList != null) {
         for (AttachVO attach : attachList) {
            int ano = attachDAO.getAnoSeqNextValue();
            attach.setUnityatchmnflno(board.getUnityatchmnflno());
            attach.setAno(ano);
            attachDAO.insertAttach(attach);
         }
      }
      
      boardDAO.updateNoticeBoard(board);
   
   }



   @Override
   public void insertNoticeBoard(BoardVO board,List<AttachVO> attachList) throws SQLException {   
      if(attachList != null) {
         board.setUnityatchmnflno(boardDAO.getSeqNextValue());
         for (AttachVO attach : attachList) {
            int ano = attachDAO.getAnoSeqNextValue();
            attach.setUnityatchmnflno(board.getUnityatchmnflno());
            attach.setAno(ano);
            attachDAO.insertAttach(attach);
         }
      }else {
            board.setUnityatchmnflno(-1);
      }

      
   
      boardDAO.insertNoticeBoard(board);
      
   }   

   @Override
   public void updateNoticeBoard(BoardVO board) throws SQLException {

      boardDAO.updateNoticeBoard(board);

   }

   @Override
   public void deleteNoticeBoard(BoardVO board) throws SQLException {

      boardDAO.deleteNoticeBoard(board);

   }

   @Override
   public List<BoardTypeVO> getBoardMenu() throws Exception {

      return boardDAO.selectBoardMenu();
   }

   @Override
   public List<BoardVO> getPopups() throws Exception {
      return boardDAO.getPopups();
   }

   @Override
   public int getPopupCount() throws Exception {
      return boardDAO.getPopupCount();
   }

//freeboard

   @Override
   public BoardVO getFreeBoard(BoardVO board) throws SQLException {
      boardDAO.increaseViewCnt(board);

      BoardVO freeboard = boardDAO.getFreeBoard(board);

      return freeboard;
   }
   
   @Override
   public BoardVO getFreeBoardForModify(BoardVO board) throws SQLException {
      BoardVO freeboard =boardDAO.getFreeBoard(board);
      return freeboard;
   }
      
   @Override
   public void insertFreeBoard(BoardVO board,List<AttachVO> attachList) throws SQLException {
      if(attachList != null) {
         board.setUnityatchmnflno(boardDAO.getSeqNextValue());
         for (AttachVO attach : attachList) {
            int ano = attachDAO.getAnoSeqNextValue();
            attach.setUnityatchmnflno(board.getUnityatchmnflno());
            attach.setAno(ano);
            attachDAO.insertAttach(attach);
         }
      }else {
            board.setUnityatchmnflno(-1);
      }
   
      boardDAO.insertFreeBoard(board);
   }

   @Override
   public void updateFreeBoard(BoardVO board) throws SQLException {
      boardDAO.updateFreeBoard(board);;

   }

   @Override
   public void deleteFreeBoard(BoardVO board) throws SQLException {
      boardDAO.deleteFreeBoard(board);

   }
   
   //eventboard
   
   //BoardVO board BoardVO에 있는 애들 board에 담아주는
   @Override
   public void insertEboard(BoardVO board) throws SQLException {
      
      
      //받아오는데이터가(board.getPin) null값이면 
      if(board.getPin() == null) {
         //n을 넣어준다.
         board.setPin("n");
      }else {
         board.setPin("y");
      }
      boardDAO.insertEboard(board);
      
   }

   @Override
   public void updateEboard(BoardVO board) throws SQLException {
   
      if(board.getPin() == null) {
         //n을 넣어준다.
         board.setPin("n");
      }else {
         board.setPin("y");
      }
      boardDAO.updateEboard(board);
      
   }
   
   @Override
   public BoardVO getEboardDetail(BoardVO board) throws SQLException {
      
      BoardVO getEboardDetail = boardDAO.getEboardDetail(board);
      
      return getEboardDetail;
      
   }

   
   @Override
   public void deleteEboard(int board_no) throws SQLException {

      boardDAO.deleteEboard(board_no);
   }

   
   
   
   
   
   //첨부파일
   @Override
   public Map<String, Object> getfileUploadList(int unityatchmnflno) throws SQLException {
      Map<String, Object> dataMap = new HashMap<String, Object>();
      
      List<AttachVO> upFileList = boardDAO.fileUploadList(unityatchmnflno);
      
      dataMap.put("upFileList", upFileList);
      
      return dataMap;
   }

   @Override
   public int getbreplyTotalCount(int board_no) throws SQLException {
      int breplyTotalCount =  boardDAO.getbreplyTotalCount(board_no);
      
      return breplyTotalCount;
   }

   @Override
   public int pinTotalCount(int boardtype_no) throws SQLException {
      
      int pinTotalCount = boardDAO.pinTotalCount(boardtype_no);
      return pinTotalCount;
   }

   @Override
   public void removeFilesInNoticeModify(AttachVO attach) throws Exception {
      
      attachDAO.deleteAttachNotice(attach);
      
   }

   @Override
   public void FreeAndFileModify(BoardVO board) throws SQLException {
      int bno = boardDAO.getSeqNextValue();
      System.out.println(bno);
      board.setUnityatchmnflno(bno);
      
      int i = 0;
      
      if(board.getAttachList() != null) {
         for (AttachVO attach : board.getAttachList()) {
            attach.setUnityatchmnflno(bno);
            attach.setAno(++i);
            attachDAO.insertAttach(attach);
            System.out.println("어태치리스트가 널");
         }
      }else {
         board.setUnityatchmnflno(-1);
      }
      boardDAO.updateFreeBoard(board);
      
   }

   @Override
   public void insertLike(LikeToVO likeTo) throws SQLException {
      boardDAO.insertLike(likeTo);
   }

   @Override
   public void deleteLike(LikeToVO likeTo) throws SQLException {
      boardDAO.deleteLike(likeTo);
   }

   @Override
   public void boardLikeup(LikeToVO likeTo) throws SQLException {
      boardDAO.boardLikeup(likeTo);
   }

   @Override
   public void boardLikedown(LikeToVO likeTo) throws SQLException {
      boardDAO.boardLikedown(likeTo);
   }
   
   @Override
   public LikeToVO selectLikeEmp(LikeToVO likeTo) throws SQLException {
      LikeToVO like = boardDAO.selectLikeEmp(likeTo);
      return like;
   }

	@Override
	public List<PopupVO> mainPopUpList() throws SQLException {
		return boardDAO.getPopUpList();
	}



   
   



}