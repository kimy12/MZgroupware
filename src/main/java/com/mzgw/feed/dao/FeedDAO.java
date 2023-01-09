package com.mzgw.feed.dao;

import java.sql.SQLException;
import java.util.List;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.FeedLikeVO;
import com.mzgw.dto.FeedReplyVO;
import com.mzgw.dto.FeedVO;
import com.mzgw.dto.LikeToVO;

public interface FeedDAO {
	
	/* 피드 내용 가져오기 */
	public FeedVO selectFeed(String empNo)throws SQLException;
	
	/* 댓글 리스트 가져오기  */
	public List<FeedReplyVO> feedReplyList(int replyNo) throws SQLException;
	
	/* 피드 댓굴 작성 */
	public void insertReply(FeedReplyVO rvo)throws SQLException;
	
	/* 피드 댓굴 수정 */
	public void updateReply(FeedReplyVO rvo)throws SQLException;
	
	/* 피드 댓굴 삭제 */
	public void deleteReply(FeedReplyVO rvo)throws SQLException;
	
	/* 피드 주소록 가져오기 */
	public List<FeedVO> feedAddressList()throws SQLException;
	
	/* 닉네임 변경 */
	public void nicNameUpdate(FeedVO fvo)throws SQLException;
	
	/* 닉네임 중복 검사 회원 닉네임 리스트 */
	public List<EmpVO> empNicNameList()throws SQLException;
	
	/* 상태 메세지 변경 */
	public void messageUpdate(FeedVO fvo)throws SQLException;
	
	/* 좋아요 목록 리스트 */
	public FeedLikeVO selectLikeEmp(FeedLikeVO likeTo) throws SQLException;
	
	/* 좋아요기능 초기 등록 */
	public void insertLike(FeedLikeVO likeTo) throws SQLException;
	
	public void deleteLike(FeedLikeVO likeTo) throws SQLException;
	
	/* 피드 좋아요 Number up */
	public void feedLikeup(FeedLikeVO likeTo) throws SQLException;

	public void feedLikedown(FeedLikeVO likeTo) throws SQLException;
	
	/* 피드 배경 이미지 변경 */
	public void backgroundImgUpdate(FeedVO fvo) throws SQLException;
	
	/* 피드 프로필 사진 변경하기 */
	public void profileImgUpdate(FeedVO fvo) throws SQLException;
	
	/* 피드 시퀀스 불러오기 */
	public int feedSeqNext()throws SQLException;
	
	/* 피드 이미지 넣기 */
	public int feedUnitySeqNumber()throws SQLException;
	
	/* 통합첨부파일 번호 체크 하기 */
	public void insertFeedContent(FeedVO fvo)throws SQLException;
	
	/* 피드 이미지 리스트 가져오기 */
	public List<AttachVO> feedContentImgList(FeedVO fvo)throws SQLException;
	
	/* 피드 이미지 영상 파일 삭제하기 */
	public void deleteFeedContent(AttachVO avo)throws SQLException;
}
