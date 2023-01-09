package com.mzgw.command;

import com.mzgw.dto.ClubBoardVO;

public class ClubBoardModifyCommand extends ClubBoardRegistCommand{
	
		private int clubboard_no;
		private int clubboardtype_no;
		private String clubboard_title;
		private String clubboard_cont;
		private int unityatchmnflno;
		private String[] deleteFile;
		private int pin;
		private String clubboard_writer;
		
		

		
		public int getPin() {
			return pin;
		}

		public void setPin(int pin) {
			this.pin = pin;
		}

		public String getClubboard_writer() {
			return clubboard_writer;
		}

		public void setClubboard_writer(String clubboard_writer) {
			this.clubboard_writer = clubboard_writer;
		}

		public int getClubboard_no() {
			return clubboard_no;
		}

		public void setClubboard_no(int clubboard_no) {
			this.clubboard_no = clubboard_no;
		}

		public int getClubboardtype_no() {
			return clubboardtype_no;
		}

		public void setClubboardtype_no(int clubboardtype_no) {
			this.clubboardtype_no = clubboardtype_no;
		}

		public String getClubboard_title() {
			return clubboard_title;
		}

		public void setClubboard_title(String clubboard_title) {
			this.clubboard_title = clubboard_title;
		}

		public String getClubboard_cont() {
			return clubboard_cont;
		}

		public void setClubboard_cont(String clubboard_cont) {
			this.clubboard_cont = clubboard_cont;
		}

		public int getUnityatchmnflno() {
			return unityatchmnflno;
		}

		public void setUnityatchmnflno(int unityatchmnflno) {
			this.unityatchmnflno = unityatchmnflno;
		}

		public String[] getDeleteFile() {
			return deleteFile;
		}

		public void setDeleteFile(String[] deleteFile) {
			this.deleteFile = deleteFile;
		}

		@Override
		public ClubBoardVO toClubBoardVO() {
			ClubBoardVO clubBoard = super.toClubBoardVO();
			clubBoard.setClubboard_no(this.clubboard_no);
			clubBoard.setClubboardtype_no(this.clubboardtype_no);
			clubBoard.setClubboard_title(this.clubboard_title);
			clubBoard.setClubboard_cont(this.clubboard_cont);
			clubBoard.setUnityatchmnflno(this.unityatchmnflno);
			clubBoard.setClubboard_writer(this.clubboard_writer);
			clubBoard.setPin(this.pin);
			return clubBoard;
		}
	}

