package com.mzgw.command;

import com.mzgw.dto.BoardVO;

public class BoardModifyCommand extends BoardRegistCommand{
	
	private int board_no;
	private int boardtype_no;
	private String board_title;
	private String board_cont;
	private int unityatchmnflno;
	private String[] deleteFile;
	private String board_head;
	
	
	
	
	

	public String getBoard_head() {
		return board_head;
	}
	public void setBoard_head(String board_head) {
		this.board_head = board_head;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_cont() {
		return board_cont;
	}
	public void setBoard_cont(String board_cont) {
		this.board_cont = board_cont;
	}
	public int getUnityatchmnflno() {
		return unityatchmnflno;
	}
	public void setUnityatchmnflno(int unityatchmnflno) {
		this.unityatchmnflno = unityatchmnflno;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getBoardtype_no() {
		return boardtype_no;
	}
	public void setBoardtype_no(int boardtype_no) {
		this.boardtype_no = boardtype_no;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	

	@Override
	public BoardVO toBoardVO() {
		BoardVO board = super.toBoardVO();
		board.setBoard_no(this.board_no);
		board.setBoardtype_no(this.boardtype_no);
		board.setBoard_title(this.board_title);
		board.setBoard_cont(this.board_cont);
		board.setUnityatchmnflno(this.unityatchmnflno);
		board.setBoard_head(this.board_head);
		return board;
	}
}
