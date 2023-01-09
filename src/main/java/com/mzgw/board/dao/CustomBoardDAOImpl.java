package com.mzgw.board.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.BoardTypeVO;
import com.mzgw.dto.BoardVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.LikeToVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;
import com.mzgw.util.PageMaker;

public class CustomBoardDAOImpl implements CustomBoardDAO {
	
	private SqlSession session;	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void insertBoard(BoardTypeVO boardType) throws SQLException {
		session.update("CustomBoard-Mapper.insertBoard",boardType);
	}

	@Override
	public BoardTypeVO selectBoardDetail(int bno) throws SQLException {
		
		return session.selectOne("CustomBoard-Mapper.selectBoardDetail", bno);
	}

	@Override
	public void updateBoard(BoardTypeVO boardType) throws SQLException {
		session.update("CustomBoard-Mapper.updateBoard",boardType);
		
	}

	@Override
	public void deleteBoard(int bno) throws SQLException {
		session.update("CustomBoard-Mapper.deleteBoard",bno);
		
	}

	
	
	
	@Override
	public BoardTypeVO selectCustomBoard(int bno) throws SQLException {
		BoardTypeVO board = session.selectOne("CustomBoard-Mapper.selectCustomBoard",bno);
		
		return board;
	}

	@Override
	public List<BoardVO> selectCustomBoardList(int bno) throws SQLException {
		
		return session.selectList("CustomBoard-Mapper.selectCustomBoardList",bno);
	}
	@Override
	public Map<String, Object> selectBoardListByBtno(int btno,Criteria cri,String nowSort) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		System.out.println(offset);
		System.out.println(limit);
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = MakeVOToMap.toMap(cri);
		map.put("nowSort", nowSort);
		map.put("boardtype_no", btno);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<BoardVO> bnoBoardList = session.selectList("CustomBoard-Mapper.selectBoardListByBtno",map, rowBounds);
		
		int totalCount = session.selectOne("CustomBoard-Mapper.selectBoardListCount",map);
		
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("bnoBoardList", bnoBoardList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	
//	첨부파일 시퀀스
	@Override
	public int getSeqNextValue() throws SQLException {
		return session.selectOne("CustomBoard-Mapper.selectBoardSeqNext");
	}
	
	@Override
	public void insertCustomBoard(BoardVO board) throws SQLException {
		
		session.insert("CustomBoard-Mapper.insertCustomBoard", board);
	}
	
	@Override
	public BoardVO selectBoardByBno(BoardVO board) throws SQLException {
		BoardVO cboard = session.selectOne("CustomBoard-Mapper.selectBoardByBno", board);

		return cboard;
	}
	
	@Override
	public void increaseViewCnt(BoardVO board) throws SQLException {

		session.insert("CustomBoard-Mapper.increaseViewCnt", board);

	}

	@Override
	public void updateBoard(BoardVO board) throws SQLException {
		session.update("CustomBoard-Mapper.updateCustomBoard",board);
		
	}

	@Override
	public void deleteCustomBoard(BoardVO board) throws SQLException {
		session.delete("CustomBoard-Mapper.deleteCustomBoard",board);
	
		
	}

	@Override
	public EmpVO selectEmpByBno(BoardVO board) throws SQLException {
		EmpVO emp = session.selectOne("CustomBoard-Mapper.selectEmpByBno", board);
		return emp;
	}

	@Override
	public LikeToVO selectLikeEmp(LikeToVO likeTo) throws SQLException {
		LikeToVO like = session.selectOne("CustomBoard-Mapper.selectLikeEmp", likeTo);
		return like;
	}

	@Override
	public void insertLike(LikeToVO likeTo) throws SQLException {
		session.insert("CustomBoard-Mapper.insertLike", likeTo);
	}

	@Override
	public void deleteLike(LikeToVO likeTo) throws SQLException {
		session.update("CustomBoard-Mapper.deleteLike",likeTo);
	}

	@Override
	public void boardLikeup(LikeToVO likeTo) throws SQLException {
		session.update("CustomBoard-Mapper.boardLikeup",likeTo);
	}

	@Override
	public void boardLikedown(LikeToVO likeTo) throws SQLException {
		session.update("CustomBoard-Mapper.boardLikedown",likeTo);
	}

	@Override
	public List<AttachVO> fileUploadList(BoardVO board) throws SQLException {
		List<AttachVO> uploadList = session.selectList("CustomBoard-Mapper.boardAttachList",board);
		return uploadList;
	}

	@Override
	public void modifyAttach(BoardVO board) throws SQLException {
		session.update("CustomBoard-Mapper.modifyAttach",board);
		
	}
	
	
	
}
