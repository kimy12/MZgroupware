package com.mzgw.feed.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.FeedLikeVO;
import com.mzgw.dto.FeedReplyVO;
import com.mzgw.dto.FeedVO;
import com.mzgw.feed.dao.FeedDAO;

public class FeedServiceImpl implements FeedService {

	private FeedDAO feedDAO;

	public void setFeedDAO(FeedDAO feedDAO) {
		this.feedDAO = feedDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	

	/* 피드 내용 가져오기 */
	@Override
	public FeedVO getFeedContent(String loginEmp) throws SQLException {
		return feedDAO.selectFeed(loginEmp);
	}

	/* 피드 댓굴 리스트 */
	@Override
	public List<FeedReplyVO> getFeedReplyList(int replyNo) throws SQLException {
		return feedDAO.feedReplyList(replyNo);
	}

	/* 댓글 달기 */
	@Override
	public void insertFeedReply(FeedReplyVO rvo) throws SQLException {
		feedDAO.insertReply(rvo);
	}
	
	/* 댓글 수정 */
	@Override
	public void updateFeedReply(FeedReplyVO rvo) throws SQLException {
		feedDAO.updateReply(rvo);
	}
	
	/* 댓글 삭제 */
	@Override
	public void deleteFeedReply(FeedReplyVO rvo) throws SQLException {
		feedDAO.deleteReply(rvo);;
	}


	/* 피드 주소록 */
	@Override
	public List<FeedVO> getFeedAdressList() throws SQLException {
		return feedDAO.feedAddressList();
	}
	
	/* 닉네임 변경 */
	@Override
	public void nicNameUpdate(FeedVO fvo) throws SQLException {
		feedDAO.nicNameUpdate(fvo);
	}

	/* 닉네임 중복 검사 회원 닉네임 리스트 */
	@Override
	public List<EmpVO> getEmpNicNameList() throws SQLException {
		return feedDAO.empNicNameList();
	}


	/* 상태 메세지 변경 */
	@Override
	public void messageUpdate(FeedVO fvo) throws SQLException {
		feedDAO.messageUpdate(fvo);
	}

	/* 피드 좋아요 up */
	@Override
	public void insertLike(FeedLikeVO likeTo) throws SQLException {
		feedDAO.insertLike(likeTo);
	}
	
	/* 피드 좋아요 Number up */
	@Override public void feedLikeup(FeedLikeVO likeTo) throws SQLException { 
		feedDAO.feedLikeup(likeTo);
	}

	/* 좋아요 목록 가져오기 */
	@Override
	public FeedLikeVO selectLikeEmp(FeedLikeVO likeTo) throws SQLException {
		return feedDAO.selectLikeEmp(likeTo);
	}

	/* 좋아요 목록 지우기*/
	@Override
	public void deleteLike(FeedLikeVO likeTo) throws SQLException {
		feedDAO.deleteLike(likeTo);
	}

	/* 좋아요 숫자 내리기*/
	@Override
	public void feedLikedown(FeedLikeVO likeTo) throws SQLException {
		feedDAO.feedLikedown(likeTo);
	}

	/* 배경 이미지 바꾸기 */
	@Override
	public void regist(FeedVO fvo) throws Exception {
		feedDAO.backgroundImgUpdate(fvo);
	}

	/* 피드 프로필 사진 변경하기 */
	@Override
	public void profile(FeedVO fvo) throws Exception {
		feedDAO.profileImgUpdate(fvo);
	}

	/* 댓글 시퀀스 가져오기  */
	@Override
	public int getFeedSeqNext() throws Exception {
		return feedDAO.feedSeqNext();
	}
	

	/* 이미지 리스트 */
	@Override
	public Map<String, Object> feedContentImgList(FeedVO fvo) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<AttachVO> upFileList = feedDAO.feedContentImgList(fvo);

		dataMap.put("upFileList", upFileList);
		
		return dataMap;
	}



	/* 피드 이미지 추가 */
	@Override
	public void selectInsertFeedImgContent(FeedVO fvo) throws Exception {
		
		int ano = attachDAO.getAnoSeqNextValue();
		
		
		
		
		System.out.println(fvo.getUnity());
		System.out.println(fvo.getEmpNo());
		System.out.println("서비스 입니다!!!!!!!!!!!!!!!!!!!!");
		
		
		
		if(fvo.getUnity() == -1) {
			int fno = feedDAO.feedUnitySeqNumber();
			fvo.setUnity(fno);
			
			for(AttachVO attach : fvo.getAttachList()) {
				attach.setUnityatchmnflno(fno);
				attach.setAno(ano);
			
				System.out.println(attach.getUnityatchmnflno());
				System.out.println(attach.getAno());
				System.out.println(attach.getOriginalname());
				System.out.println(attach.getFileName());
				System.out.println(attach.getUploadPath());
				System.out.println(attach.getFilesize());
				System.out.println(attach.getFileType());
				
				System.out.println("서비스1");
				attachDAO.insertAttach(attach);
				feedDAO.insertFeedContent(fvo);
			}
		}else {
			for(AttachVO attach : fvo.getAttachList()) {
				
				
				attach.setUnityatchmnflno(fvo.getUnity());
				attach.setAno(ano);
				
				System.out.println(attach.getAno());
				System.out.println(attach.getFileName());
				System.out.println(attach.getFilesize());
				System.out.println(attach.getFileType());
				System.out.println(attach.getOriginalname());
				System.out.println(attach.getUnityatchmnflno());
				System.out.println(attach.getUploadPath());
				
				System.out.println("서비스2");
				attachDAO.insertAttach(attach);
			}
		}
		
	}


	@Override
	public void deleteFeedContent(AttachVO avo) throws Exception {
			 System.out.println(avo.getUnityatchmnflno());
		   System.out.println(avo.getAno());
		   System.out.println("서비스 확인하기~");
		
		
		feedDAO.deleteFeedContent(avo);
	}



	

}
