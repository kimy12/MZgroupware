package com.mzgw.club.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.club.dao.ClubBoardDAO;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.ClubBoardVO;
import com.mzgw.dto.ClubLikeToVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;


public class ClubBoardServiceImpl implements ClubBoardService{
	
	private ClubBoardDAO clubBoardDAO;
	public void setClubDAO(ClubBoardDAO clubBoardDAO) {
		this.clubBoardDAO = clubBoardDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	@Override
	public Map<String, Object> getClubBoardList(int clubNo,Criteria cri, String nowSort) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Map<String, Object> clubGalleryList = clubBoardDAO.getClubGalleryList(clubNo,cri, nowSort);
		
		dataMap.put("clubGalleryList", clubGalleryList);
	
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getClubFreeBoardList(int clubNo, Criteria cri, String nowSort) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Map<String, Object> clubFreeBoardMap = clubBoardDAO.getClubBoardList(clubNo,cri, nowSort);
		dataMap.put("clubFreeBoardMap", clubFreeBoardMap);
		
		return dataMap;
	}
	
	
	@Override
	public Map<String, Object> getClubNoticeList(int clubNo, Criteria cri, String nowSort) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Map<String, Object> clubNoticeBoardMap = clubBoardDAO.getClubNoticeBoardList(clubNo,cri, nowSort);
		dataMap.put("clubNoticeBoardMap", clubNoticeBoardMap);
		
		return dataMap;
	}
	
	

	@Override
	public Map<String, Object> getGalleryImageList(AttachVO attach) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<AttachVO> galleryImageList = attachDAO.selectGalleryImages(attach);
		dataMap.put("galleryImageList", galleryImageList);
		
		return dataMap;
	}
	
	
	
	
	@Override
	public void registClubBoard(ClubBoardVO clubBoard) throws SQLException {
		

		int cbno = clubBoardDAO.getSeqNextValue();
		System.out.println(cbno);
		clubBoard.setUnityatchmnflno(cbno);
		int i = 0;
		
		if(clubBoard.getAttachList() != null) {
			for (AttachVO attach : clubBoard.getAttachList()) {
				attach.setUnityatchmnflno(cbno);
				attach.setAno(++i);
				attachDAO.insertAttach(attach);
				System.out.println("어태치리스트가 널");
			}
		}else {
			clubBoard.setUnityatchmnflno(-1);
		}
		clubBoardDAO.insertClubBoard(clubBoard);
		
		
		
	}

	@Override
	public ClubBoardVO getClubBoard(ClubBoardVO clubBoard) throws SQLException {
		clubBoardDAO.increaseViewCnt(clubBoard);
		ClubBoardVO cboard = clubBoardDAO.selectBoardByBoardNo(clubBoard);
		return cboard;
	}

	@Override
	public ClubBoardVO getClubBoardForModify(ClubBoardVO clubBoard) throws SQLException {
		
		ClubBoardVO cboard = clubBoardDAO.selectBoardByBoardNo(clubBoard);
		return cboard;
	}

	@Override
	public List<AttachVO> getfileUploadList(ClubBoardVO clubBoard) throws Exception {
		List<AttachVO> upFileList = clubBoardDAO.fileUploadList(clubBoard);
		return upFileList;
	}

	@Override
	public void modifyAttachByUnifromclub(ClubBoardVO clubBoard) throws SQLException {
		
		int bno = clubBoardDAO.getSeqNextValue();
		System.out.println(bno);
		clubBoard.setUnityatchmnflno(bno);
		
		int i = 0;
		
		if(clubBoard.getAttachList() != null) {
			for (AttachVO attach : clubBoard.getAttachList()) {
				attach.setUnityatchmnflno(bno);
				attach.setAno(++i);
				attachDAO.insertAttach(attach);
				System.out.println("어태치리스트가 널");
			}
		}else {
			clubBoard.setUnityatchmnflno(-1);
		}
		clubBoardDAO.modifyAttach(clubBoard);
	}

	@Override
	public void remove(ClubBoardVO clubBoard) throws SQLException {
		int uni= clubBoard.getUnityatchmnflno();
		clubBoardDAO.deleteClubBoard(clubBoard);
		attachDAO.deleteAttach(uni);
	}

	@Override
	public AttachVO getGalleryListImage(AttachVO atch) throws SQLException {
		return attachDAO.selectGalleryListImage(atch);
	}
	
	@Override
	public AttachVO getGalleryImageForDetail(AttachVO atch) throws SQLException {
		return attachDAO.selectAttachPds(atch);
	}

	@Override
	public ClubBoardVO getGalleryDetail(int no) throws SQLException {
		return clubBoardDAO.selectGalleryDetail(no);
	}
	


	@Override
	public void deleteGalleryContent(ClubBoardVO clubBoard) throws SQLException {
		clubBoardDAO.deleteGalleryContent(clubBoard);
	}

	@Override
	public void insertLike(ClubLikeToVO likeTo) throws SQLException {
		clubBoardDAO.insertLike(likeTo);
		
	}

	@Override
	public void deleteLike(ClubLikeToVO likeTo) throws SQLException {
		clubBoardDAO.deleteLike(likeTo);
		
	}

	@Override
	public void boardLikeup(ClubLikeToVO likeTo) throws SQLException {
		clubBoardDAO.boardLikeup(likeTo);
		
	}

	@Override
	public void boardLikedown(ClubLikeToVO likeTo) throws SQLException {
		clubBoardDAO.boardLikedown(likeTo);
		
	}

	@Override
	public ClubLikeToVO selectLikeEmp(ClubLikeToVO likeTo) throws SQLException {
		ClubLikeToVO like = clubBoardDAO.selectLikeEmp(likeTo);
		return like;
	}

	@Override
	public EmpVO selectEmpByBno(ClubBoardVO clubBoard) throws SQLException {
		 EmpVO emp=clubBoardDAO.selectEmpByBno(clubBoard);
		return emp;
	}

	@Override
	public int pinTotalCount(int clubNo) throws SQLException {
		int pinTotalCount = clubBoardDAO.pinTotalCount(clubNo);
		return pinTotalCount;
	}

}



