package com.mzgw.feed.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.FeedLikeVO;
import com.mzgw.dto.FeedReplyVO;
import com.mzgw.dto.FeedVO;

public interface FeedService {

	/* 피드 내용 가져오기 */
	public FeedVO getFeedContent(String loginEmp) throws SQLException;
	
	/* 피드 댓굴 리스트 */
	public List<FeedReplyVO> getFeedReplyList(int replyNo) throws SQLException;
	
	/* 피드 댓굴 작성 */
	public void insertFeedReply(FeedReplyVO rvo)throws SQLException;
	
	/* 피드 댓굴 수정 */
	public void updateFeedReply(FeedReplyVO rvo)throws SQLException;
	
	/* 피드 댓굴 삭제 */
	public void deleteFeedReply(FeedReplyVO rvo)throws SQLException;
	
	/* 피드 주소록 */
	public List<FeedVO> getFeedAdressList()throws SQLException;

	/* 종아요 목록 가져오기 */
	public FeedLikeVO selectLikeEmp(FeedLikeVO likeTo) throws SQLException;
	
	/* 닉네임 변경 */
	public void nicNameUpdate(FeedVO fvo)throws SQLException;
	
	/* 닉네임 중복 검사 회원 닉네임 리스트 */
	public List<EmpVO> getEmpNicNameList()throws SQLException;
	
	/* 상태 메세지 변경 */
	public void messageUpdate(FeedVO fvo)throws SQLException;
	
	/* 좋아요 기능 */
	public void insertLike(FeedLikeVO likeTo) throws SQLException;
	
	/* 피드 좋아요 Number up */
	public void feedLikeup(FeedLikeVO likeTo) throws SQLException;
	
	public void deleteLike(FeedLikeVO likeTo) throws SQLException;
	
	public void feedLikedown(FeedLikeVO likeTo) throws SQLException;
	
	/* 배경 이미지 바꾸기 */
	public void regist(FeedVO fvo) throws Exception;
	
	/* 피드 프로필 사진 변경하기 */
	public void profile(FeedVO fvo) throws Exception;
	
	/* 댓글 시퀀스 가져오기  */
	public int getFeedSeqNext() throws Exception;
	
	/* 피드 이미지 추가 */
	public void selectInsertFeedImgContent(FeedVO fvo) throws Exception;
	
	/* 이미지 리스트 */
	public Map<String, Object> feedContentImgList(FeedVO fvo)throws Exception;
	
	/* 피드 파일 삭제하기 */
	public void deleteFeedContent(AttachVO avo)throws Exception;
	
}
