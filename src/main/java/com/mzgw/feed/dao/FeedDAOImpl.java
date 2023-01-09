package com.mzgw.feed.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.FeedLikeVO;
import com.mzgw.dto.FeedReplyVO;
import com.mzgw.dto.FeedVO;
import com.mzgw.dto.LikeToVO;

public class FeedDAOImpl implements FeedDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	/* 피드 내용 가져오기 */
	@Override
	public FeedVO selectFeed(String empNo) throws SQLException {
		return session.selectOne("Feed-Mapper.selectFeed", empNo);
	}

	/* 피드 리스트 */
	@Override
	public List<FeedReplyVO> feedReplyList(int replyNo) throws SQLException {
		return session.selectList("Feed-Mapper.feedReplyList", replyNo);
	}

	/* 피드 댓굴 작성 */
	@Override
	public void insertReply(FeedReplyVO rvo) throws SQLException {
		session.update("Feed-Mapper.feedReplyInsert", rvo);
	}
	
	/* 피드 댓굴 수정 */
	@Override
	public void updateReply(FeedReplyVO rvo) throws SQLException {
		session.update("Feed-Mapper.feedReplyModify", rvo);
	}
	
	/* 피드 댓굴 삭제 */
	@Override
	public void deleteReply(FeedReplyVO rvo) throws SQLException {
		session.delete("Feed-Mapper.deleteReply" , rvo);
	}

	/* 닉네임 변경 */
	@Override
	public void nicNameUpdate(FeedVO fvo) throws SQLException {
		session.update("Feed-Mapper.nicNameModify", fvo);
	}
	
	/* 닉네임 중복 검사 회원 닉네임 리스트 */
	@Override
	public List<EmpVO> empNicNameList() throws SQLException {
		return session.selectList("Feed-Mapper.empNicNameList");
	}

	/* 피드 주소록 */
	@Override
	public List<FeedVO> feedAddressList() throws SQLException {
		return session.selectList("Feed-Mapper.feedAddressList");
	}
	
	/* 상태메시지 수정 */
	@Override
	public void messageUpdate(FeedVO fvo) throws SQLException {
		session.update("Feed-Mapper.messageModify", fvo);
	}
	
	/* 좋아요 목록 리스트 */
	@Override
	public FeedLikeVO selectLikeEmp(FeedLikeVO likeTo) throws SQLException {
		return session.selectOne("Feed-Mapper.selectLikeEmp", likeTo);
	}

	/* 피드 좋아요 up */
	@Override
	public void insertLike(FeedLikeVO likeTo) throws SQLException {
		session.update("Feed-Mapper.insertLike", likeTo);
	}
	
	/* 피드 좋아요 Number up */
	@Override public void feedLikeup(FeedLikeVO likeTo) throws SQLException{
		session.update("Feed-Mapper.feedLikeup", likeTo);
	}

	@Override
	public void deleteLike(FeedLikeVO likeTo) throws SQLException {
		session.delete("Feed-Mapper.deleteLike", likeTo);
	}

	@Override
	public void feedLikedown(FeedLikeVO likeTo) throws SQLException {
		session.update("Feed-Mapper.feedLikedown", likeTo);
	}

	/* 배경 이미지 바꾸기  */
	@Override
	public void backgroundImgUpdate(FeedVO fvo) throws SQLException {
		session.update("Feed-Mapper.backgroundImgUpdate", fvo);
	}

	/* 피드 프로필 사진 변경하기 */
	@Override
	public void profileImgUpdate(FeedVO fvo) throws SQLException {
		session.update("Feed-Mapper.profileImgUpdate", fvo);
	}

	@Override
	public int feedSeqNext() throws SQLException {
		return session.selectOne("Feed-Mapper.feedSeqNext");
	}

	
	/* 통합첨부파일 번호 체크 하기 */
	@Override
	public int feedUnitySeqNumber() throws SQLException {
		return session.selectOne("Feed-Mapper.selectFileSeqNext");
	}

	/* 피드 이미지 넣기 */
	@Override
	public void insertFeedContent(FeedVO fvo) throws SQLException {
		
		for(AttachVO attach : fvo.getAttachList()) {
			System.out.println(attach.getAno());
			System.out.println(attach.getFileName());
			System.out.println(attach.getFilesize());
			System.out.println(attach.getFileType());
			System.out.println(attach.getOriginalname());
			System.out.println(attach.getUnityatchmnflno());
			System.out.println(attach.getUploadPath());
		}
		
		System.out.println(fvo.getUnity());
		System.out.println(fvo.getEmpNo());
		System.out.println("DAO 입니다!!!!!!!!!!!!!!!!!!!!");
		
		session.update("Feed-Mapper.insertFeedContent", fvo);
	}

	/* 피드 이미지 리스트 */
	@Override
	public List<AttachVO> feedContentImgList(FeedVO fvo) throws SQLException {
		return session.selectList("Feed-Mapper.feedContentImgList" , fvo);
	}

	@Override
	public void deleteFeedContent(AttachVO avo) throws SQLException {
		 System.out.println(avo.getUnityatchmnflno());
		   System.out.println(avo.getAno());
		   System.out.println("DAO 확인하기~");
		
		
		session.delete("Feed-Mapper.feedAttachDelete", avo);
	}





}
