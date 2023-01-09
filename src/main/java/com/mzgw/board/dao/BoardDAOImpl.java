package com.mzgw.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.BoardTypeVO;
import com.mzgw.dto.BoardVO;
import com.mzgw.dto.LikeToVO;
import com.mzgw.dto.PopupVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;

public class BoardDAOImpl implements BoardDAO {

	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<BoardTypeVO> selectBoardMenu() throws SQLException {
		return session.selectList("CustomBoard-Mapper.selectBoardMenu");
	}

	public List<BoardVO> searchBoardListByBtno(int boardtype_no, String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		System.out.println("=========================================================");
		Map<String, Object> map = MakeVOToMap.toMap(cri);
		map.put("nowSort", nowSort);
		map.put("boardtype_no", boardtype_no);
		
		
		
		List<BoardVO> boardList = session.selectList("Board-Mapper.searchBoardByBtno", map, rowBounds);

		return boardList;
	}
	
	@Override
	public int selectBoardListCount(Criteria cri,int boardtype_no) throws Exception {
		Map<String, Object> map=null;
		map = MakeVOToMap.toMap(cri);
		map.put("boardtype_no", boardtype_no);
		int totalCount = session.selectOne("Board-Mapper.selectBoardListCount", map);
		
		return totalCount;
	}


	@Override
	public BoardVO selectNoticeDetail(BoardVO board) throws SQLException {
		
		BoardVO noticeboard = session.selectOne("Board-Mapper.selectNoticeDetail", board);
		
		return noticeboard;
		
	}
	
	@Override
	public void insertNoticeBoard(BoardVO board) throws SQLException {

		session.insert("Board-Mapper.insertNoticeBoard", board);
		if (!board.getStart_date().isEmpty()) {
			session.insert("Popup-Mapper.insertPopup", board);
		}
	}
	
	@Override
	public void updateNoticeBoard(BoardVO board) throws SQLException {
		int popupCount = session.selectOne("Popup-Mapper.popupCount", board);
		
		session.update("Board-Mapper.updateNoticeBoard", board);
		
		if (board.getStart_date().isEmpty()) {
			session.update("Popup-Mapper.deletePopup", board);
		}else {
			if(popupCount == 0) {
				session.insert("Popup-Mapper.insertPopup", board);
			}else {
				session.update("Popup-Mapper.updatePopup", board);							
			}
		}
		
	}
	
	@Override
	public int getPopupCount() throws Exception {
		return session.selectOne("Popup-Mapper.popupTotalCount");
	}

	@Override
	public BoardVO selectBoardByBno(BoardVO board) throws SQLException {
		BoardVO cboard = session.selectOne("Board-Mapper.selectBoardByBno", board);

		return cboard;
	}
	
	

	@Override
	public void deleteNoticeBoard(BoardVO board) throws SQLException {

		session.delete("Board-Mapper.deleteNoticeBoard", board);

	}

	@Override
	public int selectNoticeBoardSeqNext() throws SQLException {

		return session.selectOne("Board-Mapper.selectNoticeBoardSeqNext");

	}

	@Override
	public void increaseViewCnt(BoardVO board) throws SQLException {

		session.insert("Board-Mapper.increaseViewCnt", board);

	}


	
	@Override
	public List<BoardVO> getPopups() throws SQLException {
		return session.selectList("Popup-Mapper.selectPopup");
	}

	
	@Override
	public List<BoardVO> getPinlist(BoardVO board) throws SQLException {
		
		int offset = 1;
		int limit = 5;
		
		RowBounds rowbounds = new RowBounds(offset,limit);
		return session.selectList("Board-Mapper.getPinlist", board,rowbounds);
	}

//FreeBoard------------------------
	
	@Override
	public BoardVO getFreeBoard(BoardVO board) throws SQLException {
		System.out.println(board.getBoard_no());
		System.out.println(board.getBoardtype_no());
		BoardVO noticeboard = session.selectOne("Board-Mapper.selectNoticeDetail", board);

		return noticeboard;
	}


	@Override
	public void insertFreeBoard(BoardVO board) throws SQLException {
		session.insert("Board-Mapper.insertFreeBoard", board);
		
	}

	@Override
	public void updateFreeBoard(BoardVO board) throws SQLException {
		session.update("Board-Mapper.updateFreeboard", board);
		
	}

	@Override
	public void deleteFreeBoard(BoardVO board) throws SQLException {
		session.delete("Board-Mapper.deleteFreeBoard", board);
		
	}

	@Override
	public int selectFreeBoardSeqNext() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
//EventBoard
	

	
	//eventboard insert
	@Override
	public void insertEboard(BoardVO board) throws SQLException {
		System.out.println("dao =====================================================================");
		System.out.println(board.getBoard_no());
		System.out.println(board.getBoardtype_no());
		System.out.println(board.getBoard_writer());
		System.out.println(board.getBoard_title());
		System.out.println(board.getBoard_cont());
		System.out.println(board.getBoard_rgdt());
		System.out.println(board.getBoard_cnt());
		System.out.println(board.getEboard_status());
		session.update("Board-Mapper.insertEboard", board);
		
	}

	//eventboard update
	@Override
	public void updateEboard(BoardVO board) throws SQLException {
		
		session.update("Board-Mapper.updateEboard", board);
		
	}
	
	//eventboard detail
	@Override
	public BoardVO getEboardDetail(BoardVO board) throws SQLException {
		
		return session.selectOne("Board-Mapper.getEboardDetail", board);
		
	}
	
	@Override
	public void deleteEboard(int board_no) throws SQLException {
		
		session.delete("Board-Mapper.deleteEboard", board_no);
		
	}
	

	
	
//첨부파일	
	
	/* 첨부파일 시퀀스 가져오기  */
	@Override
	public int getSeqNextValue() throws SQLException {
		return session.selectOne("Board-Mapper.selectNoticeAtcSeqNext");
	}
	/* 게시판에 업로드한 파일 리스트 가져오기 */
	@Override
	public List<AttachVO> fileUploadList(int unityatchmnflno) throws SQLException {
		return session.selectList("Board-Mapper.boardAttachList",unityatchmnflno);
	}

	//댓글 개수 가져오
	@Override
	public int getbreplyTotalCount(int board_no) throws SQLException {
		
	return session.selectOne("Board-Mapper.breplyTotalCount", board_no);
	
	}

	@Override
	public int pinTotalCount(int boardtype_no) throws SQLException {
		return session.selectOne("Board-Mapper.pinTotalCount",boardtype_no);
	}

	
	@Override
	public void insertLike(LikeToVO likeTo) throws SQLException {
		session.insert("Board-Mapper.insertLike", likeTo);
	}

	@Override
	public void deleteLike(LikeToVO likeTo) throws SQLException {
		session.update("Board-Mapper.deleteLike",likeTo);
	}

	@Override
	public void boardLikeup(LikeToVO likeTo) throws SQLException {
		session.update("Board-Mapper.boardLikeup",likeTo);
	}

	@Override
	public void boardLikedown(LikeToVO likeTo) throws SQLException {
		session.update("Board-Mapper.boardLikedown",likeTo);
	}
	
	@Override
	public LikeToVO selectLikeEmp(LikeToVO likeTo) throws SQLException {
		LikeToVO like = session.selectOne("Board-Mapper.selectLikeEmp", likeTo);
		return like;
	}

	@Override
	public List<PopupVO> getPopUpList() throws SQLException {
		return session.selectList("Board-Mapper.popupList");
	}

	
	

	
}
