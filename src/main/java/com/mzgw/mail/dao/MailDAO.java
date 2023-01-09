package com.mzgw.mail.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.MailVO;
import com.mzgw.dto.ReceVO;
import com.mzgw.dto.RefeVO;
import com.mzgw.util.Criteria;

public interface MailDAO {

	
	/* 메일 총 갯수 */
	public int mailTotalCount()throws SQLException;
	
	/* 보낸메일 조회 */
	Map<String, Object> sendMailList(EmpVO loginEmp,String nowSort, Criteria cri) throws Exception;
	
	/* 받은메일 조회 */
	Map<String, Object> receMailList(EmpVO loginEmp,String nowSort, Criteria cri) throws Exception;
	
	/* 임시저장함 조회 */
	Map<String, Object> storegeMailList(EmpVO loginEmp,String nowSort, Criteria cri) throws Exception;
	
	/* 보낸 메일 휴지통 조회 */
	List<MailVO> removeSendMailList(EmpVO loginEmp) throws SQLException;
	
	/* 받은 메일 휴지통 조회 */
	List<MailVO> removeReceMailList(EmpVO loginEmp) throws SQLException;
	
	/* 메일 주소 리스트 조회 */
	List<EmpVO> empMailList() throws SQLException;
	
	/* 메일 작성 */
	public int insertMail(MailVO vo) throws SQLException;

	/* 첨부파일 코드 번호 */
	public int getSeqNextValue() throws SQLException;
	
	/* 메일번호 가져오기 */
	public int getEmailNoSeqNextValue() throws SQLException;
	
	/* 받는사람 넣기 */
	public int insertReceEmp(ReceVO rvo) throws SQLException;
	
	/* 참조 넣기 */
	public int insertRefeEmp(RefeVO rfo) throws SQLException;
	
	/* 메일 상세 페이지 */
	MailVO selectMailByEno(int eno)throws SQLException;
	
	/* 받은사람 이름 리스트 가져오기 */
	List<ReceVO> receEmpList()throws SQLException;
	
	/* 참조자 이름 리스트 가져오기 */
	List<RefeVO> refeEmpList()throws SQLException;
	
	/* 메일에 업로드한 파일 리스트 가져오기 */
	List<AttachVO> fileUploadList() throws SQLException;
	
	/* 최근 30일 받은 사람 목록 조회 */
	List<ReceVO> recentlyList(EmpVO loginEmp)throws SQLException;
	
	/* 받은 메일함 삭제 여부 코드 수정*/
	public void ReceUpdateRemoveCode(int eno) throws SQLException;
	
	/* 보낸 메일함 삭제 여부 코드 수정*/
	public void SendUpdateRemoveCode(int eno) throws SQLException;
	
	/* 읽음 표시 데이터 */
	public void StateUpdate(int eno)throws SQLException;
	
	/* 보낸 메일 영구삭제 */
	public void sendDeleteMail(MailVO sendVo)throws SQLException;
	
	/* 받은 메일 영구삭제 */
	public void receDeleteMail(ReceVO receVo)throws SQLException;
	
	/* 임시 저장 메일 보내기 */
	public void storageUpdate(int eno)throws SQLException;
	
	/* 보낸 메일 복원삭제 */
	public void sendReturnMail(int eno)throws SQLException;
	
	/* 받은 메일 복원삭제 */
	public void receReturnMail(int eno)throws SQLException;
	/* 대쉬보드*/
	List<MailVO> dashboardAll(EmpVO loginEmp) throws SQLException;
	
	
	List<MailVO> dashboardTrash(EmpVO loginEmp) throws SQLException;
	
	
	Map<String, Object> selectMailListCount(EmpVO loginEmp) throws Exception;
	

	
}
