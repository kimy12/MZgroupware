package com.mzgw.command;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mzgw.dto.BoardVO;

public class BoardRegistCommand {
	

	private String board_writer;
	private String board_title;
	private String board_cont;
	private String pin;
	private int unityatchmnflno;
	private List<MultipartFile> uploadFile;
	private String start_date;
	private String end_date;
	private String boardhead;
	
	
	
	
	public String getBoardhead() {
		return boardhead;
	}

	public void setBoardhead(String boardhead) {
		this.boardhead = boardhead;
	}

	public String getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
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

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public int getUnityatchmnflno() {
		return unityatchmnflno;
	}

	public void setUnityatchmnflno(int unityatchmnflno) {
		this.unityatchmnflno = unityatchmnflno;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}




	public BoardVO toBoardVO() {
		BoardVO board = new BoardVO();
		
				
			board.setBoard_writer(this.board_writer);
			board.setBoard_title(this.board_title);
			board.setBoard_cont(this.board_cont);
			board.setUnityatchmnflno(this.unityatchmnflno);
			board.setPin(this.pin);
			board.setStart_date(this.start_date);
			board.setEnd_date(this.end_date);
			board.setBoard_head(this.boardhead);
		return board;
		
		
	}
	
	

}
