package com.mzgw.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.board.dao.CustomBoardDAO;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.BoardTypeVO;
import com.mzgw.dto.BoardVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.LikeToVO;
import com.mzgw.util.Criteria;

public class CustomBoardServiceImpl implements CustomBoardService {
	
	private CustomBoardDAO customBoardDAO;
	public void setCustomBoardDAO(CustomBoardDAO customBoardDAO) {
		this.customBoardDAO = customBoardDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	@Override
	public void registBoard(BoardTypeVO boardType) throws Exception {
		
		customBoardDAO.insertBoard(boardType);
	}

	@Override
	public BoardTypeVO getBoardDetail(int bno) throws Exception {
		
		return customBoardDAO.selectBoardDetail(bno);
	}

	@Override
	public void modifyBoard(BoardTypeVO boardType) throws Exception {
		
		customBoardDAO.updateBoard(boardType);
	}

	@Override
	public void removeBoard(int bno) throws Exception {
		
		customBoardDAO.deleteBoard(bno);
		
	}
	@Override
	public BoardTypeVO selectCustomBoard(int btno) throws Exception {
		
		BoardTypeVO boardName = customBoardDAO.selectCustomBoard(btno);		
		return boardName;
	}

	@Override
	public Map<String, Object> getCustomBoardList(int btno,Criteria cri, String nowSort) throws Exception {
		
		
		Map<String, Object> dataMap = customBoardDAO.selectBoardListByBtno(btno,cri, nowSort);
		BoardTypeVO boardName = customBoardDAO.selectCustomBoard(btno);
		
		dataMap.put("boardName", boardName);
		dataMap.put("nowSort" ,nowSort);
		
		return dataMap;
	}

	@Override
	public void registCustomBoard(BoardVO board) throws SQLException {
		
		
		int bno = customBoardDAO.getSeqNextValue();
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
		customBoardDAO.insertCustomBoard(board);
	}
	
	@Override
	public void modifyAttachByUni(BoardVO board) throws SQLException {
		
		int bno = customBoardDAO.getSeqNextValue();
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
		customBoardDAO.modifyAttach(board);
	}
		
	
		@Override
	public BoardVO getCustomBoardForModify(BoardVO board) throws SQLException {
			BoardVO cboard = customBoardDAO.selectBoardByBno(board);
			return cboard;
	}

	@Override
	public BoardVO getCustomBoard(BoardVO board) throws SQLException {
			customBoardDAO.increaseViewCnt(board);
			BoardVO cboard = customBoardDAO.selectBoardByBno(board);
			return cboard;
	}

	
	
	@Override
	public void modify(BoardVO board) throws SQLException {
		customBoardDAO.updateBoard( board);
		
	}

	@Override
	public void remove(BoardVO board) throws SQLException {
		customBoardDAO.deleteCustomBoard(board);
		
	}

	@Override
	public EmpVO selectEmpByBno(BoardVO board) throws SQLException {
		 EmpVO emp=customBoardDAO.selectEmpByBno(board);
		return emp;
	}

	@Override
	public LikeToVO selectLikeEmp(LikeToVO likeTo) throws SQLException {
		LikeToVO like = customBoardDAO.selectLikeEmp(likeTo);
		return like;
	}

	@Override
	public void insertLike(LikeToVO likeTo) throws SQLException {
		customBoardDAO.insertLike(likeTo);
	}

	@Override
	public void deleteLike(LikeToVO likeTo) throws SQLException {
		customBoardDAO.deleteLike(likeTo);
	}

	@Override
	public void boardLikeup(LikeToVO likeTo) throws SQLException {
		customBoardDAO.boardLikeup(likeTo);
	}

	@Override
	public void boardLikedown(LikeToVO likeTo) throws SQLException {
		customBoardDAO.boardLikedown(likeTo);
	}

	@Override
	public List<AttachVO> getfileUploadList(BoardVO board) throws Exception {
		List<AttachVO> upFileList = customBoardDAO.fileUploadList(board);
		return upFileList;
	}

	@Override
	public AttachVO getAttachByAno(int ano) throws SQLException {
		AttachVO attach = attachDAO.selectAttachByUni(ano);
		System.out.println("파일번호가져오기");
		return attach;
	}
	
	/* 삭제할 파일 번호 */
	@Override
	public void removeAttachByUni(int uni) throws SQLException {
		attachDAO.deleteAttach(uni);
		System.out.println("삭제할 파일번호가져오기");
	}
	

	
	
	
}
