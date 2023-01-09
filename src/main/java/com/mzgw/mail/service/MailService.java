package com.mzgw.mail.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.MailDeleteVO;
import com.mzgw.dto.MailVO;
import com.mzgw.dto.ReceVO;
import com.mzgw.dto.RefeVO;
import com.mzgw.util.Criteria;

public interface MailService {
	

	/* 보낸메일 리스트 조회 */
	public Map<String, Object> getSendMailList(EmpVO loginEmp, Criteria cri, String nowSort) throws Exception;

	/* 받은메일 리스트 조회 */
	public Map<String, Object> getReceMailList(EmpVO loginEmp, Criteria cri, String nowSort) throws Exception;

	/* 임시저장 리스트 조회 */
	public Map<String, Object> getStorageMailList(EmpVO loginEmp, Criteria cri, String nowSort) throws Exception;

	/* 메일 휴지통 조회 */
	public Map<String, Object> getRemoveMailList(EmpVO loginEmp) throws SQLException;
	
	/* 메일주소 리스트 조회 */
	public Map<String, Object> getEmpMailList() throws SQLException;

	/* 메일 전송 */
	public void regist(MailVO vo, List<ReceVO> empList, List<RefeVO> refList, String tempor) throws SQLException;
	
	/* 메일 상세 */
	public MailVO getMailDetail(int eno)throws SQLException;
	
	/* 받은사람 이름 리스트 가져오기 */
	public Map<String, Object> getReceEmpList()throws SQLException;
	
	/* 받은사람 이름 리스트 가져오기 */
	public Map<String, Object> getRefeEmpList()throws SQLException;
	
	/* 메일에 업로드한 파일 리스트 가져오기 */
	public Map<String, Object> getfileUploadList() throws SQLException;
	
	/* 보낸 메일함 휴지통 코드 바꾸기 */
	public void SendUpdateRemoveCode(List<Integer>removeCodeArray) throws SQLException;
	
	/* 받은 메일함 휴지통 코드 바꾸기 */
	public void ReceUpdateRemoveCode(List<Integer>removeCodeArray) throws SQLException;
	
	/* 읽음 상태 코드 바꾸기  */
	public void StateUpdate(List<Integer>removeCodeArray) throws SQLException;
	
	/* 영구 삭제하기  */
	public void deleteMail(List<MailDeleteVO> allArray) throws SQLException;
	
	/* 임시저장 메일 보내기  */
	public void storageSendMail(int eno)throws SQLException;
	
	/* 메일 복원하기  */
	public void returnMail(MailDeleteVO allArray) throws SQLException;
	
	/* 파일 다운로드 */
	public AttachVO getAttach(AttachVO attach) throws SQLException;

	/* zip 다운로드 */
	public List<String> downloadAttachList(List<AttachVO> attach) throws SQLException;
	
	public Map<String, Object> getdashboardAll(EmpVO loginEmp) throws SQLException;
	public Map<String, Object> getdashboardTrash(EmpVO loginEmp) throws SQLException;
	Map<String, Object> getMailListCount(EmpVO loginEmp) throws Exception;
	
	/* 최근 30일 안에 보낸 주소록 */
	public Map<String, Object> getRecentlyList(EmpVO loginEmp)throws SQLException;
}
